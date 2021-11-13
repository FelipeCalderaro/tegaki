import 'package:anilist_app/core/bloc/user_bloc.dart';
import 'package:anilist_app/ui/screens/info_screen/info_screen.dart';
import 'package:anilist_app/ui/shared/image_card.dart';
import 'package:anilist_app/ui/values/colors.dart';
import 'package:anilist_app/ui/values/styles.dart';
import 'package:anilist_app/ui/values/values.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserOverViewScreen extends StatefulWidget {
  @override
  _UserOverViewScreenState createState() => _UserOverViewScreenState();
}

class _UserOverViewScreenState extends State<UserOverViewScreen> {
  @override
  Widget build(BuildContext context) {
    final UserBloc userBloc = BlocProvider.of<UserBloc>(context);

    return Padding(
      padding: EdgeInsets.all(DEFAULT_PADDING / 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(DEFAULT_PADDING_MEDIUM / 2),
                child: Text(
                  'Current watching / reading',
                  style: TegakiTextStyles.regularBold.copyWith(fontSize: 18),
                ),
              ),
              Container(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  itemCount: userBloc.userInProgress.page.mediaList.length,
                  itemBuilder: (context, index) => ImageCard(
                    height: 200,
                    width: 130,
                    imageUrl: userBloc.userInProgress.page.mediaList[index]
                        .media.coverImage.large,
                    onTap: () => Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => InfoScreen(
                          id: userBloc
                              .userInProgress.page.mediaList[index].media.id,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
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
              userBloc.userActivity.page.activities.length,
              (index) => Container(
                decoration: BoxDecoration(
                  color: AppColors.secondaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.only(right: DEFAULT_PADDING),
                margin: EdgeInsets.all(DEFAULT_PADDING_MEDIUM / 2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 120,
                      width: MediaQuery.of(context).size.width * .22,
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                        ),
                        child: Image.network(
                          userBloc.userActivity.page.activities[index].media
                              .coverImage.large,
                          fit: BoxFit.cover,
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
                            userBloc
                                .userActivity.page.activities[index].user.name,
                            style: TegakiTextStyles.regularBold.copyWith(
                              color: AppColors.powderBlue,
                              fontSize: 18,
                            ),
                          ),
                          Container(height: DEFAULT_PADDING_MEDIUM / 2),
                          Container(
                            width: MediaQuery.of(context).size.width * .3,
                            child: RichText(
                              text: TextSpan(
                                text: userBloc.userActivity.page
                                        .activities[index].status +
                                    ' ',
                                style: TegakiTextStyles.regular,
                                children: [
                                  TextSpan(
                                    text: userBloc
                                        .userActivity
                                        .page
                                        .activities[index]
                                        .media
                                        .title
                                        .userPreferred,
                                    style:
                                        TegakiTextStyles.regularBold.copyWith(
                                      color: AppColors.tertiaryColor,
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
                      "${DateTime.fromMillisecondsSinceEpoch(userBloc.userActivity.page.activities[index].createdAt * 1000).difference(DateTime.now()).inHours.abs().toString()} hours ago",
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
}
