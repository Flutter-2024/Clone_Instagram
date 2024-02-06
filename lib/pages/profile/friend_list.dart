import 'package:clone_instagram/constants/source_string.dart';
import 'package:flutter/material.dart';

import '../../data/list_friend.dart';

class FriendList extends StatelessWidget {
  const FriendList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        const Row(
          children: [
            Text(
              SourceString.exploreEverybody,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Spacer(),
            Text(
              SourceString.seeAll,
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
            )
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 200,
          width: 140,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: Friend.listFriend.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                width: 140,
                padding: const EdgeInsets.only(right: 10, left: 10, top: 10),
                margin: const EdgeInsets.only(bottom: 10, right: 10),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 0.5),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Stack(children: [
                  Column(
                    children: [
                      CircleAvatar(
                        radius: 32,
                        backgroundImage:
                            AssetImage(Friend.listFriend[index].image),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(Friend.listFriend[index].name),
                      Expanded(
                        child: Text(
                          Friend.listFriend[index].numberOfFollowers,
                          style: const TextStyle(
                              fontSize: 10, fontWeight: FontWeight.w300),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                              backgroundColor: Colors.blue,
                              minimumSize: const Size(125, 30),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5))),
                          child: const Text(
                            SourceString.follow,
                            style: TextStyle(color: Colors.white),
                          ))
                    ],
                  ),
                  const Positioned(
                    right: 0,
                    top: 0,
                    child: Icon(
                      Icons.close,
                      size: 15,
                      color: Colors.grey,
                    ),
                  )
                ]),
              );
            },
          ),
        )
      ],
    );
  }
}
