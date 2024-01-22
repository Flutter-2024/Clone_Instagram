import 'package:clone_instagram/constants/SourceString.dart';
import 'package:flutter/material.dart';
import 'CustomAvatarMessageItemWidget.dart';

class CustomUnReadMessageItemWidget extends StatelessWidget {
  const CustomUnReadMessageItemWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Flexible(
          flex: 3,
          child: CustomAvatarMessageItemWidget(),
        ),
        const Expanded(
          flex: 9,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                SourceString.username,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  Expanded(
                    flex: 9,
                    child: Text(
                        SourceString.messageChat,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                        )
                    ),
                  ),
                  Expanded(
                    child: Text(
                      SourceString.messageTime,
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Expanded(
          child: Container(
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