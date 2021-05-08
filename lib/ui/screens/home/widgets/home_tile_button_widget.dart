import 'package:anilist_app/ui/values/colors.dart';
import 'package:anilist_app/ui/values/styles.dart';
import 'package:anilist_app/ui/values/values.dart';
import 'package:flutter/material.dart';

class HomeTileButtonWidget extends StatelessWidget {
  Function()? onTap;
  String title;
  double height;
  Color color;
  String imageUrl;

  HomeTileButtonWidget({
    required this.height,
    required this.title,
    required this.imageUrl,
    this.color = secondaryColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
        ),
        height: height,
        width: (MediaQuery.of(context).size.width / 2) - DEFAULT_PADDING * 2,
        // padding: EdgeInsets.all(DEFAULT_PADDING),
        margin: EdgeInsets.all(DEFAULT_PADDING_MEDIUM / 2),
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Container(
              height: height,
              width:
                  (MediaQuery.of(context).size.width / 2) - DEFAULT_PADDING * 2,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              height: height,
              width:
                  (MediaQuery.of(context).size.width / 2) - DEFAULT_PADDING * 2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    secondaryColor.withOpacity(1),
                    secondaryColor.withOpacity(.98),
                    secondaryColor.withOpacity(.75),
                    secondaryColor.withOpacity(.55),
                  ],
                ),
                // color: secondaryColor.withOpacity(.95),
              ),
            ),
            Positioned(
              top: DEFAULT_PADDING,
              left: DEFAULT_PADDING,
              child: Container(
                width: 100,
                child: Text(
                  title,
                  style: TegakiTextStyles.buttonHighlight,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
