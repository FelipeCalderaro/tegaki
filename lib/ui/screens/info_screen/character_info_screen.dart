import 'package:anilist_app/core/models/character_info_model.dart';
import 'package:anilist_app/core/view_models/main_view_model.dart';
import 'package:anilist_app/ui/values/colors.dart';
import 'package:anilist_app/ui/values/styles.dart';
import 'package:anilist_app/ui/values/values.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:html2md/html2md.dart' as html2md;
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class CharacterInfoScreen extends StatelessWidget {
  String imageUrl;
  String heroTag;
  int id;

  CharacterInfoScreen({
    required this.imageUrl,
    required this.heroTag,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    final mainViewModel = Provider.of<MainViewModel>(context);
    return Scaffold(
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () => mainViewModel.getCharacterInfo(id),
      // ),

      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Hero(
              tag: heroTag,
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            color: primaryColor.withOpacity(.8),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: FutureBuilder(
              future: mainViewModel.getCharacterInfo(id),
              builder: (context, AsyncSnapshot<CharacterInfoModel?> snapshot) {
                print(snapshot.hasError);
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(tertiaryColor),
                    ),
                  );
                } else if (snapshot.hasData && snapshot.data == null) {
                  return Center(
                    child: Container(
                      padding: EdgeInsets.all(DEFAULT_PADDING),
                      child: Text(
                        "Couldn't load the character info :/",
                        style: TegakiTextStyles.regularBold,
                      ),
                    ),
                  );
                } else {
                  return SafeArea(
                    child: Scaffold(
                      backgroundColor: Colors.transparent,
                      floatingActionButton: FloatingActionButton(
                        onPressed: () {
                          // mainViewModel.getStaffInfo(widget.id);
                          mainViewModel.toggleIsFavourite(
                            characterId: id,
                          );
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Container(
                                child: RichText(
                                  text: TextSpan(
                                    text: snapshot.data!.character.isFavourite
                                        ? "Removed "
                                        : "Marked ",
                                    style: TegakiTextStyles.regular,
                                    children: [
                                      TextSpan(
                                        text:
                                            snapshot.data!.character.name.full,
                                        style: TegakiTextStyles.regularBold
                                            .copyWith(color: lightColor),
                                      ),
                                      TextSpan(
                                        text:
                                            snapshot.data!.character.isFavourite
                                                ? ' from Favourites.'
                                                : ' as Favourite',
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              backgroundColor: tertiaryColor,
                              width: MediaQuery.of(context).size.width * .6,
                              behavior: SnackBarBehavior.floating,
                            ),
                          );
                        },
                        child: Icon(
                          snapshot.data!.character.isFavourite
                              ? FontAwesomeIcons.solidHeart
                              : FontAwesomeIcons.heart,
                          color: Colors.white,
                        ),
                        backgroundColor: tertiaryColor,
                      ),
                      body: ListView(
                        padding: EdgeInsets.all(DEFAULT_PADDING),
                        children: [
                          Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.all(DEFAULT_PADDING_MAXIMUM),
                            child: Text(
                              snapshot.data!.character.name.full,
                              style: TegakiTextStyles.characterNameText,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: DEFAULT_PADDING_MEDIUM),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: List.generate(
                                snapshot
                                    .data!.character.name.alternative.length,
                                (index) => Text(
                                  snapshot
                                      .data!.character.name.alternative[index],
                                  style: TegakiTextStyles
                                      .characterAlternativeNamesText
                                      .copyWith(fontSize: 15),
                                ),
                              ),
                            ),
                          ),
                          snapshot.data!.character.description != null
                              ? Markdown(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  data: html2md.convert(
                                    snapshot.data!.character.description!
                                        .replaceAll(':**', ':</strong><br><br>')
                                        .replaceAll('**', '<strong>')
                                        .replaceAll(':__', ':</strong><br>')
                                        .replaceAll('__:', ':</strong><br>')
                                        .replaceAll('_:', ':</strong><br>')
                                        .replaceAll('__', '<strong>')
                                        .replaceAll('_', '<strong>')
                                        .replaceAll('\n', '<br><br>')
                                        .replaceAll('~!', '')
                                        .replaceAll('!~', '')
                                        .replaceAllMapped(
                                            RegExp(r'\(https:\/\/.+?\)'),
                                            (match) => ' ')
                                        .replaceAllMapped(
                                            RegExp(r'[0-9],[0-9]'),
                                            (match) =>
                                                "${match.group(0)!.replaceAll(',', '')}")
                                        .replaceAll(',', '<br>')
                                        .replaceAllMapped(
                                            RegExp(r'[\[\]]'), (match) => ''),
                                  ),
                                  styleSheet: TegakiTextStyles
                                      .markdownStyleSheetDarkMode,
                                )
                              : Container(
                                  alignment: Alignment.center,
                                  padding:
                                      EdgeInsets.all(DEFAULT_PADDING_MAXIMUM),
                                  child: Text(
                                    'No description',
                                    style: TegakiTextStyles.regular,
                                  ),
                                )
                        ],
                      ),
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
