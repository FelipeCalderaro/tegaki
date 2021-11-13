import 'package:anilist_app/core/models/anime_list_collection_model.dart';
import 'package:anilist_app/core/models/manga_list_collection_model.dart';
import 'package:anilist_app/core/models/primary_user.dart';
import 'package:anilist_app/core/models/user_activity_model.dart';
import 'package:anilist_app/core/models/user_configs_model.dart';
import 'package:anilist_app/core/models/user_in_progress_model.dart';
import 'package:anilist_app/core/models/user_info_model.dart';
import 'package:anilist_app/core/services/anilist_auth_api.dart';
import 'package:anilist_app/core/services/service_locator.dart';
import 'package:anilist_app/core/session/session.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'user_event.dart';
part 'user_state.dart';
part 'user_bloc.freezed.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  late PrimaryUser user;
  late UserActivity userActivity;
  late UserInProgress userInProgress;
  late AnimeListCollection animeList;
  late MangaListCollection mangaList;

  DateTime lastTimeSinceReload = DateTime.now();

  Session session = serviceLocator<Session>();
  AnilistAuthAPI api = AnilistAuthAPI();

  UserBloc() : super(UserStateNotLogged()) {
    on<UserEventLogin>((event, emit) async {
      emit(UserStateLoading());
      await login(event.token).then((user) => emit(UserStateLogged(user)));
    });

    on<UserEventReload>((event, emit) async {
      // emit(UserStateLoading());
      if (DateTime.now().difference(lastTimeSinceReload).inMinutes >= 1) {
        await login(session.token).then((user) => emit(UserStateLogged(user)));
        lastTimeSinceReload = DateTime.now();
      }
    });
  }

  Future<PrimaryUser> login(String token) async {
    // emit(UserStateLoading());
    session.login(token);

    UserConfigs userConfigs = await api.getUserAuthenticadedConfigs();
    UserInfo userInfo = await api.getUserListsAndInfo(userConfigs.viewer.name);
    user = PrimaryUser(info: userInfo, configs: userConfigs);
    await getUserActivity();
    await getUserInProgressList();
    await getUserLists();
    return user;
  }

  Future<void> getUserActivity() async {
    userActivity = await api.getUserActivity();
  }

  Future<void> getUserInProgressList() async {
    userInProgress = await api.getUserInProgressList(user.configs.viewer.id);
  }

  Future<void> getUserLists() async {
    animeList =
        await api.getAnimeList(user.info.user.id.toInt(), user.info.user.name);
    mangaList =
        await api.getMangaList(user.info.user.id.toInt(), user.info.user.name);
  }
}
