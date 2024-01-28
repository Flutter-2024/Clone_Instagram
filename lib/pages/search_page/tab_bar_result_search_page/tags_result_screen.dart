import 'package:clone_instagram/data/data.dart';
import 'package:clone_instagram/model/tags.dart';
import 'package:flutter/material.dart';

class TagsResultScreen extends StatefulWidget {
  const TagsResultScreen({super.key});

  @override
  State<TagsResultScreen> createState() => _TagsResultScreenState();
}

class _TagsResultScreenState extends State<TagsResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView.separated(
        itemCount: DataTags.listTags.length,
        itemBuilder: (context, index) {
          return _itemTag(DataTags.listTags[index]);
        },
        separatorBuilder: (context, index) {
          return const Divider(
            height: 0.0,
            color: Colors.transparent,
          );
        },
      ),
    );
  }

  Widget _itemTag(Tags tag) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(20.0),
          margin: const EdgeInsets.only(right: 16.0),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey, width: 1),
            shape: BoxShape.circle
          ),
          child: const Text(
            "#",
            style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w900
            ),
          ),
        ),
        Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  tag.tag,
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500
                  ),
                ),
                Text(
                  "${tag.posts} posts",
                  style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.w500
                  ),
                )
              ],
            )
        ),
      ],
    );
  }
}
