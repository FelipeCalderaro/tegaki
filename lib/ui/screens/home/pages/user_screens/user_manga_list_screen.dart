import 'package:anilist_app/core/models/manga_list_collection_model.dart';
import 'package:anilist_app/core/view_models/main_view_model.dart';
import 'package:anilist_app/ui/screens/info_screen/info_screen.dart';
import 'package:anilist_app/ui/shared/image_card.dart';
import 'package:anilist_app/ui/values/colors.dart';
import 'package:anilist_app/ui/values/styles.dart';
import 'package:anilist_app/ui/values/values.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserMangaListScreen extends StatefulWidget {
  @override
  _UserMangaListScreenState createState() => _UserMangaListScreenState();
}

class _UserMangaListScreenState extends State<UserMangaListScreen> {
  @override
  Widget build(BuildContext context) {
    final mainViewModel = Provider.of<MainViewModel>(context);
    return FutureBuilder(
      future: mainViewModel.getMangaList(
        mainViewModel.userInfo!.user.id,
        mainViewModel.userInfo!.user.name,
      ),
      builder: (context, AsyncSnapshot<MangaListCollection?> snapshot) {
        print("UserMangaListScreen ----> ${snapshot.hasError}");
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
              children: List.generate(
                snapshot.data!.mediaListCollection.lists.length,
                (index) => Column(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.all(DEFAULT_PADDING_MEDIUM / 2),
                      child: Text(
                        snapshot.data!.mediaListCollection.lists[index].name,
                        style: TegakiTextStyles.buttonHighlight,
                      ),
                    ),
                    GridView.count(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      crossAxisCount: 3,
                      childAspectRatio: 9 / 16,
                      children: List.generate(
                        snapshot.data!.mediaListCollection.lists[index].entries
                            .length,
                        (entriesIndex) => Container(
                          margin: EdgeInsets.all(DEFAULT_PADDING_MEDIUM / 3),
                          child: ImageCard(
                            height: 400,
                            width: 120,
                            imageUrl: snapshot
                                .data!
                                .mediaListCollection
                                .lists[index]
                                .entries[entriesIndex]
                                .media
                                .coverImage
                                .extraLarge,
                            title: snapshot
                                .data!
                                .mediaListCollection
                                .lists[index]
                                .entries[entriesIndex]
                                .media
                                .title
                                .userPreferred,
                            colors: [
                              Colors.transparent,
                              Colors.black45,
                              Colors.black,
                            ],
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => InfoScreen(
                                  id: snapshot
                                      .data!
                                      .mediaListCollection
                                      .lists[index]
                                      .entries[entriesIndex]
                                      .media
                                      .id,
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
                        color: tertiaryColor,
                        thickness: 1.3,
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
