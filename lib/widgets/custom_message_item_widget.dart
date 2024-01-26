import 'package:clone_instagram/constants/source_string.dart';
import 'package:flutter/material.dart';
import 'custom_active_account_widget.dart';
import 'custom_avatar_widget.dart';

class CustomMessageItemWidget extends StatelessWidget {
  final bool isRead;
  const CustomMessageItemWidget({Key? key, this.isRead = false})
      : super(key: key);

  TextStyle get _textStyle => isRead
      ? const TextStyle(
          fontSize: 14.0,
          fontWeight: FontWeight.normal,
        )
      : const TextStyle(
          fontSize: 14.0,
          fontWeight: FontWeight.bold,
        );

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Flexible(
          flex: 3,
          child: CustomActiveAccountWidget(
            avatarRadius: 28,
          ),
        ),
        Expanded(
          flex: 9,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                SourceString.username,
                style: _textStyle,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 9,
                    child: Text(SourceString.messageChat,
                        overflow: TextOverflow.ellipsis,
                        style: _textStyle,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      SourceString.messageTime,
                      style: _textStyle,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Expanded(
          child: isRead
              ? const SizedBox(
                  width: 0,
                  height: 0,
                )
              : Container(
                  width: 8.0,
                  height: 8.0,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blue,
                  ),
                  alignment: Alignment.centerRight,
                ),
        ),
        Expanded(
          child: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.camera_alt_outlined),
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.all(0.0),
          ),
        ),
      ],
    );
  }
}
