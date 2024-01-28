import 'package:clone_instagram/constants/media_utils.dart';
import 'package:clone_instagram/constants/source_string.dart';
import 'package:clone_instagram/pages/search_page/recent_search_page.dart';
import 'package:clone_instagram/pages/widgets/short_video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:loadmore/loadmore.dart';
import 'package:video_player/video_player.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: _body(context),
    );
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
      title: _search(context),
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
        child: SingleChildScrollView(
          child: _listView(context),
        ),
      )
    );
  }

  Widget _search(BuildContext context) {
    return InkWell(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(8.0),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          color: Color(0xffDCDCDC)//static
        ),
        child:  const Row(
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
              style: TextStyle(
                color: Colors.black54,
                fontSize: 20
              ),
            )
          ],
        ),
      ),
      onTap: (){
        showSearch(
          context: context,
          delegate: RecentSearchPage()
        );
      },
    );
  }

  Widget _listView(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          if(index % 2 == 0) {
            return _itemRight();
          }
          else {
            return _itemRight();
          }
        },
        separatorBuilder: (context, index) {
          return const Divider(
            color: Colors.transparent,
            height: 2.0,
          );
        },
        itemCount: 1,
      ),
    );
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
        // StaggeredGridTile.count(
        //   crossAxisCellCount: 1,
        //   mainAxisCellCount: 2,
        //   child: Container(
        //     //color: Colors.red,
        //     child: _itemMedia(),
        //   ),
        // ),
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
              )
          )
        ],
      ),
      onTap: (){

      },
    );
  }

  Widget _itemMedia() {
    return Stack(
      children: [
        const FittedBox(
          fit: BoxFit.cover,
          child: ShortVideoPlayer()
        ),
        Positioned(
          top: 5,
          right: 5,
          child: Image.asset(
            MediaUtils.iconMedia,
            height: 24.0,
            width: 24.0,
            color: Colors.red,
          ),
        ),
      ],
    );
  }
}