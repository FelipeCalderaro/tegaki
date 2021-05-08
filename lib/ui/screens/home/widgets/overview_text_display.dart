import 'package:anilist_app/ui/values/colors.dart';
import 'package:anilist_app/ui/values/styles.dart';
import 'package:flutter/material.dart';

class OverviewTextDisplay extends StatelessWidget {
  String value;
  String title;
  OverviewTextDisplay({
    required this.value,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: TegakiTextStyles.regular.copyWith(
            color: tertiaryColor,
            fontSize: 18,
          ),
        ),
        Text(
          title,
          style: TegakiTextStyles.regularSubtitle,
        ),
      ],
    );
  }
}
