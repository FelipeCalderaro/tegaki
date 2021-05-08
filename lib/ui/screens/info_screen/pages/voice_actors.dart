import 'package:anilist_app/core/models/info_model.dart';
import 'package:anilist_app/ui/shared/image_card.dart';
import 'package:anilist_app/ui/values/styles.dart';
import 'package:anilist_app/ui/values/values.dart';
import 'package:flutter/material.dart';

class VoiceActorsScreen extends StatelessWidget {
  AsyncSnapshot<InfoModel?> snapshot;
  VoiceActorsScreen({
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
        childAspectRatio: 9 / 18,
        children: List.generate(
          snapshot.data!.media.characters.edges.length,
          (index) => snapshot
                  .data!.media.characters.edges[index].voiceActors.isNotEmpty
              ? Column(
                  children: [
                    ImageCard(
                      height: 200,
                      width: 125,
                      imageUrl: snapshot.data!.media.characters.edges[index]
                          .voiceActors[0].image.large,
                      title: snapshot.data!.media.characters.edges[index]
                          .voiceActors[0].name.full,
                      textStyle: TegakiTextStyles.regularSubtitle
                          .copyWith(color: Colors.white),
                    ),
                    Text(
                      snapshot
                          .data!.media.characters.edges[index].node.name.full,
                      style:
                          TegakiTextStyles.secondaryText.copyWith(fontSize: 12),
                      textAlign: TextAlign.center,
                    ),
                  ],
                )
              : Container(
                  width: 100,
                  child: Center(
                    child: Text(
                      'No voice actor for ${snapshot.data!.media.characters.edges[index].node.name.full}',
                      style: TegakiTextStyles.regularSubtitle,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
