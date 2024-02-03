import 'package:clone_instagram/constants/SourceString.dart';
import 'package:clone_instagram/post/add_new_post_page.dart';
import 'package:flutter/material.dart';

class CloneInstagramApp extends StatelessWidget {
  const CloneInstagramApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
   return MaterialApp(
      title: SourceString.appName,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const AddNewPostPage(),
    );
  }
}