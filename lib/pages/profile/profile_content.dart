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
                const ProfileHeader(),
              ],
            ),
          )
        ],
        body: Column(
          children: [
            TabBar(
              tabs: [
                Tab(
                  icon: Image.asset("assets/images/post.png"),
                ),
                Tab(
                  icon: Image.asset("assets/images/film.png"),
                ),
                 const Tab(icon: FaIcon(FontAwesomeIcons.usersViewfinder),)
              ],
            ),
            const Expanded(
                child: TabBarView(
                  children: [
                    PostTab(),
                    ReelsTap(),
                    Text("Tab3")
                  ],
                )
            )
          ],
        ),
      ),
    );
  }

}
