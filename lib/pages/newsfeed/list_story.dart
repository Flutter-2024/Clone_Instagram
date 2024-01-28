import 'package:clone_instagram/pages/newsfeed/data/item_story_and_post.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ListStory extends StatelessWidget {
  const ListStory({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: ItemStoryAndPost.itemStories.length,
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return Container(
                margin: const EdgeInsets.only(right: 8.0, left: 12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                        child: Container(
                          alignment: Alignment.center,
                          child: Stack(
                            alignment: Alignment.bottomRight,
                            children: [
                              CircleAvatar(
                                radius: 32,
                                backgroundImage: AssetImage(ItemStoryAndPost.itemStories[index].imageAvatar),
                              ),
                              SvgPicture.asset("assets/icon_add_story.svg")
                            ],
                          ),
                        ),
                    ),
                    Text(
                        ItemStoryAndPost.itemStories[index].name,
                        overflow: TextOverflow.ellipsis,
                    ),
                  ],
                )
            );
          } else {
            return Container(
                width: 80,
                margin: const EdgeInsets.only(right: 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                        child: Container(
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                              colors: [
                                Color(0xFFC913B9),
                                Color(0xFFF9373F),
                                Color(0xFFFECD00),
                              ],
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                            ),
                          ),
                          child: ClipOval(
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                const CircleAvatar(
                                  radius: 36,
                                  backgroundColor: Colors.white,
                                ),
                                CircleAvatar(
                                  radius: 32,
                                  backgroundImage: AssetImage(ItemStoryAndPost.itemStories[index].imageAvatar),
                                ),
                              ],
                            ),
                          ),
                        )
                    ),
                    Text(
                        ItemStoryAndPost.itemStories[index].name,
                        overflow: TextOverflow.ellipsis,
                    ),
                  ],
                )
            );
          }
        },
      ),
    );
  }
}
