import 'package:anilist_app/core/bloc/user_bloc.dart';
import 'package:anilist_app/core/services/service_locator.dart';
import 'package:anilist_app/core/utils/bloc_observer.dart';
import 'package:anilist_app/core/utils/route_generator.dart';
import 'package:anilist_app/core/view_models/main_view_model.dart';
import 'package:anilist_app/ui/screens/splash_screen.dart';
import 'package:anilist_app/ui/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'ui/values/strings.dart';

void main() {
  GlobalDependecies.init();
  Bloc.observer = AppBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => UserBloc()),
      ],
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider<MainViewModel>(
            create: (context) => MainViewModel.instance(),
          ),
        ],
        child: MaterialApp(
          title: APP_NAME,
          debugShowCheckedModeBanner: false,
          navigatorKey: serviceLocator<GlobalKey<NavigatorState>>(),
          onGenerateRoute: RouteGenerator.generateRoute,
          home: SplashScreen(),
          theme: ThemeData(
            primaryColor: AppColors.tertiaryColor,
            scaffoldBackgroundColor: AppColors.primaryColor,
            textTheme: TextTheme(
              bodyText1: TextStyle(
                color: Colors.white,
              ),
              bodyText2: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );

    // return MaterialApp(
    //   title: APP_NAME,
    //   debugShowCheckedModeBanner: false,
    //   theme: ThemeData(primarySwatch: Colors.deepPurple),
    //   // routes: Routes.routes,
    //   home: HomeScreen(),
    // );
  }
}
