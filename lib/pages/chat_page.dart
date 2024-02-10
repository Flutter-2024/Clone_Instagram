import 'package:clone_instagram/config/app_route.dart';
import 'package:clone_instagram/constants/app_text_style.dart';
import 'package:clone_instagram/constants/source_string.dart';
import 'package:clone_instagram/service/service.dart';
import 'package:clone_instagram/tests/test.dart';
import 'package:clone_instagram/widgets/custom_chat_search_widget.dart';
import 'package:flutter/material.dart';

import '../data/user.dart';
import '../widgets/custom_message_item_widget.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final scrollController = ScrollController();
  int page = 1;
  bool isLoadingMore = false;
  List<User> _userList = [];
  int userListItemCount = 7;

  bool isRefeshing = false;

  @override
  void initState() {
    super.initState();
    scrollController.addListener(_scrollListener);
    isLoadingMore = true;
    Service.getUserList().then((userListFromServer) {
      setState(() {
        _userList = userListFromServer;
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: InkWell(
          onTap: () {},
          child: const Padding(
            padding: EdgeInsets.only(left: 16.0, right: 16.0),
            child: Icon(
              Icons.arrow_back,
              size: 30,
            ),
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Text(
              SourceString.username,
              style: AppTextStyle.boldLargeTitle,
            ),
            const Icon(
              Icons.keyboard_arrow_down_outlined,
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(AppRoute.call);
            },
            icon: const Icon(Icons.video_camera_front_outlined),
            iconSize: 30,
          ),
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(AppRoute.newChat);
            },
            icon: const Icon(Icons.note_alt_outlined),
            iconSize: 30,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: CustomScrollView(
          controller: scrollController,
          scrollDirection: Axis.vertical,
          slivers: [
            isRefeshing == true
                ? SliverToBoxAdapter(
                    child: Container(
                    margin: const EdgeInsets.only(bottom: 8, top: 8),
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  ))
                : const SliverToBoxAdapter(child: SizedBox()),
            const CustomChatSearchWidget(),
            SliverToBoxAdapter(
              child: Container(
                constraints: const BoxConstraints(
                  minHeight: 100,
                ),
                margin: const EdgeInsets.only(top: 16),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: Test.storyTest,
                  ),
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: Row(children: [
                Text(
                  SourceString.messages,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
                Spacer(),
                Text(
                  SourceString.messageRequests,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                    color: Colors.blue,
                  ),
                ),
              ]),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  if (index < userListItemCount) {
                    return CustomMessageItemWidget(
                      isRead: index >= 5 ? true : false,
                      username: _userList[index].username,
                      messageChat: SourceString.messageChat,
                      messageTime: SourceString.messageTime,
                    );
                  } else {
                    return Container(
                      margin: const EdgeInsets.only(top: 16),
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }
                },
                childCount: isLoadingMore == true
                    ? userListItemCount + 1
                    : userListItemCount,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _scrollListener() {
    if (scrollController.offset >= scrollController.position.maxScrollExtent &&
        !scrollController.position.outOfRange) {
      setState(() {
        isLoadingMore = true;
      });
      if (userListItemCount + 7 < _userList.length) {
        userListItemCount += 7;
      } else {
        userListItemCount = _userList.length;
      }
      Future.delayed(const Duration(seconds: 2), () {
        setState(() {
          isLoadingMore = false;
        });
      });
      print("reach the bottom");
    } else if (scrollController.offset <=
            scrollController.position.minScrollExtent) {
      setState(() {
        isRefeshing = true;
      });
      Future.delayed(const Duration(seconds: 2), () {
        setState(() {
          isRefeshing = false;
        });
      });
      print("reach the top");
    }
  }
}
