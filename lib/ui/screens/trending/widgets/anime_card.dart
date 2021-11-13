import 'package:anilist_app/core/models/defalt_info_model.dart';
import 'package:anilist_app/ui/shared/image_card.dart';
import 'package:anilist_app/ui/shared/rating_text.dart';
import 'package:anilist_app/ui/values/colors.dart';
import 'package:anilist_app/ui/values/styles.dart';
import 'package:anilist_app/ui/values/values.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AnimeCard extends StatelessWidget {
  Media media;
  Function() onTap;

  AnimeCard({
    required this.media,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        color: AppColors.prussianBlue,
        child: Container(
          child: Row(
            children: [
              ImageCard(
                height: 160,
                width: MediaQuery.of(context).size.width * .3,
                imageUrl: media.coverImage.extraLarge ?? media.coverImage.large,
              ),
              Container(
                width: MediaQuery.of(context).size.width * .57,
                padding: EdgeInsets.only(left: DEFAULT_PADDING_MEDIUM / 2),
                // color: Colors.red,
                height: 150,
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      // media.title.userPreferred?.toUpperCase() ??
                      media.title.romaji
                      // .toUpperCase(),
                      ,
                      maxLines: 3,
                      style:
                          TegakiTextStyles.regularTitle.copyWith(fontSize: 16),
                    ),
                    // media.title.english != null
                    //     ? Text(
                    //         media.title.english!,
                    //         style: TegakiTextStyles.regularSubtitle,
                    //       )
                    //     : Container(),
                    Divider(
                      thickness: 2,
                      height: DEFAULT_PADDING_MAXIMUM,
                      color: AppColors.tertiaryColor,
                    ),
                    Wrap(
                      alignment: WrapAlignment.center,
                      children: List.generate(
                        media.genres.length > 3 ? 3 : media.genres.length,
                        (index) => Padding(
                          padding: EdgeInsets.only(
                              right: DEFAULT_PADDING_MEDIUM / 2),
                          child: Text(
                            media.genres[index],
                            style: TegakiTextStyles.regularSubtitle.copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                              color: media.coverImage.color ??
                                  AppColors.powderBlue,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Divider(height: DEFAULT_PADDING_MEDIUM),

                    Row(
                      children: [
                        media.averageScore != null
                            ? RatingText(
                                percentage: media.averageScore!,
                              )
                            : Container(),
                        Padding(
                          padding:
                              EdgeInsets.only(left: DEFAULT_PADDING_MEDIUM / 2),
                          child: Text(
                            '${media.popularity} Users',
                            style: TegakiTextStyles.secondaryText,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
