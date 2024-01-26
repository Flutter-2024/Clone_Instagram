import 'package:clone_instagram/constants/app_text_style.dart';
import 'package:clone_instagram/constants/source_string.dart';
import 'package:clone_instagram/widgets/custom_avatar_fullname_username_item_widget.dart';
import 'package:clone_instagram/widgets/custom_new_chat_item_widget.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_message_item_widget.dart';

class NewChatPage extends StatefulWidget {
  const NewChatPage({super.key});

  @override
  State<NewChatPage> createState() => _NewChatPageState();
}

class _NewChatPageState extends State<NewChatPage> {
  bool _isAbleEndToEnd = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SafeArea(
            child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back),
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.all(0.0),
                      iconSize: 30,
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          SourceString.newChat,
                          style: AppTextStyle.boldMediumTitle,
                        ),
                        Row(
                          children: [
                            Text(
                              SourceString.endToEnd,
                              style: AppTextStyle.normalSmallTitle,
                            ),
                            Text(
                              _isAbleEndToEnd
                                  ? SourceString.enable
                                  : SourceString.disable,
                              style: AppTextStyle.normalSmallTitle,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          _isAbleEndToEnd = !_isAbleEndToEnd;
                        });
                      },
                      child: _isAbleEndToEnd
                          ? const Icon(
                              Icons.lock_open_outlined,
                              color: Colors.black,
                              size: 30,
                            )
                          : const Icon(
                              Icons.lock,
                              color: Colors.black,
                              size: 30,
                            ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 16.0,
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      SourceString.to,
                      style: AppTextStyle.boldMediumTitle.copyWith(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 6,
                    child: Text(
                      SourceString.search,
                      style: AppTextStyle.normalMediumTitle.copyWith(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 16.0,
              ),
              const CustomNewChatItemWidget(
                fullName: SourceString.createGroupChat,
                username: '',
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        SourceString.suggestion,
                        style: AppTextStyle.boldMediumTitle,
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          if (index < 5) {
                            return const CustomNewChatItemWidget(
                              fullName: SourceString.fullName,
                              username: "",
                            );
                          }
                          return const CustomNewChatItemWidget(
                            fullName: SourceString.fullName,
                            username: SourceString.username,
                          );
                        },
                        itemCount: 10,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
