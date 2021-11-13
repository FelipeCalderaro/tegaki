import 'package:anilist_app/core/models/character_info_model.dart';
import 'package:anilist_app/core/view_models/main_view_model.dart';
import 'package:anilist_app/ui/screens/info_screen/character_info_screen.dart';
import 'package:anilist_app/ui/screens/info_screen/info_screen.dart';
import 'package:anilist_app/ui/shared/image_card.dart';
import 'package:anilist_app/ui/values/colors.dart';
import 'package:anilist_app/ui/values/styles.dart';
import 'package:anilist_app/ui/values/values.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:html2md/html2md.dart' as html2md;
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class StaffInfoScreen extends StatefulWidget {
  String imageUrl;
  String heroTag;
  int id;

  bool showRoles = true;

  StaffInfoScreen({
    required this.imageUrl,
    required this.heroTag,
    required this.id,
  });

  @override
  _StaffInfoScreenState createState() => _StaffInfoScreenState();
}

class _StaffInfoScreenState extends State<StaffInfoScreen> {
  @override
  Widget build(BuildContext context) {
    final mainViewModel = Provider.of<MainViewModel>(context);
    return Scaffold(
      floatingActionButton: mainViewModel.BEARER_TOKEN != null &&
              mainViewModel.staffInfo != null
          ? FloatingActionButton(
              onPressed: () {
                // mainViewModel.getStaffInfo(widget.id);
                mainViewModel.toggleIsFavourite(
                    staffId: mainViewModel.staffInfo!.staff.id);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Container(
                      child: RichText(
                        text: TextSpan(
                          text: mainViewModel.staffInfo!.staff.isFavourite
                              ? "Removed "
                              : "Marked ",
                          style: TegakiTextStyles.regular,
                          children: [
                            TextSpan(
                              text: mainViewModel.staffInfo!.staff.name.full,
                              style: TegakiTextStyles.regularBold
                                  .copyWith(color: AppColors.lightColor),
                            ),
                            TextSpan(
                              text: mainViewModel.staffInfo!.staff.isFavourite
                                  ? ' from Favourites.'
                                  : ' as Favourite',
                            ),
                          ],
                        ),
                      ),
                    ),
                    backgroundColor: AppColors.tertiaryColor,
                    width: MediaQuery.of(context).size.width * .6,
                    behavior: SnackBarBehavior.floating,
                  ),
                );
              },
              child: Icon(
                mainViewModel.staffInfo == null
                    ? FontAwesomeIcons.heart
                    : mainViewModel.staffInfo!.staff.isFavourite
                        ? FontAwesomeIcons.solidHeart
                        : FontAwesomeIcons.heart,
                color: Colors.white,
              ),
              backgroundColor: AppColors.tertiaryColor,
            )
          : Container(),
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Hero(
              tag: widget.heroTag,
              child: Image.network(
                widget.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
              color: AppColors.primaryColor.withOpacity(.8),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: mainViewModel.staffInfo == null
                  ? Center(
                      child: CircularProgressIndicator(
                        valueColor:
                            AlwaysStoppedAnimation(AppColors.tertiaryColor),
                      ),
                    )
                  : SafeArea(
                      child: LazyLoadScrollView(
                        scrollOffset: 10,
                        onEndOfPage: () =>
                            mainViewModel.loadMoreStaffCharacters(
                          mainViewModel.staffInfo!.staff.characterMedia.pageInfo
                              .lastPage,
                          widget.id,
                        ),
                        child: ListView(
                          padding: EdgeInsets.all(DEFAULT_PADDING),
                          children: [
                            Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.all(DEFAULT_PADDING_MAXIMUM),
                              child: Text(
                                mainViewModel.staffInfo!.staff.name.full,
                                style: TegakiTextStyles.staffNameText,
                              ),
                            ),
                            Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.all(DEFAULT_PADDING_MAXIMUM),
                              child: Text(
                                mainViewModel.staffInfo!.staff.name.native,
                                style:
                                    TegakiTextStyles.staffAlternativeNamesText,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: DEFAULT_PADDING_MEDIUM),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: List.generate(
                                  mainViewModel
                                      .staffInfo!.staff.name.alternative.length,
                                  (index) => Text(
                                    mainViewModel.staffInfo!.staff.name
                                        .alternative[index],
                                    style: TegakiTextStyles
                                        .staffAlternativeNamesText
                                        .copyWith(fontSize: 15),
                                  ),
                                ),
                              ),
                            ),
                            mainViewModel.staffInfo!.staff.description != null
                                ? Markdown(
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    data: html2md.convert(
                                      mainViewModel
                                          .staffInfo!.staff.description!
                                          .replaceAll(
                                              ':**', ':</strong><br><br>')
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
                                  ),
                            Container(
                              margin: EdgeInsets.symmetric(
                                horizontal: DEFAULT_PADDING,
                                vertical: DEFAULT_PADDING_MEDIUM / 2,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Roles performed',
                                    style: TegakiTextStyles.regularBold
                                        .copyWith(fontSize: 21),
                                  ),
                                  IconButton(
                                    icon: Icon(
                                      widget.showRoles
                                          ? FontAwesomeIcons.eye
                                          : FontAwesomeIcons.eyeSlash,
                                      color: Colors.white,
                                    ),
                                    onPressed: () => setState(() =>
                                        widget.showRoles = !widget.showRoles),
                                  ),
                                ],
                              ),
                            ),
                            if (widget.showRoles)
                              Column(
                                children: List.generate(
                                  mainViewModel
                                      .staffInfo!.staff.staffMedia.edges.length,
                                  (index) => GestureDetector(
                                    onTap: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => InfoScreen(
                                          id: mainViewModel.staffInfo!.staff
                                              .staffMedia.edges[index].node.id,
                                        ),
                                      ),
                                    ),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: AppColors.primaryColor,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      padding: EdgeInsets.only(
                                          right: DEFAULT_PADDING),
                                      margin: EdgeInsets.symmetric(
                                          horizontal: DEFAULT_PADDING,
                                          vertical: DEFAULT_PADDING_MEDIUM / 2),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            height: 120,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .22,
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(10),
                                                bottomLeft: Radius.circular(10),
                                              ),
                                              child: Image.network(
                                                mainViewModel
                                                    .staffInfo!
                                                    .staff
                                                    .staffMedia
                                                    .edges[index]
                                                    .node
                                                    .coverImage
                                                    .large,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                left: DEFAULT_PADDING),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      .53,
                                                  child: RichText(
                                                    text: TextSpan(
                                                      text: mainViewModel
                                                          .staffInfo!
                                                          .staff
                                                          .staffMedia
                                                          .edges[index]
                                                          .staffRole,
                                                      style: TegakiTextStyles
                                                          .regularBold,
                                                      children: [
                                                        TextSpan(
                                                          text: ' in ',
                                                          style:
                                                              TegakiTextStyles
                                                                  .regular,
                                                        ),
                                                        TextSpan(
                                                          text: mainViewModel
                                                              .staffInfo!
                                                              .staff
                                                              .staffMedia
                                                              .edges[index]
                                                              .node
                                                              .title
                                                              .userPreferred,
                                                          style:
                                                              TegakiTextStyles
                                                                  .regularBold
                                                                  .copyWith(
                                                            color: AppColors
                                                                .tertiaryColor,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          // Container(
                                          //   width: 30,
                                          // ),
                                          // Text(
                                          //   "${DateTime.fromMillisecondsSinceEpoch(snapshot.data!.page.activities[index].createdAt * 1000).difference(DateTime.now()).inHours.abs().toString()} hours ago",
                                          //   style: TegakiTextStyles.secondaryText,
                                          // )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            if (mainViewModel
                                    .staffInfo!.staff.characterMedia.byYear !=
                                null)
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: List.generate(
                                  mainViewModel.staffInfo!.staff.characterMedia
                                      .byYear!.length,
                                  (columnIndex) => Column(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(
                                          left: DEFAULT_PADDING + 1,
                                        ),
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          mainViewModel
                                              .staffInfo!
                                              .staff
                                              .characterMedia
                                              .byYear![columnIndex]
                                              .year
                                              .toString(),
                                          style: TegakiTextStyles.regularBold
                                              .copyWith(fontSize: 21),
                                        ),
                                      ),
                                      Container(
                                        height: 230,
                                        margin: EdgeInsets.only(
                                          left: DEFAULT_PADDING / 2,
                                        ),
                                        alignment: Alignment.centerLeft,
                                        child: ListView(
                                          shrinkWrap: true,
                                          physics: BouncingScrollPhysics(),
                                          scrollDirection: Axis.horizontal,
                                          children: List.generate(
                                            mainViewModel
                                                .staffInfo!
                                                .staff
                                                .characterMedia
                                                .byYear![columnIndex]
                                                .edges
                                                .length,
                                            (listIndex) => Column(
                                              children: [
                                                Container(
                                                  height: 140,
                                                  width: 110,
                                                  margin: EdgeInsets.all(
                                                      DEFAULT_PADDING_MEDIUM),
                                                  child: Stack(
                                                    clipBehavior: Clip.none,
                                                    alignment:
                                                        Alignment.topLeft,
                                                    children: [
                                                      ImageCard(
                                                        height: 140,
                                                        width: 100,
                                                        imageUrl: mainViewModel
                                                            .staffInfo!
                                                            .staff
                                                            .characterMedia
                                                            .byYear![
                                                                columnIndex]
                                                            .edges[listIndex]
                                                            .node
                                                            .coverImage
                                                            .large,
                                                        onTap: () =>
                                                            Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder:
                                                                (context) =>
                                                                    InfoScreen(
                                                              id: mainViewModel
                                                                  .staffInfo!
                                                                  .staff
                                                                  .characterMedia
                                                                  .byYear![
                                                                      columnIndex]
                                                                  .edges[
                                                                      listIndex]
                                                                  .node
                                                                  .id,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Positioned(
                                                        left: 50,
                                                        top: 50,
                                                        child: Hero(
                                                          tag:
                                                              'characterStaff$listIndex$columnIndex',
                                                          child: ImageCard(
                                                            height: 100,
                                                            width: 60,
                                                            imageUrl: mainViewModel
                                                                .staffInfo!
                                                                .staff
                                                                .characterMedia
                                                                .byYear![
                                                                    columnIndex]
                                                                .edges[
                                                                    listIndex]
                                                                .characters[0]!
                                                                .image
                                                                .large,
                                                            onTap: () =>
                                                                Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        CharacterInfoScreen(
                                                                  id: mainViewModel
                                                                      .staffInfo!
                                                                      .staff
                                                                      .characterMedia
                                                                      .byYear![
                                                                          columnIndex]
                                                                      .edges[
                                                                          listIndex]
                                                                      .characters[
                                                                          0]!
                                                                      .id,
                                                                  heroTag:
                                                                      'characterStaff$listIndex$columnIndex',
                                                                  imageUrl: mainViewModel
                                                                      .staffInfo!
                                                                      .staff
                                                                      .characterMedia
                                                                      .byYear![
                                                                          columnIndex]
                                                                      .edges[
                                                                          listIndex]
                                                                      .characters[
                                                                          0]!
                                                                      .image
                                                                      .large,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  width: 130,
                                                  margin: EdgeInsets.all(
                                                    DEFAULT_PADDING_MEDIUM / 2,
                                                  ),
                                                  child: RichText(
                                                    maxLines: 3,
                                                    textAlign: TextAlign.center,
                                                    text: TextSpan(
                                                      text: mainViewModel
                                                          .staffInfo!
                                                          .staff
                                                          .characterMedia
                                                          .byYear![columnIndex]
                                                          .edges[listIndex]
                                                          .characters[0]!
                                                          .name
                                                          .full,
                                                      style: TegakiTextStyles
                                                          .staffNameText
                                                          .copyWith(
                                                              fontSize: 15),
                                                      children: [
                                                        TextSpan(text: '\n'),
                                                        TextSpan(
                                                          text: mainViewModel
                                                              .staffInfo!
                                                              .staff
                                                              .characterMedia
                                                              .byYear![
                                                                  columnIndex]
                                                              .edges[listIndex]
                                                              .node
                                                              .title
                                                              .userPreferred,
                                                          style:
                                                              TegakiTextStyles
                                                                  .secondaryText
                                                                  .copyWith(
                                                                      fontSize:
                                                                          12),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ))
        ],
      ),
    );
  }
}
