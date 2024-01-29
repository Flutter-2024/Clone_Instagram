import 'package:clone_instagram/constants/SourceString.dart';
import 'package:clone_instagram/pages/newsfeed/data/item_story_and_post.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ListPost extends StatefulWidget {
  const ListPost({super.key});

  @override
  State<ListPost> createState() => _ListPostState();
}

class _ListPostState extends State<ListPost> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16.0),
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: ItemStoryAndPost.itemStories.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: const EdgeInsets.only(top: 8.0),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 18,
                        backgroundImage: AssetImage(ItemStoryAndPost.itemStories[index].imageAvatar),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 8.0,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                (index == 0) ? SourceString.you : ItemStoryAndPost.itemStories[index].name,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                              ),
                              const Text(
                                SourceString.sponsored,
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset("assets/icon_more.svg"),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 4.0),
                  child: Image.asset(
                    ItemStoryAndPost.itemStories[index].imagePost,
                    fit: BoxFit.fitWidth,
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: () {
                          setState(() {
                            ItemStoryAndPost.itemStories[index].isLike = !ItemStoryAndPost.itemStories[index].isLike;
                          });
                        },
                      icon: ItemStoryAndPost.itemStories[index].isLike
                          ? SvgPicture.asset("assets/icon_liked.svg")
                          : SvgPicture.asset("assets/icon_notification.svg"),                    ),
                    IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset("assets/icon_comment.svg"),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset("assets/icon_share.svg"),
                    ),
                    Expanded(
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: IconButton(
                            onPressed: () {
                              setState(() {
                                ItemStoryAndPost.itemStories[index].isMark = !ItemStoryAndPost.itemStories[index].isMark;
                              });
                            },
                            icon: ItemStoryAndPost.itemStories[index].isMark
                                ? SvgPicture.asset("assets/icon_marked.svg")
                                : SvgPicture.asset("assets/icon_mark.svg"),
                          ),
                        ),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        SourceString.numberLike,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 8),
                        child: RichText(
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          text: const TextSpan(
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                            ),
                            children: [
                              TextSpan(
                                text: SourceString.userName,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(
                                text: " ${SourceString.description}",
                              ),
                              // more để dành làm sau
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        child: Container(
                          padding: const EdgeInsets.only(top: 8),
                          child: Text(
                            SourceString.viewComment,
                            style: TextStyle(
                              color: Colors.grey[700],
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
