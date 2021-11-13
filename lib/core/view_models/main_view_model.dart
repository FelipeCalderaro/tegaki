import 'dart:async';

import 'package:anilist_app/core/enums/media_status.dart';
import 'package:anilist_app/core/models/anime_list_collection_model.dart';
import 'package:anilist_app/core/models/character_info_model.dart';
import 'package:anilist_app/core/models/defalt_info_model.dart';
import 'package:anilist_app/core/models/info_model.dart';
import 'package:anilist_app/core/models/manga_list_collection_model.dart';
import 'package:anilist_app/core/models/save_media_entry_model.dart';
import 'package:anilist_app/core/models/staff_info_model.dart';
import 'package:anilist_app/core/models/user_activity_model.dart';
import 'package:anilist_app/core/models/user_configs_model.dart';
import 'package:anilist_app/core/models/user_in_progress_model.dart';
import 'package:anilist_app/core/models/user_info_model.dart';
import 'package:anilist_app/core/services/anilist_api.dart';
import 'package:anilist_app/core/services/anilist_auth_api.dart';
import 'package:anilist_app/core/view_models/base_view_model.dart';
import 'package:anilist_app/ui/values/styles.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MainViewModel extends BaseViewModel {
  static MainViewModel _mainViewModel = MainViewModel();

  static MainViewModel instance() => _mainViewModel;

  // ---------------> Variables
  AnilistAPI api = AnilistAPI();
  AnilistAuthAPI apiAuth = AnilistAuthAPI();
  List<String> seasons = [
    'WINTER',
    'SPRING',
    'SUMMER',
    'FALL',
  ];

  Completer<WebViewController> _webViewController =
      Completer<WebViewController>();

  DefaultInfoModel? allTimePopular;
  DefaultInfoModel? popularThisSeasonLastEntry;
  DefaultInfoModel? upcomingSeasonLastEntry;
  DefaultInfoModel? trendingNowHome;

  StaffInfoModel? staffInfo;
  UserConfigs? userConfigs;
  UserInfo? userInfo;

  int currentpopularThisSeasonPagination = 1;
  int currentAllTimePopularPagination = 1;
  int currentupcomingSeasonPagination = 1;
  int currentTrendingNowPagination = 1;
  int currentStaffCharacterPage = 1;

  int currentHomeTabIndex = 0;

  dynamic currentDropdownValue = 'CURRENT';

  List<DropdownMenuItem<dynamic>> buttons = [
    DropdownMenuItem(
      value: 'CURRENT',
      child: Text(
        'Watching',
        style: TegakiTextStyles.regular,
      ),
    ),
    DropdownMenuItem(
      value: 'PLANNING',
      child: Text(
        'Plan to watch',
        style: TegakiTextStyles.regular,
      ),
    ),
    DropdownMenuItem(
      value: 'COMPLETED',
      child: Text(
        'Completed',
        style: TegakiTextStyles.regular,
      ),
    ),
    DropdownMenuItem(
      value: 'REPEATING',
      child: Text(
        'Rewatching',
        style: TegakiTextStyles.regular,
      ),
    ),
    DropdownMenuItem(
      value: 'PAUSED',
      child: Text(
        'Paused',
        style: TegakiTextStyles.regular,
      ),
    ),
    DropdownMenuItem(
      value: 'DROPPED',
      child: Text(
        'Dropped',
        style: TegakiTextStyles.regular,
      ),
    ),
  ];

  // ignore: non_constant_identifier_names
  String? BEARER_TOKEN;

  // ---------------> Constructor

  MainViewModel() {
    getPopularThisSeasonHome();
    getUpcomingNextSeasonHome();
    getAllTimePopularHome();
    getTrendingNowHome();
    loadToken();
  }

  void setCurrentDropDownButton(dynamic value) {
    currentDropdownValue = value;
    notifyListeners();
  }

  void setCurrentStaffPageToDefault() {
    currentStaffCharacterPage = 1;
    staffInfo = null;
    notifyListeners();
  }

  void fillWebViewController(WebViewController controller) async {
    _webViewController.complete(controller);
    notifyListeners();
  }

  void webViewPreviousScreen() async {
    _webViewController.future.then(
      (value) {
        value.canGoBack();
        value.goBack();
      },
    );
    notifyListeners();
  }

  void setCurrentHomeTabIndex(int index) {
    currentHomeTabIndex = index;
    notifyListeners();
  }

  void loadToken() async {
    BEARER_TOKEN = await getTOKEN();
    if (BEARER_TOKEN != null) {
      getAuthenticatedInfo();
    }
    notifyListeners();
  }

  void setToken(String redirectedUrl) async {
    if (redirectedUrl.contains('access_token')) {
      String token = redirectedUrl.split('=')[1].replaceAll('&token_type', '');
      BEARER_TOKEN = token;
      getAuthenticatedInfo();
      await setTOKEN(token);
      notifyListeners();
    }
  }

  void getAuthenticatedInfo() async {
    getUserConfigsIfAuthenticated().then(
      (value) {
        getUserInfo(value!.viewer.name);
      },
    );
  }

  Future<dynamic> setTOKEN(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString("bearerToken", token);
  }

  Future<String?> getTOKEN() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("bearerToken");
  }

  Future<bool> clearTOKEN() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.clear(); //("bearerToken");
  }

  bool get homeLoadingNotDone {
    if (allTimePopular != null &&
        popularThisSeasonLastEntry != null &&
        upcomingSeasonLastEntry != null &&
        trendingNowHome != null) {
      return false;
    } else {
      return true;
    }
  }

  String get actualSeason {
    int month = DateTime.now().month;
    if (month >= 3 && month <= 5) {
      return seasons[1];
    } else if (month >= 6 && month <= 8) {
      return seasons[2];
    } else if (month >= 9 && month <= 11) {
      return seasons[3];
    } else {
      return seasons[0];
    }
  }

  String get nextSeason {
    int month = DateTime.now().month;
    if (month >= 3 && month <= 5) {
      return seasons[2];
    } else if (month >= 6 && month <= 8) {
      return seasons[3];
    } else if (month >= 9 && month <= 11) {
      return seasons[0];
    } else {
      return seasons[1];
    }
  }

  // ---------------> Functions

  void sortedByYearEdgeList(List<CharacterMediaEdge> characterMediaEdge) {
    List<SeparatedByYear> newList = [];

    // SeparatedByYear(
    //   year: 2021,
    //   edge: ,
    // )
    // print("CHARACTERS LENGHT ${characterMediaEdge.length}");
    int firstYear =
        characterMediaEdge[characterMediaEdge.length - 1].node.startDate.year;

    int lastYear = characterMediaEdge[0].node.startDate.year == 0
        ? DateTime.now().year
        : characterMediaEdge[0].node.startDate.year;
    print("LIST BEFORE ${characterMediaEdge.length}");

    for (var year = firstYear; year <= lastYear; year++) {
      var edges = characterMediaEdge
          .where((element) => element.node.startDate.year == year)
          .toList();
      print("EDGES LENGTH ${edges.length}");
      if (edges.isNotEmpty) {
        newList.add(
          SeparatedByYear(
            year: year,
            edges: edges,
          ),
        );
      }
    }
    print("NEW LIST AFTER ${newList.length}");
    newList.sort((b, a) => a.year.compareTo(b.year));
    staffInfo!.staff.characterMedia.byYear = newList;
    notifyListeners();
  }

  void loadMoreStaffCharacters(int lastPage, int id) async {
    print('loading more');
    // if (page < lastPage) {
    var response = await api.getStaffInfo(
      id,
      page: currentStaffCharacterPage + 1,
    );
    currentStaffCharacterPage += 1;
    print('loading done');
    print('CHARACTERS LENGHT ${response.staff.characterMedia.edges}');
    staffInfo!.staff.characterMedia.edges
        .addAll(response.staff.characterMedia.edges);
    sortedByYearEdgeList(staffInfo!.staff.characterMedia.edges);
    // } else {
    //   print('loading failed');

    //   return [];
    // }
  }

  Future<DefaultInfoModel?> search(String query) async {
    try {
      var response = await api.search(query);
      if (response is DefaultInfoModel) {
        return response;
      }
    } catch (e) {
      throw e;
    }
  }

  void getPopularThisSeasonHome() async {
    try {
      var response = await api.getPopularThisSeasonHome(
          actualSeason, currentpopularThisSeasonPagination);
      if (response is DefaultInfoModel) {
        popularThisSeasonLastEntry = response;
      }
    } catch (e) {
      throw e;
    }
    notifyListeners();
  }

  void getUpcomingNextSeasonHome() async {
    // try {

    if (actualSeason == 'FALL') {
      var response = await api.getUpcomingSeasonHome(
        nextSeason,
        currentupcomingSeasonPagination,
        DateTime.now().year + 1,
      );
      if (response is DefaultInfoModel) {
        upcomingSeasonLastEntry = response;
      }
    } else {
      var response = await api.getUpcomingSeasonHome(
        nextSeason,
        currentupcomingSeasonPagination,
        DateTime.now().year,
      );
      if (response is DefaultInfoModel) {
        upcomingSeasonLastEntry = response;
      }
    }
    // } catch (e) {
    //   throw e;
    // }
    notifyListeners();
  }

  void getAllTimePopularHome() async {
    try {
      var response =
          await api.getAllTimePopularHome(currentAllTimePopularPagination);
      if (response is DefaultInfoModel) {
        allTimePopular = response;
      }
    } catch (e) {
      throw e;
    }
    notifyListeners();
  }

  void getTrendingNowHome() async {
    // try {
    var response = await api.getTrendingNowHome(currentTrendingNowPagination);
    if (response is DefaultInfoModel) {
      trendingNowHome = response;
    }
    // } catch (e) {
    //   throw e;
    // }
    notifyListeners();
  }

  Future<InfoModel?> getInformation(int id) async {
    // try {
    var response = await api.getInformation(id);
    if (response is InfoModel) {
      return response;
    }
    // } catch (e) {
    // }
  }

  Future<CharacterInfoModel?> getCharacterInfo(int id) async {
    // try {
    var response = await api.getCharacterInfo(id);
    if (response is CharacterInfoModel) {
      return response;
    }
    // } catch (e) {
    //   throw e;
    // }
  }

  Future<StaffInfoModel?> getStaffInfo(int id) async {
    setCurrentStaffPageToDefault();
    // try {
    var response = await api.getStaffInfo(id);
    if (response is StaffInfoModel) {
      staffInfo = response;
      staffInfo!.staff.characterMedia.byYear = [];
      sortedByYearEdgeList(response.staff.characterMedia.edges);
      return response;
    }
    notifyListeners();
    // } catch (e) {
    //   throw e;
    // }
  }

  void allTimePopularNextPage() async {
    try {
      if (allTimePopular!.page.pageInfo?.hasNextPage ?? true) {
        currentAllTimePopularPagination += 1;
        var response =
            await api.getAllTimePopularHome(currentAllTimePopularPagination);
        if (response is DefaultInfoModel) {
          allTimePopular!.page.media.addAll(response.page.media);
        }
      }
      notifyListeners();
    } catch (e) {
      throw e;
    }
  }

  void trendingNowNextPage() async {
    try {
      if (trendingNowHome!.page.pageInfo?.hasNextPage ?? true) {
        currentTrendingNowPagination += 1;
        var response =
            await api.getTrendingNowHome(currentTrendingNowPagination);
        if (response is DefaultInfoModel) {
          trendingNowHome!.page.media.addAll(response.page.media);
        }
      }
      notifyListeners();
    } catch (e) {
      throw e;
    }
  }

  void upcomingNextSeasonNextPage() async {
    try {
      if (upcomingSeasonLastEntry!.page.pageInfo?.hasNextPage ?? true) {
        currentupcomingSeasonPagination += 1;
        var response = await api.getUpcomingSeasonHome(
          nextSeason,
          currentupcomingSeasonPagination,
          DateTime.now().year + 1,
        );
        if (response is DefaultInfoModel) {
          upcomingSeasonLastEntry!.page.media.addAll(response.page.media);
        }
      }
      notifyListeners();
    } catch (e) {
      throw e;
    }
  }

  void popularThisSeasonNextPage() async {
    try {
      if (popularThisSeasonLastEntry!.page.pageInfo?.hasNextPage ?? true) {
        currentpopularThisSeasonPagination += 1;
        var response = await api.getPopularThisSeasonHome(
          actualSeason,
          currentpopularThisSeasonPagination,
        );
        if (response is DefaultInfoModel) {
          popularThisSeasonLastEntry!.page.media.addAll(response.page.media);
        }
      }
      notifyListeners();
    } catch (e) {
      throw e;
    }
  }

  List<int> divMod(int a, int b) {
    return [
      a ~/ b,
      a % b,
    ];
  }

  Stream<String> calculateAiringAt(int timestamp) async* {
    for (var i = 0; i < 120; i++) {
      Duration difference =
          DateTime.fromMillisecondsSinceEpoch(timestamp * 1000)
              .difference(DateTime.now());

      // double days = difference.inMinutes / 86400;
      // double hours = difference.inMinutes / 3600;
      int days;
      int hours;
      int minutes;
      int seconds;

      minutes = divMod(difference.inSeconds, 60)[0];
      seconds = divMod(difference.inSeconds, 60)[1];

      hours = divMod(minutes, 60)[0];
      minutes = divMod(minutes, 60)[1];

      days = divMod(hours, 24)[0];
      hours = divMod(hours, 24)[1];

      String formatedString = "";
      if (days > 0) formatedString += '$days days  ';
      if (hours > 0) formatedString += '$hours hours  ';
      if (minutes > 0) formatedString += '$minutes mins  ';
      if (seconds > 0) formatedString += '$seconds seconds  ';

      formatedString = formatedString.replaceAll("  ", ", ");
      formatedString = formatedString.replaceRange(
          formatedString.length - 2, formatedString.length, '');

      yield formatedString;
      await Future.delayed(Duration(seconds: 1));
    }
  }

  Future<dynamic> getUserInfo(String userName) async {
    // try {
    var response = await api.getUserListsAndInfo(userName);
    if (response is UserInfo) {
      userInfo = response;
    }
    notifyListeners();
    // } catch (e) {
    // }
  }

  // -----------> AUTHENTICATED ONLY

  Future<UserConfigs?> getUserConfigsIfAuthenticated() async {
    // try {
    var response = await apiAuth.getUserAuthenticadedConfigs();
    if (response is UserConfigs) {
      userConfigs = response;
      return response;
    }
    notifyListeners();
    // } catch (e) {
    // }
  }

  Future<InfoModel?> getAuthenticatedInformation(int id) async {
    // try {
    var response = await apiAuth.getAuthenticatedInformation(id);
    if (response is InfoModel) {
      return response;
    }
    // } catch (e) {
    // }
  }

  Future<UserActivity?> getUserActivity() async {
    // try {
    var response = await apiAuth.getUserActivity();
    if (response is UserActivity) {
      return response;
    }
    notifyListeners();
    // } catch (e) {
    // }
  }

  Future<UserInProgress?> getUserInProgressList(int userId) async {
    // try {
    var response = await apiAuth.getUserInProgressList(userId);
    if (response is UserInProgress) {
      return response;
    }
    notifyListeners();
    // } catch (e) {
    // }
  }

  Future<bool> setMediaStatus(int mediaId, MediaStatus mediaStatus) async {
    // try {
    var response = await apiAuth.setMediaStatus(mediaId, mediaStatus);
    if (response is SaveMediaEntry) {
      return true;
    } else {
      return false;
    }
    // } catch (e) {
    // }
  }

  Future<AnimeListCollection?> getAnimeList(int userId, String userName) async {
    // try {
    var response = await apiAuth.getAnimeList(userId, userName);
    if (response is AnimeListCollection) {
      return response;
    }
    // } catch (e) {
    // }
  }

  Future<MangaListCollection?> getMangaList(int userId, String userName) async {
    // try {
    var response = await apiAuth.getMangaList(userId, userName);
    if (response is MangaListCollection) {
      return response;
    }
    // } catch (e) {
    // }
  }

  Future toggleIsFavourite({
    int? animeId,
    int? mangaId,
    int? staffId,
    int? studioId,
    int? characterId,
  }) async {
    // try {
    var response = await apiAuth.toggleIsFavourite(
      animeId: animeId,
      mangaId: mangaId,
      staffId: staffId,
      studioId: studioId,
      characterId: characterId,
    );
    // } catch (e) {
    // }
  }

  void loggout() async {
    BEARER_TOKEN = null;
    if (BEARER_TOKEN != null) await apiAuth.loggout(BEARER_TOKEN!);
    await clearTOKEN();
    // var webController = await _webViewController.future;
    // print('---->> Clearing Browser Cache <<-----');
    // webController.clearCache().then((_) {
    //   print('---->> Loading AUTH URL');
    //   webController.loadUrl('https://anilist.co').then(
    //         (_) => print("Loading send done -----<>"),
    //       );
    // });

    // Failed logout function
    notifyListeners();
  }

  // --------------------<
}
