import 'package:anilist_app/ui/values/colors.dart';
import 'package:anilist_app/ui/values/styles.dart';
import 'package:anilist_app/ui/values/values.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomBottomNavigationBarItem extends StatelessWidget {
  String label;
  IconData icon;
  bool active;
  Function()? onTap;

  CustomBottomNavigationBarItem({
    required this.icon,
    required this.onTap,
    required this.label,
    required this.active,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedSwitcher(
        duration: Duration(milliseconds: 300),
        switchInCurve: Curves.bounceIn,
        switchOutCurve: Curves.decelerate,
        transitionBuilder: (child, animation) => ScaleTransition(
          scale: animation,
          child: child,
        ),
        child: active
            ? Container(
                key: Key('container2'),
                margin: EdgeInsets.symmetric(
                  horizontal: DEFAULT_PADDING_MEDIUM / 2,
                ),
                padding: EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: active ? tertiaryColor : Colors.transparent,
                  borderRadius: BorderRadius.circular(10),
                ),
                alignment: Alignment.center,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      icon,
                      color: lightColor,
                    ),
                    Container(width: DEFAULT_PADDING / 2),
                    Container(
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        label,
                        style: TegakiTextStyles.regular.copyWith(fontSize: 15),
                      ),
                    )
                  ],
                ),
              )
            : Container(
                color: Colors.green,
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(horizontal: DEFAULT_PADDING),
                child: Icon(
                  icon,
                  color: lightColor,
                ),
              ),
      ),
    );
  }
}
