import 'package:anilist_app/core/bloc/user_bloc.dart';
import 'package:anilist_app/core/models/primary_user.dart';
import 'package:anilist_app/core/services/service_locator.dart';
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
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:focus_detector/focus_detector.dart';

// ignore: must_be_immutable
class UserScreen extends StatefulWidget {
  int selectedIndex = 0;
  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserBloc, UserState>(
      listener: (context, state) {},
      builder: (context, state) => state.when(
        notLogged: () => UserNotLoggedScreen(),
        loading: () => Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation(AppColors.tertiaryColor),
          ),
        ),
        logged: (user) => buildBody(user),
      ),
    );
  }

  Widget buildBody(PrimaryUser user) {
    UserBloc bloc = serviceLocator<UserBloc>();
    return FocusDetector(
      onFocusGained: () => bloc.add(UserEventReload()),
      child: Scaffold(
        // floatingActionButton: FloatingActionButton(onPressed: () {
        //   // mainViewModel.getUserInProgressList(5336732);
        //   // mainViewModel.getUserActivity();
        //   //   mainViewModel.getMangaList(
        //   //     mainViewModel.userInfo!.user.id,
        //   //     mainViewModel.userInfo!.user.name,
        //   //   );
        //   // mainViewModel.getAnimeList(
        //   //   mainViewModel.userInfo!.user.id,
        //   //   mainViewModel.userInfo!.user.name,
        //   // );
        //   // mainViewModel.getUserActivity();
        //   //   mainViewModel.getUserInProgressList(
        //   //       mainViewModel.userConfigs!.viewer.id);
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
                    user.configs.viewer.avatar.large,
                    fit: BoxFit.cover,
                  ),
                ),
                Text(
                  user.configs.viewer.name,
                  style: TegakiTextStyles.appBarTitle.copyWith(fontSize: 22),
                ),
                IconButton(
                  icon: Icon(
                    Icons.exit_to_app,
                    color: AppColors.powderBlue,
                  ),
                  onPressed: () {},
                )
              ],
            ),
            Divider(
              color: AppColors.tertiaryColor,
              thickness: 2.0,
            ),
            Container(
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  OverviewTextDisplay(
                    value: '${user.info.user.statistics.manga.count}',
                    title: 'Total Manga',
                  ),
                  OverviewTextDisplay(
                    value: '${user.info.user.statistics.manga.chaptersRead}',
                    title: 'Chapters Read',
                  ),
                  OverviewTextDisplay(
                    value: '${user.info.user.statistics.manga.meanScore}',
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
              color: AppColors.powderBlue,
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
              widget.selectedIndex == 0
                  ? AppColors.secondaryColor
                  : AppColors.primaryColor,
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
              widget.selectedIndex == 1
                  ? AppColors.secondaryColor
                  : AppColors.primaryColor,
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
              widget.selectedIndex == 2
                  ? AppColors.secondaryColor
                  : AppColors.primaryColor,
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
