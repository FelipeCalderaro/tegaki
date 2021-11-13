import 'package:anilist_app/core/bloc/user_bloc.dart';
import 'package:anilist_app/core/models/anime_list_collection_model.dart';
import 'package:anilist_app/core/services/service_locator.dart';
import 'package:anilist_app/core/view_models/main_view_model.dart';
import 'package:anilist_app/ui/screens/info_screen/info_screen.dart';
import 'package:anilist_app/ui/shared/image_card.dart';
import 'package:anilist_app/ui/values/colors.dart';
import 'package:anilist_app/ui/values/styles.dart';
import 'package:anilist_app/ui/values/values.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class UserAnimeListScreen extends StatefulWidget {
  bool showWatching = true;
  bool showCompleted = true;
  bool showPlanning = true;
  bool showDropped = true;
  bool showPaused = true;
  bool showRewatching = true;

  @override
  _UserAnimeListScreenState createState() => _UserAnimeListScreenState();
}

class _UserAnimeListScreenState extends State<UserAnimeListScreen> {
  @override
  Widget build(BuildContext context) {
    UserBloc userBloc = BlocProvider.of<UserBloc>(context);
    return Padding(
      padding: EdgeInsets.all(DEFAULT_PADDING / 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
          userBloc.animeList.mediaListCollection.lists.length,
          (index) => Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.all(DEFAULT_PADDING_MEDIUM / 2),
                child: Text(
                  userBloc.animeList.mediaListCollection.lists[index].name,
                  style: TegakiTextStyles.buttonHighlight,
                ),
              ),
              GridView.count(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 3,
                childAspectRatio: 9 / 16,
                children: List.generate(
                  userBloc.animeList.mediaListCollection.lists[index].entries
                      .length,
                  (entriesIndex) => Container(
                    margin: EdgeInsets.all(DEFAULT_PADDING_MEDIUM / 3),
                    child: ImageCard(
                      height: 400,
                      width: 120,
                      imageUrl: userBloc
                          .animeList
                          .mediaListCollection
                          .lists[index]
                          .entries[entriesIndex]
                          .media
                          .coverImage
                          .extraLarge,
                      title: userBloc.animeList.mediaListCollection.lists[index]
                          .entries[entriesIndex].media.title.userPreferred,
                      colors: [
                        Colors.transparent,
                        Colors.black45,
                        Colors.black,
                      ],
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => InfoScreen(
                            id: userBloc.animeList.mediaListCollection
                                .lists[index].entries[entriesIndex].media.id,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: DEFAULT_PADDING_MAXIMUM,
                ),
                child: Divider(
                  color: AppColors.tertiaryColor,
                  thickness: 1.3,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
