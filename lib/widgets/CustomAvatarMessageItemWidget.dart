import 'package:cached_network_image/cached_network_image.dart';
import 'package:clone_instagram/constants/SourceString.dart';
import 'package:flutter/material.dart';

class CustomAvatarMessageItemWidget extends StatelessWidget {
  final double radius;
  const CustomAvatarMessageItemWidget({Key? key, this.radius = 28}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      margin: const EdgeInsets.only(top: 8.0, bottom: 8.0, right: 16.0),
      child: CircleAvatar(
        radius: radius,
        child: ClipOval(
          child: CachedNetworkImage(
            imageUrl: "https://static-00.iconduck.com/assets.00/flutter-icon-2048x2048-ufx4idi8.png",
            fit: BoxFit.cover,
            placeholder: (context, url) => const CircularProgressIndicator(),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),
      ),
    );
  }
}