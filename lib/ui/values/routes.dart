import 'package:anilist_app/ui/screens/all_time_popular/all_time_popular.dart';
import 'package:anilist_app/ui/screens/home/home.dart';
import 'package:anilist_app/ui/screens/info_screen/info_screen.dart';

const HOME_ROUTE = '/home';
const ALL_TIME_POPULAR = '/all-time-popular';
const INFO_SCREEN = '/info-screen';

var routes = {
  HOME_ROUTE: (context) => HomeScreen(),
  ALL_TIME_POPULAR: (context) => AllTimePopularScreen(),
};
