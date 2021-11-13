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
import 'package:anilist_app/core/services/graphql_api.dart';
import 'package:anilist_app/core/services/querys.dart';
import 'package:anilist_app/core/services/service_locator.dart';
import 'package:anilist_app/core/session/session.dart';
import 'package:graphql/client.dart';

class AnilistAPI extends GraphQL {
  static AnilistAPI _api = AnilistAPI();
  static AnilistAPI instance() => _api;

  // ---------------> Variables
  // ---------------> Constructor
  // ---------------> Functions

  Future<dynamic> search(String query) async {
    try {
      final QueryOptions options = QueryOptions(
        document: gql(Querys.searchQueryModel(query)),
      );
      var response = await client.query(options);
      if (!response.hasException) {
        return DefaultInfoModel.fromJson(response.data!);
      } else {
        throw response.exception.toString();
      }
    } catch (e) {
      throw e;
    }
  }

  Future<dynamic> getPopularThisSeasonHome(String season, int page) async {
    try {
      final QueryOptions options = QueryOptions(
        document: gql(Querys.seasonDefaultInfoModel(
          season,
          page,
          DateTime.now().year,
        )),
      );
      var response = await client.query(options);
      if (!response.hasException) {
        // print(jsonEncode(response.data));
        return DefaultInfoModel.fromJson(response.data!);
      } else {
        throw response.exception.toString();
      }
    } catch (e) {
      throw e;
    }
  }

  Future<dynamic> getUpcomingSeasonHome(
      String season, int page, int year) async {
    try {
      final QueryOptions options = QueryOptions(
        document: gql(Querys.seasonDefaultInfoModel(
          season,
          page,
          year,
        )),
      );
      var response = await client.query(options);
      if (!response.hasException) {
        return DefaultInfoModel.fromJson(response.data!);
      } else {
        throw response.exception.toString();
      }
    } catch (e) {
      throw e;
    }
  }

  Future<dynamic> getAllTimePopularHome(int page) async {
    // try {

    final QueryOptions options = QueryOptions(
      document: gql(Querys.allTimePopularDefaultInfoModel(page)),
    );
    var response = await client.query(options);
    if (!response.hasException) {
      return DefaultInfoModel.fromJson(response.data!);
    } else {
      throw response.exception.toString();
    }
    // } catch (e) {
    //   throw e;
    // }
  }

  Future<dynamic> getTrendingNowHome(int page) async {
    // try {

    final QueryOptions options = QueryOptions(
      document: gql(Querys.trendingNowDefaultInfoModel(page)),
    );
    var response = await client.query(options);
    if (!response.hasException) {
      return DefaultInfoModel.fromJson(response.data!);
    } else {
      throw response.exception.toString();
    }
    // } catch (e) {
    //   throw e;
    // }
  }

  Future<dynamic> getInformation(int id) async {
    // try {

    final QueryOptions options = QueryOptions(
      document: gql(Querys.informationQuery(id)),
    );
    var response = await client.query(options);
    // print(jsonEncode(response.data));
    if (!response.hasException) {
      return InfoModel.fromJson(response.data!);
      // return jsonEncode(response.data);
    } else {
      throw response.exception.toString();
    }

    // } catch (e) {
    // }
  }

  Future<dynamic> getCharacterInfo(int id) async {
    // try {
    final QueryOptions options = QueryOptions(
      document: gql(Querys.characterInfo(id)),
    );
    var response = await client.query(options);
    // print(jsonEncode(response.data));
    if (!response.hasException) {
      return CharacterInfoModel.fromJson(response.data!);
      // return jsonEncode(response.data);
    } else {
      throw response.exception.toString();
    }

    // } catch (e) {
    // }
  }

  Future<StaffInfoModel> getStaffInfo(int id, {int page = 1}) async {
    // try {
    final QueryOptions options = QueryOptions(
      document: gql(Querys.staffInfo(id, page)),
    );
    var response = await client.query(options);
    // print(jsonEncode(response.data));
    if (!response.hasException) {
      return StaffInfoModel.fromJson(response.data!);
      // return jsonEncode(response.data);
    } else {
      throw response.exception.toString();
    }

    // } catch (e) {
    // }
  }

  Future<dynamic> getUserListsAndInfo(String userName) async {
    // try {

    final QueryOptions options =
        QueryOptions(document: gql(Querys.listAndInfo), variables: {
      "name": userName,
    });
    var response = await client.query(options);
    // print(jsonEncode(response.data));
    if (!response.hasException) {
      return UserInfo.fromJson(response.data!);
      // return jsonEncode(response.data);
    } else {
      throw response.exception.toString();
    }
    // } catch (e) {
    // }
  }
}
