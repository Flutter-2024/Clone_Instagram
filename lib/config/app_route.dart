import 'package:clone_instagram/pages/dashboard_page.dart';
import 'package:flutter/material.dart';
import '../pages/call_page.dart';
import '../pages/chat_page.dart';

class AppRoute {
  static const String home = "/";
  static const String newsFeed = "/newsFeed";
  static const String search = "/search";
  static const String addNewPost = "/addNewPost";
  static const String reels = "/reels";
  static const String profileDetail = "/profileDetail";
  static const String chat = "/chat";
  static const String call = "/call";

  static Route<dynamic> getAppPage(RouteSettings settings) {
    switch (settings.name) {
      case chat:
        return MaterialPageRoute(
            builder: (BuildContext context) => const ChatPage(),
        );
      case call:
        return MaterialPageRoute(
            builder: (BuildContext context) => const CallPage(),
        );
      default:
        return MaterialPageRoute(
            builder: (BuildContext context) => const DashboardPage(),
        );
    }
  }
}
