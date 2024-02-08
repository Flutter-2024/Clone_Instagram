import 'package:clone_instagram/constants/app_text_style.dart';
import 'package:clone_instagram/constants/source_string.dart';
import 'package:flutter/material.dart';
import 'custom_active_account_widget.dart';
import 'custom_avatar_widget.dart';

class CustomAvatarFullNameUsernameItemWidget extends StatelessWidget {
  final String username;
  final String fullName;
  final String imageUrl;
  final double avatarRadius;
  const CustomAvatarFullNameUsernameItemWidget({
    super.key,
    this.username = '',
    required this.fullName,
    this.imageUrl =
        "https://static-00.iconduck.com/assets.00/flutter-icon-2048x2048-ufx4idi8.png",
    required this.avatarRadius,
  });

  bool get _hasUsername => username.isNotEmpty;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          flex: 3,
          child: CustomActiveAccountWidget(
            avatarRadius: avatarRadius,
            imageUrl: imageUrl,
          ),
        ),
        Expanded(
          flex: 8,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                fullName,
                style: AppTextStyle.boldSmallTitle,
              ),
              _hasUsername
                  ? Text(
                      username,
                      style: AppTextStyle.normalSmallTitle,
                    )
                  : const SizedBox(
                      width: 0,
                      height: 0,
                    ),
            ],
          ),
        ),
      ],
    );
  }
}
