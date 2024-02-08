import 'package:clone_instagram/constants/app_text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomChatMessageItem extends StatelessWidget {
  final String message;
  final bool isSender;
  const CustomChatMessageItem({
    super.key,
    required this.message,
    required this.isSender,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Flex(
        mainAxisAlignment:
            isSender ? MainAxisAlignment.start : MainAxisAlignment.end,
        direction: Axis.horizontal,
        children: <Widget>[
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
    );
  }
}
