import 'package:anilist_app/core/models/info_model.dart';
import 'package:anilist_app/ui/screens/info_screen/character_info_screen.dart';
import 'package:anilist_app/ui/screens/info_screen/info_screen.dart';
import 'package:anilist_app/ui/shared/image_card.dart';
import 'package:anilist_app/ui/values/colors.dart';
import 'package:anilist_app/ui/values/styles.dart';
import 'package:anilist_app/ui/values/values.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class OverviewScreen extends StatelessWidget {
  AsyncSnapshot<InfoModel?> snapshot;

  OverviewScreen({
    required this.snapshot,
  });

  int indexOfMaxValue(List<ScoreDistribution> list) {
    int currentIndex = 0;
    int currentvalue = 0;
    for (int i = 0; i < list.length; i++) {
      if (list[i].amount > currentvalue) {
        currentIndex = i;
        currentvalue = list[i].amount;
      }
    }

    return currentIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: DEFAULT_PADDING),
          child: Text(
            "Characters",
            style: TegakiTextStyles.regularBold.copyWith(fontSize: 20),
          ),
        ),
        Container(
          height: 240,
          // color: Colors.white,
          padding: EdgeInsets.symmetric(vertical: DEFAULT_PADDING_MEDIUM / 2),
          child: ListView.builder(
            // shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            itemCount: snapshot.data!.media.characters.edges.length > 6
                ? 6
                : snapshot.data!.media.characters.edges.length,
            itemBuilder: (context, index) => Column(
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
                      CupertinoPageRoute(
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
        if (snapshot.data!.media.type == 'ANIME' ||
            snapshot.data!.media.type == 'MOVIE')
          Padding(
            padding: EdgeInsets.only(top: DEFAULT_PADDING),
            child: Text(
              "Voice actors",
              style: TegakiTextStyles.regularBold.copyWith(fontSize: 20),
            ),
          ),
        if (snapshot.data!.media.type == 'ANIME' ||
            snapshot.data!.media.type == 'MOVIE')
          Container(
            height: 240,
            // color: Colors.white,
            padding: EdgeInsets.symmetric(vertical: DEFAULT_PADDING_MEDIUM / 2),
            child: ListView.builder(
              // shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              itemCount: snapshot.data!.media.characters.edges.length >= 6
                  ? 6
                  : snapshot.data!.media.characters.edges.length,
              itemBuilder: (context, index) => snapshot.data!.media.characters
                      .edges[index].voiceActors.isNotEmpty
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
                          snapshot.data!.media.characters.edges[index].node.name
                              .full,
                          style: TegakiTextStyles.secondaryText
                              .copyWith(fontSize: 12),
                        ),
                      ],
                    )
                  : Container(
                      margin: EdgeInsets.all(DEFAULT_PADDING_MEDIUM),
                      width: 125,
                      child: Center(
                        child: Text(
                          'No voice actor yet for ${snapshot.data!.media.characters.edges[index].node.name.full}',
                          style: TegakiTextStyles.regularSubtitle,
                        ),
                      ),
                    ),
            ),
          ),
        if (snapshot.data!.media.source != 'ORIGINAL' &&
            snapshot.data!.media.source != 'OTHER')
          Padding(
            padding: EdgeInsets.only(top: DEFAULT_PADDING),
            child: Text(
              "Relations",
              // snapshot.data!.media.source,
              style: TegakiTextStyles.regularBold.copyWith(fontSize: 20),
            ),
          ),
        if (snapshot.data!.media.source != 'ORIGINAL' &&
            snapshot.data!.media.source != 'OTHER')
          Container(
            // height: 240,
            // color: Colors.white,,
            child: GridView.count(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 3,
              childAspectRatio: 9 / 14,
              children: List.generate(
                snapshot.data!.media.relations.edges.length > 6
                    ? 6
                    : snapshot.data!.media.relations.edges.length,
                (index) => ImageCard(
                  height: 200,
                  width: 125,
                  imageUrl: snapshot.data!.media.relations.edges[index].node
                      .coverImage.medium,
                  title:
                      snapshot.data!.media.relations.edges[index].relationType,
                  textStyle: TegakiTextStyles.regularSubtitle
                      .copyWith(color: Colors.white),
                  onTap: () => Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => InfoScreen(
                        id: snapshot.data!.media.relations.edges[index].node.id,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        Padding(
          padding: EdgeInsets.only(top: DEFAULT_PADDING),
          child: Text(
            "Score Distributions",
            style: TegakiTextStyles.regularBold.copyWith(fontSize: 20),
          ),
        ),
        Container(
          child: SfCircularChart(
            // title: ChartTitle(text: "StatusDistribution"),
            legend: Legend(
              isVisible: true,
              textStyle: TegakiTextStyles.secondaryText,
            ),
            series: [
              PieSeries(
                explode: true,
                explodeIndex: indexOfMaxValue(
                    snapshot.data!.media.stats.scoreDistribution),
                dataSource: List<ScoreDistribution>.generate(
                    snapshot.data!.media.stats.scoreDistribution.length,
                    (index) =>
                        snapshot.data!.media.stats.scoreDistribution[index]),
                xValueMapper: (data, _) => data.score.toString(),
                yValueMapper: (data, _) => data.amount,
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: DEFAULT_PADDING),
          child: Text(
            "Status Distributions",
            style: TegakiTextStyles.regularBold.copyWith(fontSize: 20),
          ),
        ),
        Container(
          child: SfCircularChart(
            // title: ChartTitle(text: "StatusDistribution"),

            legend: Legend(
              isVisible: true,
              textStyle: TegakiTextStyles.secondaryText,
            ),
            series: [
              RadialBarSeries(
                trackColor: secondaryColor,
                dataSource: List<StatusDistribution>.generate(
                    snapshot.data!.media.stats.statusDistribution.length,
                    (index) =>
                        snapshot.data!.media.stats.statusDistribution[index]),
                xValueMapper: (data, _) => data!.status,
                yValueMapper: (data, _) => data!.amount,
              ),
            ],
          ),
        )
      ],
    );
  }
}
