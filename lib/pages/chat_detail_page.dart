import 'package:clone_instagram/tests/test.dart';
import 'package:clone_instagram/viewmodel/chat_detail_viewmodel.dart';
import 'package:clone_instagram/widgets/custom_chat_message_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/app_text_style.dart';
import '../constants/source_string.dart';
import '../data/chat_message.dart';
import '../widgets/custom_call_item_widget.dart';

class ChatDetailPage extends StatefulWidget {
  const ChatDetailPage({super.key});

  @override
  State<ChatDetailPage> createState() => _ChatDetailPageState();
}

class _ChatDetailPageState extends State<ChatDetailPage> {
  late ChatDetailViewModel viewModel;
  late TextEditingController textEditingController;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    textEditingController = TextEditingController();
    viewModel = Provider.of<ChatDetailViewModel>(context);
    viewModel.setTypingMessage(textEditingController.text);
    viewModel.setContactorId(ModalRoute.of(context)!.settings.arguments as String);
    viewModel.setMessageListByContactorId(Test.chatMessageList.reversed.toList(), viewModel.contactorId);
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    viewModel.setTypingMessage(textEditingController.text);
    viewModel.setMessageListByContactorId(Test.chatMessageList.reversed.toList(), viewModel.contactorId);

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: _appBar(),
        body: SafeArea(
          child: Column(
            children: [
              _body(),
              _inputMessage(),
            ],
          ),
        ),
      ),
    );
  }
  AppBar _appBar() {
    return AppBar(
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
    );
  }

  Flexible _body() {
    return Flexible(
      child: ListView.builder(
        reverse: true,
        itemBuilder: (BuildContext context, int index) {
          Duration timeFromLastMessage =
          index == Test.chatMessageList.length - 1
              ? const Duration()
              : viewModel.messageList.toList()[index].time.difference(Test
              .chatMessageList.reversed
              .toList()[index + 1]
              .time);
          return CustomChatMessageItem(
            message: viewModel.messageList.toList()[index].message,
            isContactor:
            viewModel.messageList.toList()[index].senderId == viewModel.contactorId,
            timeFromLastMessage: timeFromLastMessage,
            time: viewModel.messageList.toList()[index].time,
          );
        },
        itemCount: viewModel.messageList.length,
      ),
    );
  }

  Card _inputMessage() {
    return Card(
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
            viewModel.typingMessage == ""
                ? const Padding(
                    padding: EdgeInsets.only(left: 8.0, right: 16.0),
                    child: Icon(Icons.camera_alt_rounded),
                  )
                : const Padding(
                    padding: EdgeInsets.only(left: 8.0, right: 16.0),
                    child: Icon(Icons.search_rounded),
                  ),
            Expanded(
              child: GestureDetector(
                onTap: () {},
                child: TextFormField(
                  autofocus: true,
                  showCursor: true,
                  readOnly: !viewModel.isTyping,
                  decoration: InputDecoration(
                      hintText: SourceString.typeMessage,
                      border: InputBorder.none,
                      hintStyle: AppTextStyle.normalMediumTitle.copyWith(
                        color: Colors.grey,
                      )),
                  controller: textEditingController,
                  onTap: () {
                    setState(() {
                      viewModel.setIsTyping(true);
                    });
                  },
                  onChanged: (value) {
                    setState(() {
                      textEditingController.text = value;
                    });
                  },
                ),
              ),
            ),
            viewModel.typingMessage == ""
                ? const Padding(
                    padding: EdgeInsets.only(right: 16.0),
                    child: Icon(Icons.mic_none_outlined),
                  )
                : const SizedBox(),
            viewModel.typingMessage == ""
                ? const Padding(
                    padding: EdgeInsets.only(right: 16.0),
                    child: Icon(Icons.image_outlined),
                  )
                : const SizedBox(),
            viewModel.typingMessage == ""
                ? const Padding(
                    padding: EdgeInsets.only(right: 0),
                    child: Icon(Icons.sticky_note_2_outlined),
                  )
                : Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          Test.chatMessageList.add(
                            ChatMessage(
                              message: viewModel.typingMessage,
                              senderId: "U000",
                              receiverId: viewModel.contactorId,
                              time: DateTime.now(),
                            ),
                          );
                          textEditingController.clear();
                        });
                      },
                      child: Text(
                        SourceString.send,
                        style: AppTextStyle.boldMediumTitle.copyWith(
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
