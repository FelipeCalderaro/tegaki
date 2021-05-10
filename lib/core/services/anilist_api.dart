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
import 'package:graphql/client.dart';

class AnilistAPI extends GraphQL {
  static AnilistAPI _api = AnilistAPI();
  static AnilistAPI instance() => _api;

  // ---------------> Variables
  String informationQuery(int id) => '''
      query{
        Media(id: $id, isAdult: false){ 
            isFavourite
            bannerImage        
            coverImage{
                extraLarge
                large
                medium
                color
            }
            averageScore
            popularity
            genres
            title {
                userPreferred
                romaji
                english
                native
            }
            airingSchedule(	notYetAired: true	perPage: 2) {
                nodes {
                    episode
                    airingAt
                }
            }
            description
            source
            meanScore
            relations{
                edges{
                    id 
                    relationType(version:2)node{
                        id
                        title{
                            userPreferred
                        }
                    format
                    type
                    status(version:2)
                    bannerImage
                    coverImage{
                        large
                        medium
                        extraLarge
                      }
                    }
                }
            }
            characters(sort:[ROLE,RELEVANCE,ID]){
                edges{
                    id
                    role
                    voiceActors(language:JAPANESE,sort:[RELEVANCE,ID]){
                        id
                        name{
                            full
                        }
                        language:languageV2
                        image{large}
                    }
                    node{
                        id
                        name{
                            full
                        }
                        image{
                            large
                        }
                    }
                }
            }
            staffPreview:staff(perPage:8,sort:[RELEVANCE,ID]){
                edges{
                    id
                    role
                    node{
                        id
                        name{
                            full
                        }
                    language:languageV2
                    image{
                        large
                    }
                }
            }
        }
        stats{
            statusDistribution{
                status
                amount
            }
            scoreDistribution{
                score
                amount
            }
        }
        season
        seasonYear
        type
        format
        status
        episodes
        duration
        chapters
        volumes	
        trailer{
            site
            id
        }
        startDate {
            day
            month
            year
        }
        endDate  {
            day
            month
            year
        }
        recommendations(sort:[RATING_DESC,ID]){
            pageInfo{total}
            nodes{
                id
                rating
                mediaRecommendation{
                    id
                    title{userPreferred}
                    format
                    type
                    status(version:2)
                    coverImage{large}
                }
            }
        }
    }

}
    ''';

  String characterInfo(int id) => """
  query {
        Character(id:$id){
            name{
                first
                middle
                last
                full
                native
                alternative
                alternativeSpoiler
            }
            image{
                large
            }
            favourites
            isFavourite
            description
            age
            gender
            dateOfBirth{
                year
                month
                day
            }
            media(page:1,sort:POPULARITY){
                pageInfo{
                    total
                    perPage
                    currentPage
                    lastPage
                    hasNextPage
                }
            edges{
                id
                characterRole
                voiceActorRoles(sort:[RELEVANCE,ID]){
                    roleNotes
                    voiceActor{
                        id
                        name{full}
                        image{large}
                        language:languageV2
                    }
                }
                node{
                    id
                    type
                    bannerImage 
                    title{userPreferred}
                    coverImage{large}
                    startDate{year}
                    mediaListEntry{id status}
                }
            }
        }
    }
}

""";

  String staffInfo(int id, int page) => '''
  query {
    Staff(id: $id){
        id
        name{
            full
            native
            alternative
        }
        image{large}
        description
        favourites
        isFavourite
        age
        gender
        yearsActive
        homeTown
        primaryOccupations
        dateOfBirth{year month day}
        dateOfDeath{year month day}
        characterMedia(sort:START_DATE_DESC, page:$page){
            pageInfo{
                total
                perPage
                currentPage
                lastPage
                hasNextPage
            }
            edges{
                characterRole
                characterName
                node{
                    id
                    type
                    bannerImage
                    title{userPreferred}
                    coverImage{large}
                    startDate{year}
                    mediaListEntry{id status}
                }
                characters{
                    id
                    name{full}
                    image{large}
                }
            }
        }
        staffMedia(sort:POPULARITY_DESC){
            pageInfo{
                total
                perPage
                currentPage
                lastPage
                hasNextPage
            }
            edges{
                staffRole
                node{
                    id
                    type
                    title{userPreferred}
                    coverImage{large}
                    mediaListEntry{id status}
                }
            }
        }
    }
}
''';

  String seasonDefaultInfoModel(String season, int page, int year) => '''
        query{
          Page(perPage: 20, page: 1){
              pageInfo{
                  total
                  hasNextPage
              }
              media(season: $season, seasonYear: $year, format: TV, sort: POPULARITY_DESC, isAdult: false){
                  id
                  averageScore
                  popularity
                  genres
                  title {
                  romaji
                  english
                  userPreferred
              }
              bannerImage
              coverImage{
                  large
                  medium
                  color
              }
              airingSchedule(	notYetAired: true	perPage: 2) {
                  nodes {
                      episode
                      airingAt
                  }
              }
              }
          }
      }
      ''';

  String trendingNowDefaultInfoModel(int page) => '''
        query{
              Page(perPage: 20, page: $page){
                media(sort: TRENDING_DESC, isAdult: false){  
                    id
                    averageScore
                    popularity
                    genres
                    title {
                    romaji
                    english
                    userPreferred
                  }        
                  bannerImage
                  coverImage{
                    large
                    medium
                    extraLarge
                    color
                  }
                }
              }
            }
      ''';

  String allTimePopularDefaultInfoModel(int page) => '''
        query{
              Page(perPage: 20, page: $page){
                media(format: TV, sort: POPULARITY_DESC, isAdult: false){                
                  id
                    averageScore
                    popularity
                    genres
                    title {
                    romaji
                    english
                    userPreferred
                  }        
                  bannerImage
                  coverImage{
                    large
                    medium
                    extraLarge
                    color
                  }
                }
              }
            }
      ''';

  String searchQueryModel(String query) => '''
      query{
        Page(perPage: 20){
          media(search: "${query.toString()}", sort: POPULARITY_DESC, isAdult: false){                
            id
            averageScore
            popularity
            genres
            title {
              romaji
              english
              userPreferred
            }        
            bannerImage
            coverImage{
              large
              medium
              color
            }
          }
        }
      }
      ''';
  // ---------------> Constructor
  // ---------------> Functions

  Future<dynamic> search(String query) async {
    try {
      final QueryOptions options = QueryOptions(
        document: gql(searchQueryModel(query)),
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
        document: gql(seasonDefaultInfoModel(
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
        document: gql(seasonDefaultInfoModel(
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
      document: gql(allTimePopularDefaultInfoModel(page)),
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
      document: gql(trendingNowDefaultInfoModel(page)),
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
      document: gql(informationQuery(id)),
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
      document: gql(characterInfo(id)),
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
      document: gql(staffInfo(id, page)),
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
    String query = r'''
    query($id:Int,$name:String){User(id:$id,name:$name){id name avatar{large}bannerImage about isFollowing isFollower donatorTier donatorBadge moderatorStatus isBlocked bans options{profileColor}mediaListOptions{scoreFormat}statistics{anime{count meanScore standardDeviation minutesWatched episodesWatched genrePreview:genres(limit:10,sort:COUNT_DESC){genre count}}manga{count meanScore standardDeviation chaptersRead volumesRead genrePreview:genres(limit:10,sort:COUNT_DESC){genre count}}}stats{activityHistory{date amount level}}favourites{anime{edges{favouriteOrder node{id type status(version:2)format isAdult bannerImage title{userPreferred}coverImage{large}startDate{year}}}}manga{edges{favouriteOrder node{id type status(version:2)format isAdult bannerImage title{userPreferred}coverImage{large}startDate{year}}}}characters{edges{favouriteOrder node{id name{full}image{large}}}}staff{edges{favouriteOrder node{id name{full}image{large}}}}studios{edges{favouriteOrder node{id name}}}}}}
    ''';
    final QueryOptions options = QueryOptions(document: gql(query), variables: {
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

  //  ------------- > AUTHENTICATED ONLY

  Future<dynamic> getUserConfigsIfAuthenticated(String token) async {
    // try {
    String query = r'''
    query{Viewer{id name about avatar{large}bannerImage unreadNotificationCount donatorTier donatorBadge moderatorStatus options{titleLanguage airingNotifications displayAdultContent profileColor notificationOptions{type enabled}}mediaListOptions{scoreFormat rowOrder animeList{customLists sectionOrder splitCompletedSectionByFormat advancedScoring advancedScoringEnabled}mangaList{customLists sectionOrder splitCompletedSectionByFormat advancedScoring advancedScoringEnabled}}}}
    ''';
    final QueryOptions options = QueryOptions(
      document: gql(query),
    );
    var response = await authenticatedClient(token).query(options);
    // print(jsonEncode(response.data));
    if (!response.hasException) {
      return UserConfigs.fromJson(response.data!);
      // return jsonEncode(response.data);
    } else {
      throw response.exception.toString();
    }
    // } catch (e) {
    // }
  }

  Future<dynamic> getUserActivity(String token) async {
    // try {
    String query =
        r'''query($isFollowing:Boolean = true,$hasReplies:Boolean = false,$activityType:ActivityType,$page:Int){Page(page:$page,perPage:25){pageInfo{total perPage currentPage lastPage hasNextPage}activities(isFollowing:$isFollowing type:$activityType hasRepliesOrTypeText:$hasReplies type_in:[TEXT,ANIME_LIST,MANGA_LIST]sort:ID_DESC){... on TextActivity{id userId type replyCount text isLocked isSubscribed isLiked likeCount createdAt user{id name donatorTier donatorBadge avatar{large}}}... on ListActivity{id userId type status progress replyCount isLocked isSubscribed isLiked likeCount createdAt user{id name donatorTier donatorBadge avatar{large}}media{id type status isAdult title{userPreferred}bannerImage coverImage{large}}}}}}
    ''';
    final QueryOptions options = QueryOptions(
      document: gql(query),
      variables: {
        'filter': 'all',
        'page': 1,
        'type': 'following',
      },
    );
    var response = await authenticatedClient(token).query(options);
    // print(jsonEncode(response.data));
    if (!response.hasException) {
      return UserActivity.fromJson(response.data!);
      // return jsonEncode(response.data);
    } else {
      throw response.exception.toString();
    }
    // } catch (e) {
    // }
  }

  Future<dynamic> getUserInProgressList(String token, int userId) async {
    // try {
    String query =
        r'''query($userId:Int,$perPage:Int){Page(perPage:$perPage){mediaList(userId:$userId,status_in:[CURRENT,REPEATING],sort:UPDATED_TIME_DESC){id status score progress progressVolumes media{id type status(version:2)format episodes bannerImage title{userPreferred}coverImage{large}nextAiringEpisode{airingAt timeUntilAiring episode}}}}}
        ''';
    final QueryOptions options = QueryOptions(
      document: gql(query),
      variables: {
        "perPage": 20,
        "userId": userId,
      },
    );
    var response = await authenticatedClient(token).query(options);
    // print(jsonEncode(response.data));
    if (!response.hasException) {
      return UserInProgress.fromJson(response.data!);
      // return jsonEncode(response.data);
    } else {
      throw response.exception.toString();
    }
    // } catch (e) {
    // }
  }

  Future<dynamic> setMediaStatus(
      String token, int mediaId, MediaStatus mediaStatus) async {
    // try {
    String query =
        r'''mutation($id:Int $mediaId:Int $status:MediaListStatus $score:Float $progress:Int $progressVolumes:Int $repeat:Int $private:Boolean $notes:String $customLists:[String]$hiddenFromStatusLists:Boolean $advancedScores:[Float]$startedAt:FuzzyDateInput $completedAt:FuzzyDateInput){SaveMediaListEntry(id:$id mediaId:$mediaId status:$status score:$score progress:$progress progressVolumes:$progressVolumes repeat:$repeat private:$private notes:$notes customLists:$customLists hiddenFromStatusLists:$hiddenFromStatusLists advancedScores:$advancedScores startedAt:$startedAt completedAt:$completedAt){id mediaId status score advancedScores progress progressVolumes repeat priority private hiddenFromStatusLists customLists notes updatedAt startedAt{year month day}completedAt{year month day}user{id name}media{id title{userPreferred}coverImage{large}type format status episodes volumes chapters averageScore popularity isAdult startDate{year}}}}''';

    final QueryOptions options = QueryOptions(
      document: gql(query),
      variables: {
        "mediaId": mediaId,
        "status": [
          "CURRENT",
          "PLANNING",
          "COMPLETED",
          "DROPPED",
          "PAUSED",
          "REPEATING"
        ][mediaStatus.index],
      },
    );
    var response = await authenticatedClient(token).query(options);
    // print(jsonEncode(response.data));
    if (!response.hasException) {
      return SaveMediaEntry.fromJson(response.data!);
      // return jsonEncode(response.data);
    } else {
      throw response.exception.toString();
    }
    // } catch (e) {
    // }
  }

  Future<dynamic> getAnimeList(int userId, String userName) async {
    // try {
    String query =
        r'''query($userId:Int,$userName:String,$type:MediaType){MediaListCollection(userId:$userId,userName:$userName,type:$type){lists{name isCustomList isCompletedList:isSplitCompletedList entries{...mediaListEntry}}user{id name avatar{large}mediaListOptions{scoreFormat rowOrder animeList{sectionOrder customLists splitCompletedSectionByFormat theme}mangaList{sectionOrder customLists splitCompletedSectionByFormat theme}}}}}fragment mediaListEntry on MediaList{id mediaId status score progress progressVolumes repeat priority private hiddenFromStatusLists customLists advancedScores notes updatedAt startedAt{year month day}completedAt{year month day}media{id title{userPreferred romaji english native}coverImage{extraLarge large}type format status(version:2)episodes volumes chapters averageScore popularity isAdult countryOfOrigin genres bannerImage startDate{year month day}}}
        ''';

    final QueryOptions options = QueryOptions(
      document: gql(query),
      variables: {
        "type": "ANIME",
        "id": userId,
        "userName": userName,
      },
    );
    var response = await client.query(options);
    // print(jsonEncode(response.data));
    if (!response.hasException) {
      return AnimeListCollection.fromJson(response.data!);
      // return jsonEncode(response.data);
    } else {
      throw response.exception.toString();
    }
    // } catch (e) {
    // }
  }

  Future<dynamic> getMangaList(int userId, String userName) async {
    // try {
    String query =
        r'''query($userId:Int,$userName:String,$type:MediaType){MediaListCollection(userId:$userId,userName:$userName,type:$type){lists{name isCustomList isCompletedList:isSplitCompletedList entries{...mediaListEntry}}user{id name avatar{large}mediaListOptions{scoreFormat rowOrder animeList{sectionOrder customLists splitCompletedSectionByFormat theme}mangaList{sectionOrder customLists splitCompletedSectionByFormat theme}}}}}fragment mediaListEntry on MediaList{id mediaId status score progress progressVolumes repeat priority private hiddenFromStatusLists customLists advancedScores notes updatedAt startedAt{year month day}completedAt{year month day}media{id title{userPreferred romaji english native}coverImage{extraLarge large}type format status(version:2)episodes volumes chapters averageScore popularity isAdult countryOfOrigin genres bannerImage startDate{year month day}}}
        ''';

    final QueryOptions options = QueryOptions(
      document: gql(query),
      variables: {
        "type": "MANGA",
        "id": userId,
        "userName": userName,
      },
    );
    var response = await client.query(options);
    // print(jsonEncode(response.data));
    if (!response.hasException) {
      return MangaListCollection.fromJson(response.data!);
      // return jsonEncode(response.data);
    } else {
      throw response.exception.toString();
    }
    // } catch (e) {
    // }
  }

  Future<bool> toggleIsFavourite(
    String token, {
    int? animeId,
    int? mangaId,
    int? staffId,
    int? studioId,
    int? characterId,
  }) async {
    // try {
    String mutation =
        r'''mutation($animeId:Int,$mangaId:Int,$characterId:Int,$staffId:Int,$studioId:Int){ToggleFavourite(animeId:$animeId mangaId:$mangaId characterId:$characterId staffId:$staffId studioId:$studioId){anime{pageInfo{total}}manga{pageInfo{total}}characters{pageInfo{total}}staff{pageInfo{total}}studios{pageInfo{total}}}}''';

    final MutationOptions options = MutationOptions(
      document: gql(mutation),
      variables: animeId != null
          ? {"animeId": animeId}
          : mangaId != null
              ? {"mangaId": mangaId}
              : staffId != null
                  ? {"staffId": staffId}
                  : {"characterId": characterId},
    );
    var response = await authenticatedClient(token).mutate(options);
    // print(jsonEncode(response.data));
    if (!response.hasException) {
      return true;
      // return jsonEncode(response.data);
    } else {
      throw response.exception.toString();
    }
    // } catch (e) {
    // }
  }

  Future<StaffInfoModel> getStaffInfoAuthenticated(int id, String token,
      {int page = 1}) async {
    // try {
    final QueryOptions options = QueryOptions(
      document: gql(staffInfo(id, page)),
    );
    var response = await authenticatedClient(token).query(options);
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

  Future<dynamic> getAuthenticatedInformation(int id, String token) async {
    // try {

    final QueryOptions options = QueryOptions(
      document: gql(informationQuery(id)),
    );
    var response = await authenticatedClient(token).query(options);
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

  Future<dynamic> loggout(String token) async {
    // try {
    String query = r'''mutation{Logout}''';
    final QueryOptions options = QueryOptions(document: gql(query));
    var response = await authenticatedClient(token).query(options);

    // } catch (e) {
    // }
  }

  // --------------------------<
}
