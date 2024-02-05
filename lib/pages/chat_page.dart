import 'package:clone_instagram/config/app_route.dart';
import 'package:clone_instagram/constants/app_text_style.dart';
import 'package:clone_instagram/constants/source_string.dart';
import 'package:clone_instagram/tests/test.dart';
import 'package:clone_instagram/widgets/custom_chat_search_widget.dart';
import 'package:flutter/material.dart';

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

  @override
  void initState() {
    super.initState();
    scrollController.addListener(_scrollListener);
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
      body: RefreshIndicator(
        onRefresh: () {
          return Future.delayed(const Duration(seconds: 1));
        },
        child: Center(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 16.0),
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                const Expanded(
                  child: CustomChatSearchWidget(),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    margin: const EdgeInsets.only(top: 16),
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: Test.storyTest,
                    ),
                  ),
                ),
                const Expanded(
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
                Expanded(
                  flex: 8,
                  child: ListView.builder(
                    itemCount: isLoadingMore ? 12 : 11,
                    itemBuilder: (BuildContext context, int index) {
                      if(index < 10) {
                        return CustomMessageItemWidget(
                          isRead: index >= 5 ? true : false,
                          username: SourceString.username,
                          messageChat: SourceString.messageChat,
                          messageTime: SourceString.messageTime,
                        );
                      }
                      else {
                        return Container(
                          margin: const EdgeInsets.only(top: 16),
                          child: const Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      }
                    },
                    // physics: const NeverScrollableScrollPhysics(),
                    // shrinkWrap: true,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _scrollListener() {
    if(isLoadingMore) {
      return;
    }
    if (scrollController.offset >= scrollController.position.maxScrollExtent &&
        !scrollController.position.outOfRange) {
      setState(() {
        isLoadingMore = true;
      });
      page++;
      setState(() {
        isLoadingMore = false;
      });
    }
    if (scrollController.offset <= scrollController.position.minScrollExtent &&
        !scrollController.position.outOfRange) {
      setState(() {});
    }
  }
}
