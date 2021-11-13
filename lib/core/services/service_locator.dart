import 'package:anilist_app/core/bloc/user_bloc.dart';
import 'package:anilist_app/core/session/session.dart';
import 'package:anilist_app/core/session/session_impl.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';

GetIt serviceLocator = GetIt.instance;

class GlobalDependecies {
  static final GlobalDependecies _singleton = GlobalDependecies._internal();
  GlobalDependecies._internal();

  factory GlobalDependecies() {
    return _singleton;
  }
  static Future<void> init() async {
    GetIt getIt = GetIt.I;
    final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

    // Register
    getIt.registerSingleton<GlobalKey<NavigatorState>>(navigatorKey);
    getIt.registerSingleton<Session>(SessionImpl('', ''));

    // Blocs and cubits
    getIt.registerSingleton<UserBloc>(UserBloc());
  }
}
