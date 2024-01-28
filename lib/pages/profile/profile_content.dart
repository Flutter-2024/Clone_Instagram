import 'package:clone_instagram/constants/source_image.dart';
import 'package:clone_instagram/pages/profile/tab/post_tab.dart';
import 'package:clone_instagram/pages/profile/tab/reels_tab.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:clone_instagram/pages/profile/profile_header.dart';
import 'package:flutter/material.dart';

class ProfileContent extends StatelessWidget{
  const ProfileContent({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) =>
            [
          SliverList(
            delegate: SliverChildListDelegate(
              [
                 ProfileHeader(),
              ],
            ),
          )
        ],
        body: Column(
          children: [
            TabBar(
              tabs: [
                Tab(
                  icon: Image.asset(SourceImage.post),
                ),
                Tab(
                  icon: Image.asset(SourceImage.film),
                ),
                 const Tab(icon: FaIcon(FontAwesomeIcons.usersViewfinder),)
              ],
            ),
             Expanded(
                child: TabBarView(
                  children: [
                    PostTab(),
                    const ReelsTap(),
                    const Text("Tab3")
                  ],
                )
            )
          ],
        ),
      ),
    );
  }

}
