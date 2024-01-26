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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SafeArea(
            child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: IconButton(
                      onPressed: () {
                        if (NavigatorState().canPop()) {
                          Navigator.pop(context);
                        }
                      },
                      icon: const Icon(Icons.arrow_back),
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.all(0.0),
                      iconSize: 30,
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        alignment: Alignment.center,
                      ),
                      child: Row(children: [
                        Text(
                          SourceString.username,
                          style: AppTextStyle.boldLargeTitle,
                        ),
                        const Icon(Icons.keyboard_arrow_down_outlined),
                      ]),
                    ),
                  ),
                  Expanded(
                    child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(AppRoute.call);
                      },
                      icon: const Icon(Icons.video_camera_front_outlined),
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.all(0.0),
                      iconSize: 30,
                    ),
                  ),
                  Expanded(
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.note_alt_outlined),
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.all(0.0),
                      iconSize: 30,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 8.0,
              ),
              const CustomChatSearchWidget(),
              Flexible(
                flex: 2,
                child: Container(
                  margin: const EdgeInsets.only(top: 16),
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: Test.storyTest,
                  ),
                ),
              ),
              const Row(children: [
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
              Flexible(
                  flex: 7,
                  child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (BuildContext context, int index) {
                      return CustomMessageItemWidget(
                          isRead: index >= 5 ? true : false, username: SourceString.username, messageChat: SourceString.messageChat, messageTime: SourceString.messageTime,);
                    },
                  )),
            ],
          ),
        )),
      ),
    );
  }
}
