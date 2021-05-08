import 'package:anilist_app/core/view_models/main_view_model.dart';
import 'package:anilist_app/ui/screens/home/pages/user_screens/user_anime_list_screen.dart';
import 'package:anilist_app/ui/screens/home/pages/user_screens/user_manga_list_screen.dart';
import 'package:anilist_app/ui/screens/home/pages/user_screens/user_not_logged_screen.dart';
import 'package:anilist_app/ui/screens/home/pages/user_screens/user_overview_screen.dart';
import 'package:anilist_app/ui/screens/home/widgets/overview_text_display.dart';
import 'package:anilist_app/ui/values/colors.dart';
import 'package:anilist_app/ui/values/styles.dart';
import 'package:anilist_app/ui/values/values.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserScreen extends StatefulWidget {
  int selectedIndex = 0;
  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  Widget build(BuildContext context) {
    final mainViewModel = Provider.of<MainViewModel>(context);
    return mainViewModel.BEARER_TOKEN == null
        ? UserNotLoggedScreen()
        : mainViewModel.userConfigs == null && mainViewModel.userInfo == null
            ? Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(tertiaryColor),
                ),
              )
            : Scaffold(
                // floatingActionButton: FloatingActionButton(onPressed: () {
                //   // mainViewModel.getUserInProgressList(5336732);
                //   mainViewModel.getMangaList(
                //     mainViewModel.userInfo!.user.id,
                //     mainViewModel.userInfo!.user.name,
                //   );
                //   // mainViewModel.getUserActivity();
                //   mainViewModel.getUserInProgressList(
                //       mainViewModel.userConfigs!.viewer.id);
                // }),
                body: ListView(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                            top: DEFAULT_PADDING_MEDIUM,
                            right: DEFAULT_PADDING_MEDIUM,
                          ),
                          height: 150,
                          child: Image.network(
                            mainViewModel.userConfigs!.viewer.avatar.large,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Text(
                          mainViewModel.userConfigs!.viewer.name,
                          style: TegakiTextStyles.appBarTitle
                              .copyWith(fontSize: 22),
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.exit_to_app,
                            color: powderBlue,
                          ),
                          onPressed: () => mainViewModel.loggout(),
                        )
                      ],
                    ),
                    Divider(
                      color: tertiaryColor,
                      thickness: 2.0,
                    ),
                    Container(
                      height: 60,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          OverviewTextDisplay(
                            value:
                                '${mainViewModel.userInfo!.user.statistics.manga.count}',
                            title: 'Total Manga',
                          ),
                          OverviewTextDisplay(
                            value:
                                '${mainViewModel.userInfo!.user.statistics.manga.chaptersRead}',
                            title: 'Chapters Read',
                          ),
                          OverviewTextDisplay(
                            value:
                                '${mainViewModel.userInfo!.user.statistics.manga.meanScore}',
                            title: 'Mean Score',
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 50,
                      child: buildTabButtons(),
                    ),
                    Divider(
                      color: powderBlue,
                      thickness: 0.7,
                    ),
                    [
                      UserOverViewScreen(),
                      UserAnimeListScreen(),
                      UserMangaListScreen(),
                    ][widget.selectedIndex],
                    Container(
                      height: 80,
                    ),
                  ],
                ),
              );
  }

  ListView buildTabButtons() {
    return ListView(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.symmetric(horizontal: DEFAULT_PADDING),
      children: [
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
              widget.selectedIndex == 0 ? secondaryColor : primaryColor,
            ),
          ),
          onPressed: () => setState(() {
            widget.selectedIndex = 0;
          }),
          child: Text(
            'Overview',
            style: TegakiTextStyles.infoButton,
          ),
        ),
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
              widget.selectedIndex == 1 ? secondaryColor : primaryColor,
            ),
          ),
          onPressed: () => setState(() {
            widget.selectedIndex = 1;
          }),
          child: Text(
            'Anime List',
            style: TegakiTextStyles.infoButton,
          ),
        ),
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
              widget.selectedIndex == 2 ? secondaryColor : primaryColor,
            ),
          ),
          onPressed: () => setState(() {
            widget.selectedIndex = 2;
          }),
          child: Text(
            'Manga List',
            style: TegakiTextStyles.infoButton,
          ),
        )
      ],
    );
  }
}
