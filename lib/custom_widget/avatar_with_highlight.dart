import 'package:flutter/material.dart';

class AvatarWithHighlight extends StatelessWidget {
  final String imageUrl;
  final bool isNetworkImage;
  final int sizeContainer;
  final int radius;
  final bool isShowHighlight;
  final bool haveAddIcon;

  const AvatarWithHighlight(
      {super.key,
      required this.imageUrl,
      required this.isNetworkImage,
      required this.sizeContainer,
      required this.radius,
      required this.isShowHighlight,
      required this.haveAddIcon});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: sizeContainer.toDouble(),
        width: sizeContainer.toDouble(),
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: isShowHighlight
                ? const LinearGradient(colors: [
                    Color(0xFFC913B9),
                    Color(0xFFF9373F),
                    Color(0xFFFECD00),
                  ])
                : null),
        child: Stack(
          alignment: Alignment.center,
          children: [
            CircleAvatar(
              radius: radius.toDouble(),
              backgroundColor: Colors.white,
            ),
            CircleAvatar(
              radius: radius.toDouble() - 2,
              backgroundImage: isNetworkImage
                  ? NetworkImage(imageUrl)
                  : AssetImage(imageUrl) as ImageProvider,
            ),
            haveAddIcon
                ? Container(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blue,
                        ),
                        child: const Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                  )
                : const SizedBox()
          ],
        ));
  }
}
