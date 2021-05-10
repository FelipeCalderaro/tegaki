import 'package:anilist_app/core/view_models/main_view_model.dart';
import 'package:anilist_app/ui/screens/all_time_popular/all_time_popular.dart';
import 'package:anilist_app/ui/screens/home/widgets/home_tile_button_widget.dart';
import 'package:anilist_app/ui/screens/popular_this_season/popular_this_season_screen.dart';
import 'package:anilist_app/ui/screens/trending/trending_screen.dart';
import 'package:anilist_app/ui/screens/upcoming_next_season/upcoming_next_season.dart';
import 'package:anilist_app/ui/values/styles.dart';
import 'package:anilist_app/ui/values/values.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class HomeTab extends StatelessWidget {
  // double biggerHeight = 250;
  double biggerHeight = 250;
  double smallerHeight = 200;

  @override
  Widget build(BuildContext context) {
    final mainViewModel = Provider.of<MainViewModel>(context);
    return ListView(
      // crossAxisAlignment: CrossAxisAlignment.center,
      // mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          child: Text(
            'Discover',
            style: TegakiTextStyles.callout,
          ),
          padding: MediaQuery.of(context).size.height * .4 > 250
              ? EdgeInsets.all(DEFAULT_PADDING_MAXIMUM)
              : EdgeInsets.symmetric(
                  horizontal: DEFAULT_PADDING_MAXIMUM,
                  vertical: 2.0,
                ),
          alignment: Alignment.centerLeft,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                HomeTileButtonWidget(
                  height: MediaQuery.of(context).size.height * .32,
                  title: 'Trending Now',
                  imageUrl: mainViewModel
                      .trendingNowHome!.page.media[0].coverImage.large,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TrendingNowScreen(),
                      ),
                    );
                  },
                ),
                HomeTileButtonWidget(
                  height: MediaQuery.of(context).size.height * .257,
                  title: "Popular this season",
                  imageUrl: mainViewModel.popularThisSeasonLastEntry!.page
                      .media[0].coverImage.large,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PopularThisSeasonScreen(),
                      ),
                    );
                  },
                )
              ],
            ),
            Column(
              children: [
                HomeTileButtonWidget(
                  height: MediaQuery.of(context).size.height * .257,
                  title: "Upcoming next season",
                  imageUrl: mainViewModel
                      .upcomingSeasonLastEntry!.page.media[0].coverImage.large,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UpcomingNextSeason(),
                      ),
                    );
                  },
                ),
                HomeTileButtonWidget(
                  height: MediaQuery.of(context).size.height * .32,
                  title: 'All time popular',
                  imageUrl: mainViewModel
                      .allTimePopular!.page.media[0].coverImage.large,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AllTimePopularScreen(),
                      ),
                    );
                  },
                )
              ],
            ),
          ],
        )
      ],
    );
  }
}
