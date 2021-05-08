import 'package:anilist_app/core/models/defalt_info_model.dart';
import 'package:anilist_app/core/view_models/main_view_model.dart';
import 'package:anilist_app/ui/screens/info_screen/info_screen.dart';
import 'package:anilist_app/ui/screens/trending/widgets/anime_card.dart';
import 'package:anilist_app/ui/values/colors.dart';
import 'package:anilist_app/ui/values/styles.dart';
import 'package:anilist_app/ui/values/values.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class SearchScreen extends SearchDelegate {
  @override
  String? get searchFieldLabel => 'Search';

  @override
  TextStyle? get searchFieldStyle => TegakiTextStyles.appBarTitle;

  @override
  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context).copyWith(
      textTheme: TextTheme(
        bodyText2: TegakiTextStyles.appBarTitle,
      ),
      inputDecorationTheme: InputDecorationTheme(
        labelStyle: TegakiTextStyles.appBarTitle,
        hintStyle: TegakiTextStyles.appBarTitle,
      ),
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: powderBlue,
        selectionColor: powderBlue,
        selectionHandleColor: powderBlue,
      ),
    );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      if (query.length != 0)
        IconButton(
          icon: Icon(Icons.clear),
          onPressed: () => query = '',
        ),
      IconButton(
        icon: Icon(Icons.search),
        onPressed: () => buildResults(context),
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back_ios),
      onPressed: () => Navigator.pop(context),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final mainViewModel = Provider.of<MainViewModel>(context);
    return FutureBuilder(
      future: mainViewModel.search(query),
      builder: (context, AsyncSnapshot<DefaultInfoModel?> snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(tertiaryColor),
            ),
          );
        } else if (snapshot.hasData && snapshot.data!.page.media.isEmpty) {
          return Center(
            child: Container(
              child: Text("Couldn't find $query :/"),
            ),
          );
        } else {
          return ListView.builder(
            padding: EdgeInsets.all(DEFAULT_PADDING_MEDIUM / 2),
            itemCount: snapshot.data!.page.media.length,
            itemBuilder: (context, index) => AnimeCard(
              media: snapshot.data!.page.media[index],
              onTap: () => Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (context) => InfoScreen(
                    id: snapshot.data!.page.media[index].id,
                  ),
                ),
              ),
            ),
          );
        }
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return Center(
        child: Text('Search for something :)'),
      );
    } else {
      return buildResults(context);
    }
  }
}
