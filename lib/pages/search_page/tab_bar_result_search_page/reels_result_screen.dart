import 'package:clone_instagram/data/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../../model/reels.dart';

class ReelsResultScreen extends StatefulWidget {
  const ReelsResultScreen({super.key});

  @override
  State<ReelsResultScreen> createState() => _ReelsResultScreenState();
}

class _ReelsResultScreenState extends State<ReelsResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.separated(
          itemBuilder: (context, index) {
            return _itemGridView(context, DataReels.listReels[index*3], DataReels.listReels[index*3 +1],DataReels.listReels[index*3+2]);
          },
          separatorBuilder:(context, index) {
            return const Divider(
              color: Colors.transparent,
              height: 2,
            );
          },
          itemCount: 10
      ),
    );
  }

  Widget _itemGridView(BuildContext context, Reels reel_01, Reels reel_02, Reels reel_03) {
    return StaggeredGrid.count(
      crossAxisCount: 3,
      mainAxisSpacing: 2,
      crossAxisSpacing: 2,
      children: [
        StaggeredGridTile.count(
          crossAxisCellCount: 1,
          mainAxisCellCount: 2,
          child: _itemImage(context, reel_01),
        ),
        StaggeredGridTile.count(
          crossAxisCellCount: 1,
          mainAxisCellCount: 2,
          child: _itemImage(context, reel_02),
        ),
        StaggeredGridTile.count(
          crossAxisCellCount: 1,
          mainAxisCellCount: 2,
          child: _itemImage(context, reel_03),
        ),
      ],
    );
  }

  Widget _itemImage(BuildContext context, Reels reel) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          reel.avatar,
          fit: BoxFit.cover,
        ),
        Positioned(
          left: 0,
          bottom: 0,
          child: Row(
            children: [
              const Icon(
                Icons.play_arrow_outlined,
                color: Colors.white,
                size: 28,
              ),
              Text(
                reel.views,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.white
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
