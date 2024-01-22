import 'package:clone_instagram/constants/SourceString.dart';
import 'package:clone_instagram/widgets/CustomAvatarMessageItemWidget.dart';
import 'package:flutter/material.dart';

class CustomReadMessageItemWidget extends StatelessWidget {
  const CustomReadMessageItemWidget({Key? key}) : super(key: key);

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
                          color: Colors.grey,
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