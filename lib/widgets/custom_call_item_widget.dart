import 'package:clone_instagram/constants/app_text_style.dart';
import 'package:clone_instagram/constants/source_string.dart';
import 'package:flutter/material.dart';
import 'custom_active_account_widget.dart';
import 'custom_avatar_widget.dart';

class CustomCallItemWidget extends StatelessWidget {
  final String username;
  final String fullName;
  const CustomCallItemWidget(
      {Key? key, required this.username, required this.fullName})
      : super(key: key);

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
          flex: 7,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                fullName,
                style: AppTextStyle.boldSmallTitle,
              ),
              Text(
                username,
                style: AppTextStyle.normalSmallTitle,
              ),
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: InkWell(
            onTap: () {},
            child: const Icon(Icons.call_outlined),
          ),
        ),
        Expanded(
            child: InkWell(
          onTap: () {},
          child: const Icon(Icons.video_camera_back_outlined),
        ))
      ],
    );
  }
}
