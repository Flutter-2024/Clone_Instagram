import 'package:clone_instagram/pages/profile/profile_app_bar.dart';
import 'package:clone_instagram/pages/profile/profile_content.dart';
import 'package:clone_instagram/pages/profile/profile_header.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget{
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: ListView(
            children:  const [
              SizedBox(height: 20),
              ProfileAppBar(),
              ProfileHeader(),
              ProfileContent()
            ],
          )
        )
    );
  }

}