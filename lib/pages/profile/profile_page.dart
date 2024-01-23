import 'package:clone_instagram/pages/profile/app_bar/profile_app_bar.dart';
import 'package:clone_instagram/pages/profile/profile_content.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget{
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: Scaffold(
          appBar: ProfileAppBar(),
          body: ProfileContent(),
        )
    );
  }

}