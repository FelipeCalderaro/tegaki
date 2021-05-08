import 'package:anilist_app/ui/values/styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RatingText extends StatelessWidget {
  int percentage;
  RatingText({
    required this.percentage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            percentage > 75
                ? FontAwesomeIcons.smile
                : percentage > 50
                    ? FontAwesomeIcons.meh
                    : percentage > 25
                        ? FontAwesomeIcons.frown
                        : FontAwesomeIcons.angry,
            color: percentage > 75
                ? Colors.green
                : percentage > 50
                    ? Colors.orange
                    : percentage > 25
                        ? Colors.red[500]
                        : Colors.red,
            size: 15,
          ),
          Container(
            width: 5,
          ),
          Text(
            '$percentage %',
            style: TegakiTextStyles.regularSubtitle.copyWith(
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
