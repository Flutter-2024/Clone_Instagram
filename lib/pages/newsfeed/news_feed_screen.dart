import 'package:clone_instagram/pages/newsfeed/list_story.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NewsFeedScreen extends StatelessWidget {
  const NewsFeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: SvgPicture.asset("assets/logo_instagram.svg"),
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
        body: SafeArea(
          child: ListView(
            children: const [
              ListStory(),
            ],
          ),
        ));
  }
}
