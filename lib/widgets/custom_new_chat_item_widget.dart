import 'package:clone_instagram/widgets/custom_avatar_fullname_username_item_widget.dart';
import 'package:flutter/material.dart';

class CustomNewChatItemWidget extends StatelessWidget {
  final String username;
  final String fullName;
  final String imageUrl;
  final double avatarRadius;
  const CustomNewChatItemWidget(
      {super.key,
        required this.username,
        required this.fullName,
        this.imageUrl = "https://static-00.iconduck.com/assets.00/flutter-icon-2048x2048-ufx4idi8.png",
        this.avatarRadius = 28.0,
      }
      );

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          flex: 4,
          child: CustomAvatarFullNameUsernameItemWidget(
            fullName: fullName,
            username: username,
            avatarRadius: avatarRadius,
          ),
        ),
        const Expanded(
          child: SizedBox(
            width: 0,
            height: 0,
          )
        ),
      ],
    );
  }
}
