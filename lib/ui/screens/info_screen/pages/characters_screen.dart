import 'package:anilist_app/core/models/info_model.dart';
import 'package:anilist_app/ui/screens/info_screen/character_info_screen.dart';
import 'package:anilist_app/ui/shared/image_card.dart';
import 'package:anilist_app/ui/values/styles.dart';
import 'package:anilist_app/ui/values/values.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CharactersScreen extends StatelessWidget {
  AsyncSnapshot<InfoModel?> snapshot;
  CharactersScreen({
    required this.snapshot,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 240,
      // color: Colors.white,
      padding: EdgeInsets.symmetric(vertical: DEFAULT_PADDING_MEDIUM / 2),
      child: GridView.count(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        crossAxisCount: MediaQuery.of(context).size.width > 200 ? 3 : 2,
        childAspectRatio: 9 / 17.5,
        children: List.generate(
          snapshot.data!.media.characters.edges.length,
          (index) => Column(
            children: [
              Hero(
                tag: 'image$index',
                child: ImageCard(
                  height: 200,
                  width: 125,
                  imageUrl: snapshot
                      .data!.media.characters.edges[index].node.image.large,
                  title: snapshot
                      .data!.media.characters.edges[index].node.name.full,
                  textStyle: TegakiTextStyles.regularSubtitle
                      .copyWith(color: Colors.white),
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CharacterInfoScreen(
                        imageUrl: snapshot.data!.media.characters.edges[index]
                            .node.image.large,
                        heroTag: 'image$index',
                        id: snapshot
                            .data!.media.characters.edges[index].node.id,
                      ),
                    ),
                  ),
                ),
              ),
              Text(
                snapshot.data!.media.characters.edges[index].role,
                style: TegakiTextStyles.secondaryText.copyWith(fontSize: 12),
              )
            ],
          ),
        ),
      ),
    );
  }
}
