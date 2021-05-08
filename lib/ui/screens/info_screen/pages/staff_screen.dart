import 'package:anilist_app/core/models/info_model.dart';
import 'package:anilist_app/ui/shared/image_card.dart';
import 'package:anilist_app/ui/values/styles.dart';
import 'package:anilist_app/ui/values/values.dart';
import 'package:flutter/material.dart';

class StaffScreen extends StatelessWidget {
  AsyncSnapshot<InfoModel?> snapshot;
  StaffScreen({
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
        childAspectRatio: 9 / 19,
        children: List.generate(
          snapshot.data!.media.staffPreview.edges.length,
          (index) => Column(
            children: [
              ImageCard(
                height: 200,
                width: 125,
                imageUrl: snapshot
                    .data!.media.staffPreview.edges[index].node.image.large,
                title: snapshot
                    .data!.media.staffPreview.edges[index].node.name.full,
                textStyle: TegakiTextStyles.regularSubtitle
                    .copyWith(color: Colors.white),
              ),
              Text(
                snapshot.data!.media.staffPreview.edges[index].role,
                style: TegakiTextStyles.secondaryText.copyWith(fontSize: 12),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}
