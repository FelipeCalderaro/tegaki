import 'package:anilist_app/ui/screens/home/base_page.dart';
import 'package:anilist_app/ui/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RouteNames {
  static const String START = '/';
  static const String SPLASH_SCREEN = '/splash_screen';
  static const String BASE_PAGE = '/base_page';
}

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Store arguments passed while push
    final Object? args = settings.arguments;

    switch (settings.name) {
      case RouteNames.SPLASH_SCREEN:
        return MaterialPageRoute(builder: (context) => SplashScreen());
      case RouteNames.BASE_PAGE:
        return MaterialPageRoute(builder: (context) => BasePage());
      default:
        return MaterialPageRoute(builder: (context) => SplashScreen());
    }
  }

  static Route<dynamic> errorRoute() {
    return MaterialPageRoute(
      builder: (context) => Scaffold(
        body: Center(
          child: Text('error'),
        ),
      ),
    );
  }
}
