import 'package:anilist_app/core/view_models/main_view_model.dart';
import 'package:anilist_app/ui/screens/info_screen/info_screen.dart';
import 'package:anilist_app/ui/screens/trending/widgets/anime_card.dart';
import 'package:anilist_app/ui/values/styles.dart';
import 'package:anilist_app/ui/values/values.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:provider/provider.dart';

class AllTimePopularScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mainViewModel = Provider.of<MainViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'All time popular',
          style: TegakiTextStyles.appBarTitle,
        ),
      ),
      body: LazyLoadScrollView(
        onEndOfPage: () => mainViewModel.allTimePopularNextPage(),
        scrollOffset: (MediaQuery.of(context).size.height * .3).toInt(),
        child: ListView.builder(
          padding: EdgeInsets.all(DEFAULT_PADDING_MEDIUM),
          itemCount: mainViewModel.allTimePopular!.page.media.length,
          itemBuilder: (context, index) => AnimeCard(
            media: mainViewModel.allTimePopular!.page.media[index],
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => InfoScreen(
                  id: mainViewModel.allTimePopular!.page.media[index].id,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
