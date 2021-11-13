import 'package:anilist_app/core/view_models/main_view_model.dart';
import 'package:anilist_app/ui/screens/home/pages/home_tab.dart';
import 'package:anilist_app/ui/screens/home/pages/user_screen.dart';
import 'package:anilist_app/ui/screens/search_screen/search_screen.dart';
import 'package:anilist_app/ui/values/colors.dart';
import 'package:anilist_app/ui/values/styles.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class BasePage extends StatefulWidget {
  @override
  _BasePageState createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    final mainViewModel = Provider.of<MainViewModel>(context);
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.tertiaryColor,
        title: Text(
          'Tegaki',
          style: TegakiTextStyles.title,
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () => showSearch(
              context: context,
              delegate: SearchScreen(),
            ),
          )
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () => mainViewModel.getInformation(16498),
      // ),
      body: mainViewModel.homeLoadingNotDone
          ? Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(AppColors.tertiaryColor),
              ),
            )
          : Stack(
              alignment: Alignment.bottomCenter,
              children: [
                IndexedStack(
                  index: selectedIndex,
                  children: [
                    HomeTab(),
                    UserScreen(),
                  ],
                ),
                Positioned(
                  // left: MediaQuery.of(context).size.width * .3,
                  bottom: 20,
                  child: Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width * .63,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: BottomNavyBar(
                        backgroundColor: AppColors.quaternaryColor,
                        selectedIndex: selectedIndex,
                        items: [
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
                              child: Text('Profile'),
                            ),
                          ),
                          // BottomNavyBarItem(
                          //   activeColor: tertiaryColor,
                          //   inactiveColor: powderBlue,
                          //   icon: Icon(Icons.settings),
                          //   title: Padding(
                          //     padding: EdgeInsets.only(left: 8.0),
                          //     child: Text('Settings'),
                          //   ),
                          // ),
                        ],
                        onItemSelected: (index) => setState(() {
                          selectedIndex = index;
                        }),
                      ),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
