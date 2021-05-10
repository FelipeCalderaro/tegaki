import 'package:anilist_app/core/enums/media_status.dart';
import 'package:anilist_app/core/models/info_model.dart';
import 'package:anilist_app/core/view_models/main_view_model.dart';
import 'package:anilist_app/ui/screens/info_screen/pages/characters_screen.dart';
import 'package:anilist_app/ui/screens/info_screen/pages/overview_screen.dart';
import 'package:anilist_app/ui/screens/info_screen/pages/recommendation_screen.dart';
import 'package:anilist_app/ui/screens/info_screen/pages/staff_screen.dart';
import 'package:anilist_app/ui/screens/info_screen/pages/voice_actors.dart';
import 'package:anilist_app/ui/shared/rating_text.dart';
import 'package:anilist_app/ui/values/colors.dart';
import 'package:anilist_app/ui/values/styles.dart';
import 'package:anilist_app/ui/values/values.dart';
import 'package:animated_stack/animated_stack.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:html2md/html2md.dart' as html2md;

// ignore: must_be_immutable
class InfoScreen extends StatefulWidget {
  final int id;
  int currentStackIndex = 0;
  bool loadindDone = false;

  InfoScreen({
    required this.id,
  });

  @override
  _InfoScreenState createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  @override
  Widget build(BuildContext context) {
    print(widget.id);
    final mainViewModel = Provider.of<MainViewModel>(context);
    return FutureBuilder(
      future: mainViewModel.BEARER_TOKEN != null
          ? mainViewModel.getAuthenticatedInformation(widget.id)
          : mainViewModel.getInformation(widget.id),
      builder: (context, AsyncSnapshot<InfoModel?> snapshot) {
        print("Error: ${snapshot.hasError}");
        // return Scaffold(
        //   floatingActionButton: FloatingActionButton(
        //     onPressed: () => mainViewModel.getInformation(widget.id),
        //   ),
        //   body: Center(
        //     child: Text("Couldn't retrieve data :( "),
        //   ),
        // );
        if (!snapshot.hasData) {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(tertiaryColor),
              ),
            ),
          );
        } else if (snapshot.data == null || snapshot.hasError) {
          return Scaffold(
            body: Center(
              child: Text("Couldn't retrieve data :( "),
            ),
          );
        } else {
          if (mainViewModel.BEARER_TOKEN != null) {
            return AnimatedStack(
              fabBackgroundColor: tertiaryColor,
              backgroundColor: secondaryColor,
              columnWidget: buildFabColumnWidget(
                snapshot,
                mainViewModel,
                widget.id,
              ),
              bottomWidget: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: primaryColor,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(
                      FontAwesomeIcons.solidHeart,
                      color: tertiaryColor,
                    ),
                    Container(
                      width: DEFAULT_PADDING_MEDIUM / 2,
                    ),
                    Text('Favourite'),
                  ],
                ),
                onPressed: () {
                  if (snapshot.data!.media.type == 'ANIME') {
                    mainViewModel.toggleIsFavourite(animeId: widget.id);
                    ScaffoldMessenger.of(context).hideCurrentSnackBar();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Container(
                          child: RichText(
                            text: TextSpan(
                              text: snapshot.data!.media.isFavourite
                                  ? "Removed "
                                  : "Marked ",
                              style: TegakiTextStyles.regular,
                              children: [
                                TextSpan(
                                  text: snapshot.data!.media.title.romaji,
                                  style: TegakiTextStyles.regularBold
                                      .copyWith(color: lightColor),
                                ),
                                TextSpan(
                                  text: snapshot.data!.media.isFavourite
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
                  } else if (snapshot.data!.media.type == 'MANGA') {
                    mainViewModel.toggleIsFavourite(mangaId: widget.id);
                  }
                },
              ),
              foregroundWidget: ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(30),
                ),
                child: _buildBody(snapshot, mainViewModel),
              ),
            );
          } else {
            return _buildBody(snapshot, mainViewModel);
          }
        }
      },
    );
  }

  Scaffold _buildBody(
      AsyncSnapshot<InfoModel?> snapshot, MainViewModel mainViewModel) {
    return Scaffold(
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () => mainViewModel.getInformation(widget.id),
      // ),
      backgroundColor: primaryColor,
      body: Builder(builder: (context) {
        return Stack(
          children: [
            Container(
              width: double.infinity,
              height: 450,
              child: Image.network(
                snapshot.data!.media.coverImage.extraLarge,
                fit: BoxFit.cover,
              ),
            ),
            DraggableScrollableSheet(
              initialChildSize: 0.6,
              minChildSize: 0.6,
              maxChildSize: .9,
              builder: (context, scrollController) => Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(30),
                  ),
                  color: primaryColor,
                ),
                width: double.infinity,
                child: ListView(
                  padding: EdgeInsets.all(DEFAULT_PADDING),
                  controller: scrollController,
                  children: [
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: DEFAULT_PADDING),
                      alignment: Alignment.center,
                      child: Text(
                        snapshot.data!.media.title.userPreferred ??
                            snapshot.data!.media.title.romaji,
                        style: TegakiTextStyles.callout.copyWith(
                          fontSize: 24,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.only(
                        top: DEFAULT_PADDING_MEDIUM / 2,
                        bottom: DEFAULT_PADDING_MEDIUM,
                      ),
                      child: Text(
                        snapshot.data!.media.title.english ??
                            snapshot.data!.media.title.romaji,
                        style: TegakiTextStyles.callout.copyWith(
                          fontSize: 15,
                          color: Colors.grey,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    if (snapshot.data!.media.airingSchedule.nodes.isNotEmpty)
                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(
                          bottom: DEFAULT_PADDING_MEDIUM,
                        ),
                        child: StreamBuilder<Object>(
                          stream: mainViewModel
                              .calculateAiringAt(snapshot
                                  .data!.media.airingSchedule.nodes[0].airingAt)
                              .asBroadcastStream(),
                          builder: (context, streamSnapshot) {
                            if (!streamSnapshot.hasData) {
                              return Container();
                            } else {
                              return RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(
                                  text: 'Episode ',
                                  style:
                                      TegakiTextStyles.secondaryText.copyWith(
                                    color: Colors.grey,
                                  ),
                                  children: [
                                    TextSpan(
                                      text:
                                          "${snapshot.data!.media.airingSchedule.nodes[0].episode} ",
                                      style: TegakiTextStyles.infoButton,
                                    ),
                                    if (snapshot.data!.media.episodes != null)
                                      TextSpan(text: "of "),
                                    if (snapshot.data!.media.episodes != null)
                                      TextSpan(
                                        text:
                                            "${snapshot.data!.media.episodes} ",
                                        style: TegakiTextStyles.infoButton,
                                      ),
                                    TextSpan(text: "airing in\n"),
                                    TextSpan(
                                      text: "${streamSnapshot.data!}",
                                      style: TegakiTextStyles.infoButton,
                                    )
                                  ],
                                ),
                              );
                            }
                          },
                        ),
                      ),
                    Divider(
                      color: snapshot.data!.media.coverImage.color
                              ?.withOpacity(.4) ??
                          secondaryColor,
                      thickness: 1.5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (snapshot.data!.media.averageScore != null)
                              RatingText(
                                percentage: snapshot.data!.media.averageScore!,
                              ),
                            Container(
                              height: 2,
                            ),
                            Text(
                              "${snapshot.data!.media.popularity} Popularity",
                              style: TegakiTextStyles.secondaryText,
                            ),
                            Container(
                              height: 2,
                            ),
                            if (snapshot.data!.media.season != null)
                              Text(
                                "Season: ${snapshot.data!.media.season}",
                                style: TegakiTextStyles.secondaryText,
                              ),
                            if (snapshot.data!.media.seasonYear != null)
                              Text(
                                "Season Year: ${snapshot.data!.media.seasonYear}",
                                style: TegakiTextStyles.secondaryText,
                              ),
                          ],
                        ),
                        Container(
                          width: DEFAULT_PADDING_MAXIMUM,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (snapshot.data!.media.episodes != null)
                              Text(
                                "${snapshot.data!.media.episodes ?? 'No'} Episodes",
                                style: TegakiTextStyles.secondaryText,
                              ),
                            if (snapshot.data!.media.chapters != null)
                              Text(
                                "${snapshot.data!.media.chapters ?? 'No founded'} Chapters",
                                style: TegakiTextStyles.secondaryText,
                              ),
                            Text(
                              "Status: ${snapshot.data!.media.status}",
                              style: TegakiTextStyles.secondaryText,
                            ),
                            Text(
                              "Format: ${snapshot.data!.media.format}",
                              style: TegakiTextStyles.secondaryText,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Container(
                      height: DEFAULT_PADDING_MEDIUM,
                    ),
                    Wrap(
                      alignment: WrapAlignment.center,
                      children: List.generate(
                        snapshot.data!.media.genres.length > 3
                            ? 3
                            : snapshot.data!.media.genres.length,
                        (index) => Padding(
                          padding: EdgeInsets.only(
                              right: DEFAULT_PADDING_MEDIUM / 2),
                          child: Text(
                            snapshot.data!.media.genres[index],
                            style: TegakiTextStyles.regularSubtitle.copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                              color: snapshot.data!.media.coverImage.color ??
                                  powderBlue,
                            ),
                          ),
                        ),
                      ),
                    ),
                    if (snapshot.data!.media.description != null)
                      Container(
                        // height: 300,
                        child: Markdown(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          data: html2md.convert(
                            snapshot.data!.media.description!.split('\n')[0],
                          ),
                        ),
                      ),
                    Divider(
                      color:
                          snapshot.data!.media.coverImage.color ?? powderBlue,
                      thickness: 1.5,
                    ),
                    Container(
                      height: 50,
                      child: ListView(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        children: [
                          ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                widget.currentStackIndex == 0
                                    ? secondaryColor
                                    : primaryColor,
                              ),
                            ),
                            onPressed: () => setState(() {
                              widget.currentStackIndex = 0;
                            }),
                            child: Text(
                              'Overview',
                              style: TegakiTextStyles.infoButton,
                            ),
                          ),
                          ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                widget.currentStackIndex == 1
                                    ? secondaryColor
                                    : primaryColor,
                              ),
                            ),
                            onPressed: () => setState(() {
                              widget.currentStackIndex = 1;
                            }),
                            child: Text(
                              'Characters',
                              style: TegakiTextStyles.infoButton,
                            ),
                          ),
                          if (snapshot.data!.media.type == 'ANIME' ||
                              snapshot.data!.media.type == 'MOVIE')
                            ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                  widget.currentStackIndex == 2
                                      ? secondaryColor
                                      : primaryColor,
                                ),
                              ),
                              onPressed: () => setState(() {
                                widget.currentStackIndex = 2;
                              }),
                              child: Text(
                                'VoiceActors',
                                style: TegakiTextStyles.infoButton,
                              ),
                            ),
                          if (snapshot
                              .data!.media.staffPreview.edges.isNotEmpty)
                            ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                  widget.currentStackIndex == 3
                                      ? secondaryColor
                                      : primaryColor,
                                ),
                              ),
                              onPressed: () => setState(() {
                                widget.currentStackIndex = 3;
                              }),
                              child: Text(
                                'Staff',
                                style: TegakiTextStyles.infoButton,
                              ),
                            ),
                          snapshot.data!.media.recommendations != null
                              ? ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                      widget.currentStackIndex == 4
                                          ? secondaryColor
                                          : primaryColor,
                                    ),
                                  ),
                                  onPressed: () => setState(() {
                                    widget.currentStackIndex = 4;
                                  }),
                                  child: Text(
                                    'Recommendations',
                                    style: TegakiTextStyles.infoButton,
                                  ),
                                )
                              : Container(),
                        ],
                      ),
                    ),
                    [
                      OverviewScreen(snapshot: snapshot),
                      CharactersScreen(snapshot: snapshot),
                      VoiceActorsScreen(snapshot: snapshot),
                      StaffScreen(snapshot: snapshot),
                      RecommendationScreen(snapshot: snapshot),
                    ][widget.currentStackIndex]
                    // IndexedStack(
                    //   index: widget.currentStackIndex,
                    //   children: [
                    //     OverviewScreen(snapshot: snapshot),
                    //     CharactersScreen(snapshot: snapshot),
                    //     StaffScreen(snapshot: snapshot),
                    //     RecommendationScreen(snapshot: snapshot),
                    //   ],
                    // )
                  ],
                ),
              ),
            )
          ],
        );
      }),
    );
  }

  Column buildFabColumnWidget(
    AsyncSnapshot<InfoModel?> snapshot,
    MainViewModel mainViewModel,
    int id,
  ) {
    return Column(
      children: [
        FloatingActionButton(
          heroTag: "FloatingButton 1",
          onPressed: () {
            mainViewModel.setMediaStatus(id, MediaStatus.DROPPED);
            ScaffoldMessenger.of(context).removeCurrentSnackBar();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Container(
                  child: RichText(
                    text: TextSpan(
                      text: "Set ",
                      style: TegakiTextStyles.regular,
                      children: [
                        TextSpan(
                          text: snapshot.data!.media.title.romaji,
                          style: TegakiTextStyles.regularBold
                              .copyWith(color: lightColor),
                        ),
                        TextSpan(text: ' as Dropped'),
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
            Icons.cancel,
          ),
          backgroundColor: burntSienna,
        ),
        Container(height: DEFAULT_PADDING_MEDIUM),
        FloatingActionButton(
          heroTag: "FloatingButton 2",
          onPressed: () {
            mainViewModel.setMediaStatus(id, MediaStatus.REPEATING);
            ScaffoldMessenger.of(context).removeCurrentSnackBar();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Container(
                  child: RichText(
                    text: TextSpan(
                      text: "Set ",
                      style: TegakiTextStyles.regular,
                      children: [
                        TextSpan(
                          text: snapshot.data!.media.title.romaji,
                          style: TegakiTextStyles.regularBold
                              .copyWith(color: lightColor),
                        ),
                        TextSpan(
                          text: snapshot.data!.media.type == 'ANIME'
                              ? ' as Rewatching'
                              : ' as Rereading',
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
            Icons.settings_backup_restore,
          ),
          backgroundColor: blueGreen,
        ),
        Container(height: DEFAULT_PADDING_MEDIUM),
        FloatingActionButton(
          heroTag: "FloatingButton 3",
          onPressed: () {
            mainViewModel.setMediaStatus(id, MediaStatus.COMPLETED);
            ScaffoldMessenger.of(context).removeCurrentSnackBar();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Container(
                  child: RichText(
                    text: TextSpan(
                      text: "Set ",
                      style: TegakiTextStyles.regular,
                      children: [
                        TextSpan(
                          text: snapshot.data!.media.title.romaji,
                          style: TegakiTextStyles.regularBold
                              .copyWith(color: lightColor),
                        ),
                        TextSpan(text: ' as Completed'),
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
            FontAwesomeIcons.check,
          ),
          backgroundColor: persianGreen,
        ),
        Container(height: DEFAULT_PADDING_MEDIUM),
        FloatingActionButton(
            heroTag: "FloatingButton 4",
            onPressed: () {
              mainViewModel.setMediaStatus(id, MediaStatus.PAUSED);
              ScaffoldMessenger.of(context).removeCurrentSnackBar();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Container(
                    child: RichText(
                      text: TextSpan(
                        text: "Set ",
                        style: TegakiTextStyles.regular,
                        children: [
                          TextSpan(
                            text: snapshot.data!.media.title.romaji,
                            style: TegakiTextStyles.regularBold
                                .copyWith(color: lightColor),
                          ),
                          TextSpan(text: ' as Paused'),
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
              FontAwesomeIcons.pause,
            ),
            backgroundColor: yellowOrangeCrayola),
        Container(height: DEFAULT_PADDING_MEDIUM),
        FloatingActionButton(
          heroTag: "FloatingButton 5",
          onPressed: () {
            mainViewModel.setMediaStatus(id, MediaStatus.CURRENT);
            ScaffoldMessenger.of(context).removeCurrentSnackBar();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Container(
                  child: RichText(
                    text: TextSpan(
                      text: "Set ",
                      style: TegakiTextStyles.regular,
                      children: [
                        TextSpan(
                          text: snapshot.data!.media.title.romaji,
                          style: TegakiTextStyles.regularBold
                              .copyWith(color: lightColor),
                        ),
                        TextSpan(
                          text: snapshot.data!.media.type == 'ANIME'
                              ? ' as Watching'
                              : ' as Reading',
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
            FontAwesomeIcons.play,
          ),
          backgroundColor: charcoal,
        ),
        Container(height: DEFAULT_PADDING_MEDIUM),
        FloatingActionButton(
          heroTag: "FloatingButton 6",
          onPressed: () {
            mainViewModel.setMediaStatus(id, MediaStatus.PLANNING);
            ScaffoldMessenger.of(context).removeCurrentSnackBar();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Container(
                  child: RichText(
                    text: TextSpan(
                      text: "Set ",
                      style: TegakiTextStyles.regular,
                      children: [
                        TextSpan(
                          text: snapshot.data!.media.title.romaji,
                          style: TegakiTextStyles.regularBold
                              .copyWith(color: lightColor),
                        ),
                        TextSpan(
                          text: snapshot.data!.media.type == 'ANIME'
                              ? ' as Planning to watch'
                              : ' as Planning to read',
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
            FontAwesomeIcons.calendarCheck,
          ),
          backgroundColor: charcoal,
        ),
      ],
    );
  }
}
