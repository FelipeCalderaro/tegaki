import 'package:anilist_app/core/view_models/main_view_model.dart';
import 'package:anilist_app/ui/screens/splash_screen.dart';
import 'package:anilist_app/ui/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:anilist_app/ui/screens/home/home.dart';
import 'package:anilist_app/ui/values/routes.dart' as Routes;
import 'package:provider/provider.dart';

import 'ui/values/strings.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MainViewModel>(
          create: (context) => MainViewModel.instance(),
        ),
      ],
      child: MaterialApp(
        title: APP_NAME,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: tertiaryColor,
          scaffoldBackgroundColor: primaryColor,
          textTheme: TextTheme(
            bodyText1: TextStyle(
              color: Colors.white,
            ),
            bodyText2: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        routes: Routes.routes,
        home: SplashScreen(),
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
