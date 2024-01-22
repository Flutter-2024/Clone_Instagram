

import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget{
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: const Padding(
        padding: EdgeInsets.only(left: 18, right: 18, bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children :[
                CircleAvatar(
                  backgroundImage: NetworkImage("https://cdn-icons-png.flaticon.com/512/6386/6386976.png"),
                  radius: 36,
                ),
                Column(children: [
                  Text("0",
                    style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700
                    ),),
                  Text("Bài viết",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500
                    ),),
                ],
                ),

                Column(children: [
                  Text("123",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700
                    ),),
                  Text("Người theo dõi",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500
                    ),),
                ],
                ),

                Column(children: [
                  Text("2344",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700
                    ),),
                  Text("Đang theo dõi",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500
                    ),),
                ],
                ),
              ]
            ), 
            SizedBox(height: 10),
            Text("Dũng Hoàng",
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700
              ),),
          ],
        ),
      ),
    );
  }

}