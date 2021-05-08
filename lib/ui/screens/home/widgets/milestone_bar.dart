import 'dart:math';

import 'package:anilist_app/ui/values/colors.dart';
import 'package:anilist_app/ui/values/values.dart';
import 'package:flutter/material.dart';

class MilestoneBar extends StatelessWidget {
  int value;
  MilestoneBar({
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: generatePAList(value),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: DEFAULT_PADDING_MEDIUM / 2),
            child: LinearProgressIndicator(
              minHeight: 15,
              value: calculatePercentage(value),
              // value: .85,
              valueColor: AlwaysStoppedAnimation(tertiaryColor),
              backgroundColor: secondaryColor,
            ),
          ),
        ],
      ),
    );
  }

  double calculatePercentage(int value) {
    int lastI = 0;
    for (var i = 100; i <= value; i += 150) {
      lastI = i;
    }
    lastI += 150;

    return value / (lastI + 420);
  }

  List<Widget> generatePAList(int value) {
    if (value < 450) value *= 2;
    int lastI = 0;
    List<int> paList = [];
    for (var i = 100; i <= value; i += 150) {
      paList.add(i);
      lastI = i;
    }
    paList.add(lastI + 150);
    print(paList);
    paList = paList.sublist(
        paList.length <= 3 ? 0 : paList.length - 3, paList.length);
    return List.generate(paList.length, (index) => Text('${paList[index]}'));
  }
}
