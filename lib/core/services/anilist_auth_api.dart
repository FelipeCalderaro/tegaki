import 'package:anilist_app/core/enums/media_status.dart';
import 'package:anilist_app/core/models/anime_list_collection_model.dart';
import 'package:anilist_app/core/models/character_info_model.dart';
import 'package:anilist_app/core/models/info_model.dart';
import 'package:anilist_app/core/models/manga_list_collection_model.dart';
import 'package:anilist_app/core/models/save_media_entry_model.dart';
import 'package:anilist_app/core/models/staff_info_model.dart';
import 'package:anilist_app/core/models/user_activity_model.dart';
import 'package:anilist_app/core/models/user_configs_model.dart';
import 'package:anilist_app/core/models/user_in_progress_model.dart';
import 'package:anilist_app/core/models/user_info_model.dart';
import 'package:anilist_app/core/services/auth_querys.dart';
import 'package:anilist_app/core/services/graphql_api.dart';
import 'package:anilist_app/core/services/querys.dart';
import 'package:anilist_app/core/services/service_locator.dart';
import 'package:anilist_app/core/session/session.dart';
import 'package:graphql/client.dart';

/// Service that connects with AnilistAPI but retieve only info with Oauth2 token passed
class AnilistAuthAPI extends GraphQL {
  Session session = serviceLocator<Session>();

  //  ------------- > AUTHENTICATED ONLY

  Future<UserConfigs> getUserAuthenticadedConfigs() async {
    try {
      final QueryOptions options = QueryOptions(
        document: gql(AuthQuerys.userConfigs),
      );
      var response = await authenticatedClient(session.token).query(options);
      if (!response.hasException) {
        return UserConfigs.fromJson(response.data!);
      } else {
        throw response.exception.toString();
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> getUserActivity() async {
    try {
      final QueryOptions options = QueryOptions(
        document: gql(AuthQuerys.userActivity),
        variables: {
          'filter': 'all',
          'page': 1,
          'type': 'following',
        },
      );
      var response = await authenticatedClient(session.token).query(options);
      if (!response.hasException) {
        return UserActivity.fromJson(response.data!);
      } else {
        throw response.exception.toString();
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<UserInProgress> getUserInProgressList(int userId) async {
    try {
      final QueryOptions options = QueryOptions(
        document: gql(AuthQuerys.userInProgress),
        variables: {
          "perPage": 20,
          "userId": userId,
        },
      );
      var response = await authenticatedClient(session.token).query(options);
      if (!response.hasException) {
        return UserInProgress.fromJson(response.data!);
      } else {
        throw response.exception.toString();
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> setMediaStatus(int mediaId, MediaStatus mediaStatus) async {
    try {
      final QueryOptions options = QueryOptions(
        document: gql(AuthQuerys.setMediaStatus),
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
      var response = await authenticatedClient(session.token).query(options);
      // print(jsonEncode(response.data));
      if (!response.hasException) {
        return SaveMediaEntry.fromJson(response.data!);
        // return jsonEncode(response.data);
      } else {
        throw response.exception.toString();
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<AnimeListCollection> getAnimeList(int userId, String userName) async {
    try {
      final QueryOptions options = QueryOptions(
        document: gql(AuthQuerys.userAnimeList),
        variables: {
          "type": "ANIME",
          "id": userId,
          "userName": userName,
        },
      );
      var response = await authenticatedClient(session.token).query(options);
      if (!response.hasException) {
        return AnimeListCollection.fromJson(response.data!);
      } else {
        throw response.exception.toString();
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<MangaListCollection> getMangaList(int userId, String userName) async {
    try {
      final QueryOptions options = QueryOptions(
        document: gql(AuthQuerys.userMangaList),
        variables: {
          "type": "MANGA",
          "id": userId,
          "userName": userName,
        },
      );
      var response = await authenticatedClient(session.token).query(options);
      if (!response.hasException) {
        return MangaListCollection.fromJson(response.data!);
      } else {
        throw response.exception.toString();
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> toggleIsFavourite({
    int? animeId,
    int? mangaId,
    int? staffId,
    int? studioId,
    int? characterId,
  }) async {
    try {
      final MutationOptions options = MutationOptions(
        document: gql(AuthQuerys.toggleFavouriteMutation),
        variables: animeId != null
            ? {"animeId": animeId}
            : mangaId != null
                ? {"mangaId": mangaId}
                : staffId != null
                    ? {"staffId": staffId}
                    : {"characterId": characterId},
      );
      var response = await authenticatedClient(session.token).mutate(options);
      if (!response.hasException) {
        return true;
      } else {
        throw response.exception.toString();
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<StaffInfoModel> getStaffInfoAuthenticated(int id,
      {int page = 1}) async {
    try {
      final QueryOptions options = QueryOptions(
        document: gql(Querys.staffInfo(id, page)),
      );
      var response = await authenticatedClient(session.token).query(options);
      if (!response.hasException) {
        return StaffInfoModel.fromJson(response.data!);
      } else {
        throw response.exception.toString();
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> getAuthenticatedInformation(int id) async {
    try {
      final QueryOptions options = QueryOptions(
        document: gql(Querys.informationQuery(id)),
      );
      var response = await authenticatedClient(session.token).query(options);
      if (!response.hasException) {
        return InfoModel.fromJson(response.data!);
      } else {
        throw response.exception.toString();
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> getCharacterInfo(int id) async {
    try {
      final QueryOptions options = QueryOptions(
        document: gql(Querys.characterInfo(id)),
      );
      var response = await authenticatedClient(session.token).query(options);
      if (!response.hasException) {
        return CharacterInfoModel.fromJson(response.data!);
      } else {
        throw response.exception.toString();
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<StaffInfoModel> getStaffInfo(int id, {int page = 1}) async {
    try {
      final QueryOptions options = QueryOptions(
        document: gql(Querys.staffInfo(id, page)),
      );
      var response = await authenticatedClient(session.token).query(options);
      if (!response.hasException) {
        return StaffInfoModel.fromJson(response.data!);
      } else {
        throw response.exception.toString();
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> getUserListsAndInfo(String userName) async {
    try {
      final QueryOptions options = QueryOptions(
        document: gql(Querys.listAndInfo),
        variables: {
          "name": userName,
        },
      );
      var response = await authenticatedClient(session.token).query(options);
      if (!response.hasException) {
        return UserInfo.fromJson(response.data!);
      } else {
        throw response.exception.toString();
      }
    } catch (e) {
      rethrow;
    }
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
