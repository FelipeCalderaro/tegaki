import 'package:anilist_app/core/models/info_model.dart';
import 'package:anilist_app/ui/screens/info_screen/info_screen.dart';
import 'package:anilist_app/ui/shared/image_card.dart';
import 'package:anilist_app/ui/values/styles.dart';
import 'package:anilist_app/ui/values/values.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RecommendationScreen extends StatelessWidget {
  AsyncSnapshot<InfoModel?> snapshot;
  RecommendationScreen({
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
        crossAxisCount: 3,
        childAspectRatio: 9 / 17.5,
        children: List.generate(
          snapshot.data!.media.recommendations!.nodes.length,
          (index) => ImageCard(
            height: 220,
            width: 110,
            imageUrl: snapshot.data!.media.recommendations!.nodes[index]
                .mediaRecommendation.coverImage.large,
            title: snapshot.data!.media.recommendations!.nodes[index]
                .mediaRecommendation.title.userPreferred,
            textStyle:
                TegakiTextStyles.regularSubtitle.copyWith(color: Colors.white),
            colors: [
              Colors.transparent,
              Colors.black38,
              Colors.black,
            ],
            onTap: () => Navigator.push(
              context,
              CupertinoPageRoute(
                builder: (context) => InfoScreen(
                  id: snapshot.data!.media.recommendations!.nodes[index]
                      .mediaRecommendation.id,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
