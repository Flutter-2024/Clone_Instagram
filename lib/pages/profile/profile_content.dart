import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class ProfileContent extends StatelessWidget{
  const ProfileContent({super.key});

  @override
  Widget build(BuildContext context) {
    return  DefaultTabController(length: 3,
      child: Column(
        children: [
          TabBar(tabs: [
            Tab(icon: Image.asset("assets/images/post.png"),),
            Tab(icon: Image.asset("assets/images/film.png"),),
            const Tab(icon: FaIcon(FontAwesomeIcons.usersViewfinder),)

          ])
        ],
      ),
    );
  }

}