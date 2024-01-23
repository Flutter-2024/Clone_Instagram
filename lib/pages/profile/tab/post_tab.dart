
import 'package:flutter/material.dart';

import '../../../data/list_post.dart';

class PostTab extends StatelessWidget{
  const PostTab({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(crossAxisCount: 3,
      childAspectRatio: 1.0,
      children: Post.imageUrls.map(_createGridTileWidget).toList(),
    );
  }

  Widget _createGridTileWidget(String url) => Image.network(url, fit: BoxFit.cover);

}