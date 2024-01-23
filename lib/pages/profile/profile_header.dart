import 'package:clone_instagram/pages/profile/highlight_stories.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget{
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child:  Padding(
        padding: const EdgeInsets.only(left: 18, right: 18, bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10,),
            const Row(
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
            const SizedBox(height: 10),
            const Text("Dũng Hoàng",
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700
              ),),
            const Text("2003",
              style: TextStyle(
                  fontSize: 15,
              ),),
            const SizedBox(height: 10,),
            actionButtonProfile(),
            const SizedBox(height: 10,),
            const HighlightStories()
          ],
        ),
      ),
    );
  }

  Row actionButtonProfile(){
    return  Row(
      children: [
        Expanded(
            child: TextButton(onPressed: () {  },
              style: TextButton.styleFrom(
                  backgroundColor: const Color(0x1F000000),
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)
                  )
              ),
              child: const Text("Chỉnh sửa"),
            )
        ),
        const SizedBox(width: 3,),
        Expanded(
            child: TextButton(onPressed: () {  },
              style: TextButton.styleFrom(
                  backgroundColor: const Color(0x1F000000),
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)
                  )

              ),
              child: const Text("Chia sẻ trang cá nhân"),
            )
        ),
        IconButton(
            onPressed: () {},
            icon: const FaIcon(FontAwesomeIcons.userPlus, size: 20,),
            style: IconButton.styleFrom(
              backgroundColor: const Color(0x1F000000),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12)
              )
            ),
        )
      ],
    );
  }
}