import 'package:clone_instagram/constants/app_text_style.dart';
import 'package:clone_instagram/widgets/custom_avatar_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomChatMessageItem extends StatelessWidget {
  final String message;
  final bool isSender;
  final DateTime time;
  final Duration timeFromLastMessage;
  const CustomChatMessageItem({
    super.key,
    required this.message,
    required this.isSender,
    required this.timeFromLastMessage,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        timeFromLastMessage.inMinutes > 5
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                DateFormat("HH:mm dd MMMM").format(time),
                  style: AppTextStyle.normalMediumTitle.copyWith(
                    color: Colors.grey,
                  ),
                )
              )
            : const SizedBox(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Flex(
            mainAxisAlignment:
                isSender ? MainAxisAlignment.start : MainAxisAlignment.end,
            direction: Axis.horizontal,
            children: <Widget>[
              Row(
                children: [
                  isSender ? const CustomAvatarWidget(
                    imageUrl: "https://static-00.iconduck.com/assets.00/flutter-icon-2048x2048-ufx4idi8.png",
                    radius: 16,
                  )
                  : const SizedBox(),
                  Container(
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * 0.6,
                    ),
                    decoration: isSender
                        ? BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(24),
                          )
                        : BoxDecoration(
                            gradient: const LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.purple,
                                Colors.blue,
                              ],
                            ),
                            borderRadius: BorderRadius.circular(24),
                          ),
                    padding: const EdgeInsets.only(
                      left: 16.0,
                      right: 16.0,
                      top: 8.0,
                      bottom: 8.0,
                    ),
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      message,
                      style: AppTextStyle.normalMediumTitle.copyWith(
                        color: isSender ? Colors.black : Colors.white,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
