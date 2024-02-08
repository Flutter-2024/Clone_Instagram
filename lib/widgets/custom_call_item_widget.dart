import 'package:clone_instagram/constants/app_text_style.dart';
import 'package:clone_instagram/constants/source_string.dart';
import 'package:clone_instagram/widgets/custom_avatar_fullname_username_item_widget.dart';
import 'package:flutter/material.dart';
import 'custom_active_account_widget.dart';
import 'custom_avatar_widget.dart';

class CustomCallItemWidget extends StatelessWidget {
  final String username;
  final String fullName;
  final String imageUrl;
  final double avatarRadius;
  const CustomCallItemWidget({
    super.key,
    required this.username,
    required this.fullName,
    this.imageUrl =
        "https://static-00.iconduck.com/assets.00/flutter-icon-2048x2048-ufx4idi8.png",
    this.avatarRadius = 28,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          flex: 10,
          child: CustomAvatarFullNameUsernameItemWidget(
            fullName: fullName,
            username: username,
            avatarRadius: avatarRadius,
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
          ),
        )
      ],
    );
  }
}
