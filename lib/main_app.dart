import 'package:clone_instagram/constants/source_string.dart';
import 'package:clone_instagram/pages/call_page.dart';
import 'package:clone_instagram/pages/chat_detail_page.dart';
import 'package:clone_instagram/pages/chat_page.dart';
import 'package:clone_instagram/pages/dashboard_page.dart';
import 'package:clone_instagram/pages/demo_page.dart';
import 'package:flutter/material.dart';

import 'config/app_route.dart';

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
      home: const ChatDetailPage(),
      initialRoute: AppRoute.chatDetail,
      onGenerateRoute: AppRoute.getAppPage,
    );
  }
}