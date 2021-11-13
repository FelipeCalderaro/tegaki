import 'package:anilist_app/ui/screens/home/widgets/custom_bottom_navigation_bar_item.dart';
import 'package:anilist_app/ui/values/colors.dart';
import 'package:anilist_app/ui/values/values.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  int selectedindex = 0;
  List<BottomNavyBarItem> buttonsInfo = [
    BottomNavyBarItem(
      activeColor: AppColors.tertiaryColor,
      inactiveColor: AppColors.powderBlue,
      icon: Icon(Icons.grid_on),
      title: Padding(
        padding: EdgeInsets.only(left: 8.0),
        child: Text('Home'),
      ),
    ),
    BottomNavyBarItem(
      activeColor: AppColors.tertiaryColor,
      inactiveColor: AppColors.powderBlue,
      icon: Icon(FontAwesomeIcons.user),
      title: Padding(
        padding: EdgeInsets.only(left: 8.0),
        child: Text('Settings'),
      ),
    ),
    BottomNavyBarItem(
      activeColor: AppColors.tertiaryColor,
      inactiveColor: AppColors.powderBlue,
      icon: Icon(Icons.settings),
      title: Padding(
        padding: EdgeInsets.only(left: 8.0),
        child: Text('Settings'),
      ),
    ),
  ];

  // void changeActiveStatus(int index) {
  //   print(index);
  //   buttonsInfo.forEach((element) => print(element.active));
  //   buttonsInfo.forEach((element) => element.active = false);
  //   buttonsInfo[index].active = true;
  // }

  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      // left: MediaQuery.of(context).size.width * .3,
      bottom: 20,
      child: Container(
        height: 60,
        width: MediaQuery.of(context).size.width * .63,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: BottomNavyBar(
            backgroundColor: AppColors.secondaryColor,
            selectedIndex: widget.selectedindex,
            items: widget.buttonsInfo,
            onItemSelected: (index) => setState(() {
              widget.selectedindex = index;
            }),
          ),
        ),
      ),
    );
  }
}
