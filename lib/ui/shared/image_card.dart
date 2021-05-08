import 'package:anilist_app/ui/values/styles.dart';
import 'package:anilist_app/ui/values/values.dart';
import 'package:flutter/material.dart';

class ImageCard extends StatelessWidget {
  double width;
  double height;
  String imageUrl;
  String? title;
  TextStyle? textStyle;
  List<Color>? colors;
  Function()? onTap;

  ImageCard({
    required this.height,
    required this.width,
    required this.imageUrl,
    this.title,
    this.textStyle,
    this.colors,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          height: height,
          width: width,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: height,
                width: width,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                height: height,
                width: width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: colors ??
                        [
                          Colors.transparent,
                          Colors.black54,
                        ],
                  ),
                  // color: secondaryColor.withOpacity(.95),
                ),
              ),
              title == null
                  ? Container()
                  : Positioned(
                      bottom: DEFAULT_PADDING / 2,
                      left: DEFAULT_PADDING / 2,
                      child: Container(
                        width: width / 1.27,
                        child: Text(
                          title!,
                          style: textStyle ?? TegakiTextStyles.buttonHighlight,
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
