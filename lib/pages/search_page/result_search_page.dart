import 'package:clone_instagram/constants/source_string.dart';
import 'package:clone_instagram/pages/search_page/tab_bar_result_search_page/accounts_result_screen.dart';
import 'package:clone_instagram/pages/search_page/tab_bar_result_search_page/audio_result_screen.dart';
import 'package:clone_instagram/pages/search_page/tab_bar_result_search_page/for_you_result_screen.dart';
import 'package:clone_instagram/pages/search_page/tab_bar_result_search_page/places_result_screen.dart';
import 'package:clone_instagram/pages/search_page/tab_bar_result_search_page/reels_result_screen.dart';
import 'package:clone_instagram/pages/search_page/tab_bar_result_search_page/tags_result_screen.dart';
import 'package:flutter/material.dart';

class ResultSearchPage extends StatefulWidget {
  const ResultSearchPage({super.key, required this.result});

  final String result;
  @override
  State<ResultSearchPage> createState() => _ResultSearchState();
}

class _ResultSearchState extends State<ResultSearchPage> {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        initialIndex: 0,
        length: 6,
      child: Scaffold(
        appBar: _appBar(context),
        body: _body(context),
      ),
    );
  }

  PreferredSizeWidget _appBar(BuildContext context) {
    return AppBar(
      leading: null,
      automaticallyImplyLeading: false,
      toolbarHeight: 0,
      bottom:  const TabBar(
        tabAlignment: TabAlignment.start,
          unselectedLabelColor: Colors.grey,
          indicator: UnderlineTabIndicator(
            borderSide: BorderSide(color: Colors.black, width: 2),
            insets: EdgeInsets.symmetric(horizontal: 48),
          ),
          isScrollable: true,
          padding: EdgeInsets.zero,
          indicatorWeight: 4,
          tabs: [
            Tab(
              text: SourceString.forYou,
            ),
            Tab(
              text: SourceString.accounts,
            ),
            Tab(
              text: SourceString.audio,
            ),
            Tab(
              text: SourceString.tags,
            ),
            Tab(
              text: SourceString.places,
            ),
            Tab(
              text: SourceString.reels,
            ),
          ],
        ),
    );
  }

  Widget _body(BuildContext context) {
    return const TabBarView(
      children: <Widget>[
        Center(
          child: ForYouResultScreen(),
        ),
        Center(
          child: AccountsResultScreen(),
        ),
        Center(
          child: AudioResultScreen(),
        ),
        Center(
          child: TagsResultScreen(),
        ),
        Center(
          child: PlacesResultScreen(),
        ),
        Center(
          child: ReelsResultScreen(),
        ),
      ],
    );
  }
}
