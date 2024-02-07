import 'package:clone_instagram/custom_widget/overlay_entry_for_post.dart';
import 'package:flutter/material.dart';
import '../../../data/list_post.dart';
class PostTab extends StatelessWidget {
  PostTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.count(
        crossAxisCount: 3,
        childAspectRatio: 1.0,
        children: Post.imageUrls.map((url) {
          final int position = Post.imageUrls.indexOf(url) % 3;
          return OverlayEntryForPost(url: url, position: position);
        }).toList()
      ),
    );
  }
}
