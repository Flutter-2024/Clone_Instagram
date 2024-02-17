import 'package:clone_instagram/constants/media_utils.dart';
import 'package:clone_instagram/pages/search_page/recent_search_page.dart';
import 'package:clone_instagram/pages/widgets/feed_player/multi_manager/flick_multi_manager.dart';
import 'package:clone_instagram/pages/widgets/feed_player/multi_manager/flick_multi_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:loadmore/loadmore.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../constants/source_string.dart';

class VideoGridView extends StatefulWidget {
  const VideoGridView({super.key});

  @override
  State<VideoGridView> createState() => _VideoGridViewState();
}

class _VideoGridViewState extends State<VideoGridView> {
  late FlickMultiManager flickMultiManager;

  @override
  void initState() {
    super.initState();
    flickMultiManager = FlickMultiManager();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(context),
    );
  }

  Widget _body(BuildContext context) {
    return RefreshIndicator(
        onRefresh: () async {
          return Future<void>.delayed(const Duration(seconds: 2));
        },
        child: LoadMore(
          onLoadMore: () async {
            Future<void>.delayed(const Duration(seconds: 2));
            return true;
          },

          child: _listView(context),
        ));
  }

  Widget _listView(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: VisibilityDetector(
          key: ObjectKey(flickMultiManager),
          onVisibilityChanged: (visibility) {
            if (visibility.visibleFraction == 0 && mounted) {
              flickMultiManager.pause();
            }
          },
          child: ListView.separated(
            itemBuilder: (context, index) {
              if (index % 2 == 0) {
                return _itemRight();
              } else {
                return _itemLeft();
              }
            },
            separatorBuilder: (context, index) {
              return const Divider(
                color: Colors.transparent,
                height: 2.0,
              );
            },
            itemCount: 20,
          ),
        ));
  }

  Widget _itemRight() {
    return StaggeredGrid.count(
      crossAxisCount: 3,
      mainAxisSpacing: 2,
      crossAxisSpacing: 2,
      children: [
        StaggeredGridTile.count(
          crossAxisCellCount: 1,
          mainAxisCellCount: 1,
          child: _itemImage(),
        ),
        StaggeredGridTile.count(
          crossAxisCellCount: 1,
          mainAxisCellCount: 1,
          child: _itemImage(),
        ),
        StaggeredGridTile.count(
          crossAxisCellCount: 1,
          mainAxisCellCount: 2,
          child: Container(
            color: Colors.green,
            child: _itemMedia(),
          ),
        ),
        StaggeredGridTile.count(
          crossAxisCellCount: 1,
          mainAxisCellCount: 1,
          child: _itemImage(),
        ),
        StaggeredGridTile.count(
          crossAxisCellCount: 1,
          mainAxisCellCount: 1,
          child: _itemImage(),
        ),
      ],
    );
  }

  Widget _itemLeft() {
    return StaggeredGrid.count(
      crossAxisCount: 3,
      mainAxisSpacing: 2,
      crossAxisSpacing: 2,
      children: [
        StaggeredGridTile.count(
          crossAxisCellCount: 1,
          mainAxisCellCount: 2,
          child: Container(
            color: Colors.green,
            child: _itemMedia(),
          ),
        ),
        StaggeredGridTile.count(
          crossAxisCellCount: 1,
          mainAxisCellCount: 1,
          child: _itemImage(),
        ),
        StaggeredGridTile.count(
          crossAxisCellCount: 1,
          mainAxisCellCount: 1,
          child: _itemImage(),
        ),
        StaggeredGridTile.count(
          crossAxisCellCount: 1,
          mainAxisCellCount: 1,
          child: _itemImage(),
        ),
        StaggeredGridTile.count(
          crossAxisCellCount: 1,
          mainAxisCellCount: 1,
          child: _itemImage(),
        ),
      ],
    );
  }

  Widget _itemImage() {
    return InkWell(
      child: Stack(
        children: [
          Container(
            color: Colors.lightBlue,
            child: Image.asset(MediaUtils.urlTest),
          ),
          const Positioned(
              top: 5,
              right: 5,
              child: FaIcon(
                FontAwesomeIcons.solidClone,
                color: Colors.white,
              ))
        ],
      ),
      onTap: () {},
    );
  }

  Widget _itemMedia() {
    return Stack(
      children: [
        ClipRRect(
          child: FlickMultiPlayer(
            url: MediaUtils.urlButterfly,
            flickMultiManager: flickMultiManager,
            image: MediaUtils.imgButterfly,
          ),
        ),
        Positioned(
          top: 5,
          right: 5,
          child: Image.asset(
            MediaUtils.iconMedia,
            height: 24.0,
            width: 24.0,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
