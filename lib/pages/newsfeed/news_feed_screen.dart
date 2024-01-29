import 'package:clone_instagram/pages/newsfeed/list_story.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'list_ post.dart';

class NewsFeedScreen extends StatelessWidget {
  const NewsFeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: NestedScrollView(
            headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  title: SvgPicture.asset("assets/logo_instagram.svg"),
                  floating: true,
                  snap: true,
                  actions: [
                    IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset("assets/icon_notification.svg"),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset("assets/icon_chat.svg"),
                    ),
                  ],
                ),
                const SliverToBoxAdapter(
                  child: ListStory(),
                ),
                SliverToBoxAdapter(
                  child: Divider(
                    thickness: 3,
                    color: Colors.grey[300],
                  ),
                ),
              ];
            },
            body: const ListPost(),
          ),
        ),
    );
  }
}
