import 'package:anilist_app/core/models/user_activity_model.dart';
import 'package:anilist_app/core/models/user_in_progress_model.dart';
import 'package:anilist_app/core/view_models/main_view_model.dart';
import 'package:anilist_app/ui/screens/home/widgets/milestone_bar.dart';
import 'package:anilist_app/ui/screens/home/widgets/overview_text_display.dart';
import 'package:anilist_app/ui/screens/info_screen/info_screen.dart';
import 'package:anilist_app/ui/shared/image_card.dart';
import 'package:anilist_app/ui/values/colors.dart';
import 'package:anilist_app/ui/values/styles.dart';
import 'package:anilist_app/ui/values/values.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserOverViewScreen extends StatefulWidget {
  @override
  _UserOverViewScreenState createState() => _UserOverViewScreenState();
}

class _UserOverViewScreenState extends State<UserOverViewScreen> {
  @override
  Widget build(BuildContext context) {
    final mainViewModel = Provider.of<MainViewModel>(context);
    return FutureBuilder(
      future: mainViewModel.getUserActivity(),
      builder: (context, AsyncSnapshot<UserActivity?> snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(tertiaryColor),
            ),
          );
        } else if (snapshot.data == null || snapshot.hasError) {
          return Center(
            child: Text("Clear around here"),
          );
        } else {
          return Padding(
            padding: EdgeInsets.all(DEFAULT_PADDING / 2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FutureBuilder(
                  future: mainViewModel.getUserInProgressList(
                      mainViewModel.userConfigs!.viewer.id),
                  builder: (context,
                      AsyncSnapshot<UserInProgress?> userInProgressSnapshot) {
                    print(
                        "userInProgressSnapshot error: ----> ${userInProgressSnapshot.hasError}");
                    if (!userInProgressSnapshot.hasData) {
                      return Container();
                    } else if (userInProgressSnapshot.hasData &&
                        userInProgressSnapshot.data == null) {
                      return Container();
                    } else {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(DEFAULT_PADDING_MEDIUM / 2),
                            child: Text(
                              'Current watching / reading',
                              style: TegakiTextStyles.regularBold
                                  .copyWith(fontSize: 18),
                            ),
                          ),
                          Container(
                            height: 200,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              physics: BouncingScrollPhysics(),
                              itemCount: userInProgressSnapshot
                                  .data!.page.mediaList.length,
                              itemBuilder: (context, index) => ImageCard(
                                height: 200,
                                width: 130,
                                imageUrl: userInProgressSnapshot.data!.page
                                    .mediaList[index].media.coverImage.large,
                                onTap: () => Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                    builder: (context) => InfoScreen(
                                      id: userInProgressSnapshot
                                          .data!.page.mediaList[index].media.id,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    }
                  },
                ),
                Padding(
                  padding: EdgeInsets.all(DEFAULT_PADDING / 2),
                  child: Text(
                    'Activity',
                    style: TegakiTextStyles.regularBold.copyWith(fontSize: 18),
                  ),
                ),
                Column(
                  children: List.generate(
                    snapshot.data!.page.activities.length,
                    (index) => Container(
                      decoration: BoxDecoration(
                        color: secondaryColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.only(right: DEFAULT_PADDING),
                      margin: EdgeInsets.all(DEFAULT_PADDING_MEDIUM / 2),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 120,
                            child: ClipRRect(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                bottomLeft: Radius.circular(10),
                              ),
                              child: Image.network(
                                snapshot.data!.page.activities[index].media
                                    .coverImage.large,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: DEFAULT_PADDING),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  snapshot
                                      .data!.page.activities[index].user.name,
                                  style: TegakiTextStyles.regularBold.copyWith(
                                    color: powderBlue,
                                    fontSize: 18,
                                  ),
                                ),
                                Container(height: DEFAULT_PADDING_MEDIUM / 2),
                                Container(
                                  width: MediaQuery.of(context).size.width * .3,
                                  child: RichText(
                                    text: TextSpan(
                                      text: snapshot.data!.page
                                              .activities[index].status +
                                          ' ',
                                      style: TegakiTextStyles.regular,
                                      children: [
                                        TextSpan(
                                          text: snapshot
                                              .data!
                                              .page
                                              .activities[index]
                                              .media
                                              .title
                                              .userPreferred,
                                          style: TegakiTextStyles.regularBold
                                              .copyWith(
                                            color: tertiaryColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: 30,
                          ),
                          Text(
                            "${DateTime.fromMillisecondsSinceEpoch(snapshot.data!.page.activities[index].createdAt * 1000).difference(DateTime.now()).inHours.abs().toString()} hours ago",
                            style: TegakiTextStyles.secondaryText,
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        }
      },
    );
  }
}
