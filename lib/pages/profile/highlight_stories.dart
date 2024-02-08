import 'package:clone_instagram/custom_widget/avatar_with_highlight.dart';
import 'package:flutter/material.dart';

import '../../data/list_highligt.dart';

class HighlightStories extends StatelessWidget {
  const HighlightStories({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: Highlight.highlightItems.length,
        itemBuilder: (context, index) {
          return Row(
            children: [
              Column(
                children: [
                  AvatarWithHighlight(
                      imageUrl: Highlight.highlightItems[index].image,
                      isNetworkImage: false,
                      sizeContainer: 65,
                      radius: 40,
                      isShowHighlight: true,
                      haveAddIcon: false),
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Text(
                      Highlight.highlightItems[index].title,
                      style: const TextStyle(fontSize: 13),
                      overflow: TextOverflow.ellipsis,
                    ),
                  )
                ],
              ),
              const SizedBox(
                width: 10,
              )
            ],
          );
        },
      ),
    );
  }
}
