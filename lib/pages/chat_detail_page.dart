import 'package:clone_instagram/tests/test.dart';
import 'package:clone_instagram/widgets/custom_chat_message_item.dart';
import 'package:flutter/material.dart';

import '../config/app_route.dart';
import '../constants/app_text_style.dart';
import '../constants/source_string.dart';
import '../widgets/custom_call_item_widget.dart';

class ChatDetailPage extends StatefulWidget {
  const ChatDetailPage({super.key});

  @override
  State<ChatDetailPage> createState() => _ChatDetailPageState();
}

class _ChatDetailPageState extends State<ChatDetailPage> {
  bool isTyping = false;
  @override
  Widget build(BuildContext context) {
    TextEditingController textEditingController = TextEditingController();
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          leading: InkWell(
            onTap: () {
              if (NavigatorState().canPop()) {
                Navigator.pop(context);
              }
              Navigator.pop(context);
            },
            child: const Padding(
              padding: EdgeInsets.only(left: 16.0, right: 16.0),
              child: Icon(
                Icons.arrow_back,
                size: 30,
              ),
            ),
          ),
          title: const CustomCallItemWidget(
            username: SourceString.username,
            fullName: SourceString.fullName,
            avatarRadius: 20,
          ),
        ),
        body: SafeArea(
          child: Column(
            children: [
             Flexible(
                  child: ListView.builder(
                    itemBuilder: (BuildContext context, int index) {
                      return CustomChatMessageItem(
                        message: Test.chatMessageList[index].message,
                        isSender: Test.chatMessageList[index].senderId == "U001",
                      );
                    },
                    itemCount: Test.chatMessageList.length,
                  ),
                ),
              Card(
                elevation: 0.0,
                color: Colors.grey[200],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(60.0),
                ),
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 8.0, right: 16.0),
                        child: Icon(Icons.camera_alt_rounded),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {},
                          child: TextFormField(
                            autofocus: true,
                            showCursor: true,
                            readOnly: !isTyping,
                            decoration: InputDecoration(
                                hintText: SourceString.typeMessage,
                                border: InputBorder.none,
                                hintStyle:
                                    AppTextStyle.normalMediumTitle.copyWith(
                                  color: Colors.grey,
                                )),
                            controller: textEditingController,
                            onTap: () {
                              setState(() {
                                isTyping = true;
                              });
                            },
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(right: 16.0),
                        child: Icon(Icons.mic_none_outlined),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(right: 16.0),
                        child: Icon(Icons.image_outlined),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(right: 0),
                        child: Icon(Icons.sticky_note_2_outlined),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
