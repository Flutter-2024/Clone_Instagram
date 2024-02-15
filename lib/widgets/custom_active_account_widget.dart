import 'package:clone_instagram/widgets/custom_active_account_point_widget.dart';
import 'package:clone_instagram/widgets/custom_note_of_account_widget.dart';
import 'package:flutter/material.dart';

import 'custom_avatar_widget.dart';

class CustomActiveAccountWidget extends StatelessWidget {
  final bool isActive;
  final String noteContent;
  final String username;
  final String imageUrl;
  final double avatarRadius;

  const CustomActiveAccountWidget({
    super.key,
    this.isActive = false,
    this.noteContent = "",
    this.username = "",
    this.imageUrl = "https://static-00.iconduck.com/assets.00/flutter-icon-2048x2048-ufx4idi8.png",
    this.avatarRadius = 45,
  });

  bool get _hasNote => noteContent.isNotEmpty;
  bool get _hasUsername => username.isNotEmpty;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            CustomAvatarWidget(
              radius: avatarRadius,
              imageUrl: imageUrl,
            ),
            _hasUsername
                ? Text(
                    username,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                    ),
                    textAlign: TextAlign.center,
                  )
                : const SizedBox(
                    width: 0,
                    height: 0,
                  ),
          ],
        ),
        isActive
            ? const Positioned(
                bottom: 40,
                left: 68,
                child: CustomActivePointWidget(),
              )
            : const SizedBox(
                width: 0,
                height: 0,
              ),
        _hasNote
            ? Positioned(
                top: 0,
                left: 0,
                child: CustomNoteOfAccountWidget(
                  noteContent: noteContent,
                ),
              )
            : const SizedBox(
                width: 0,
                height: 0,
              ),
      ],
    );
  }
}
