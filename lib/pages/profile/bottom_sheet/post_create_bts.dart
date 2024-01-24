import 'package:clone_instagram/constants/source_image.dart';
import 'package:flutter/material.dart';

import '../../../constants/source_string.dart';

class PostCreateBts extends StatelessWidget {
  const PostCreateBts({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return ListView(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        children: [
          Divider(
            thickness: 3,
            indent: (width / 2) - 50,
            endIndent: (width / 2) - 50,
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            SourceString.create,
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
            textAlign: TextAlign.center,
          ),
          const Divider(),
          _getTypeCreate(
              name: SourceString.footage, picture: SourceImage.film),
          const Divider(
            indent: 48,
          ),
          _getTypeCreate(
              name: SourceString.post, picture: SourceImage.post),
          const Divider(
            indent: 48,
          ),
          _getTypeCreate(
              name: SourceString.news, picture: SourceImage.add),
          const Divider(
            indent: 48,
          ),
          _getTypeCreate(
              name: SourceString.newsHot, picture: SourceImage.heart),
          const Divider(
            indent: 48,
          ),
          _getTypeCreate(
              name: SourceString.live, picture: SourceImage.heart),
          const Divider(
            indent: 48,
          ),
          _getTypeCreate(
              name: SourceString.forYou, picture: SourceImage.heart),
        ]);
  }

  ListTile _getTypeCreate({required String name, required String picture}) {
    return ListTile(
      dense: true,
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0.0),
      visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
      title: Text(name),
      leading: Image.asset(picture),
    );
  }
}
