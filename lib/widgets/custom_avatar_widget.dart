import 'package:cached_network_image/cached_network_image.dart';
import 'package:clone_instagram/constants/source_string.dart';
import 'package:flutter/material.dart';

class CustomAvatarWidget extends StatelessWidget {
  final double radius;
  final String imageUrl;
  const CustomAvatarWidget({
    Key? key,
    this.radius = 28,
    this.imageUrl = "https://static-00.iconduck.com/assets.00/flutter-icon-2048x2048-ufx4idi8.png",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      margin:
          const EdgeInsets.only(top: 8.0, bottom: 8.0, right: 16.0, left: 8),
      child: CircleAvatar(
        radius: radius,
        child: ClipOval(
          child: CachedNetworkImage(
            imageUrl:
                "https://static-00.iconduck.com/assets.00/flutter-icon-2048x2048-ufx4idi8.png",
            fit: BoxFit.cover,
            placeholder: (context, url) => const CircularProgressIndicator(),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),
      ),
    );
  }
}
