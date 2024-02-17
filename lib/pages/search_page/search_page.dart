import 'package:clone_instagram/constants/media_utils.dart';
import 'package:clone_instagram/constants/source_string.dart';
import 'package:clone_instagram/pages/search_page/recent_search_page.dart';
import 'package:clone_instagram/pages/widgets/feed_player/multi_manager/flick_multi_manager.dart';
import 'package:clone_instagram/pages/widgets/feed_player/multi_manager/flick_multi_player.dart';
import 'package:clone_instagram/pages/widgets/video_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:loadmore/loadmore.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late FlickMultiManager flickMultiManager;

  @override
  void initState() {
    super.initState();
    flickMultiManager = FlickMultiManager();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: const VideoGridView(),
    );
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
      title: _search(context),
    );
  }

  Widget _search(BuildContext context) {
    return InkWell(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(8.0),
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            color: Color(0xffDCDCDC) //static
            ),
        child: const Row(
          children: [
            FaIcon(
              FontAwesomeIcons.magnifyingGlass,
              //color: Colors.black,
            ),
            SizedBox(
              width: 16.0,
            ),
            Text(
              SourceString.search,
              style: TextStyle(color: Colors.black54, fontSize: 20),
            )
          ],
        ),
      ),
      onTap: () {
        showSearch(context: context, delegate: RecentSearchPage());
      },
    );
  }
}
