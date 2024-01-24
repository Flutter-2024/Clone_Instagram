import 'package:clone_instagram/constants/source_string.dart';
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
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children :[
                const CircleAvatar(
                  backgroundImage: NetworkImage("https://cdn-icons-png.flaticon.com/512/6386/6386976.png"),
                  radius: 36,
                ),
                 Column(children: [
                  Text(SourceString.numPost,
                    style: _textStyleBold(),),
                  Text(SourceString.post,
                    style: _textStyleNormal(),),
                ],
                ),

                 Column(children: [
                  Text(SourceString.numFollowers,
                    style: _textStyleBold(),),
                  Text(SourceString.followers,
                    style: _textStyleNormal(),),
                ],
                ),

                Column(children: [
                  Text(SourceString.numFollowing,
                    style: _textStyleBold(),),
                  Text(SourceString.following,
                    style: _textStyleNormal(),),
                ],
                ),
              ]
            ),
            const SizedBox(height: 10),
            Text(SourceString.userName,
              style: _textStyleBold(),),
            const Text(SourceString.yearOfBirth,
              style: TextStyle(
                  fontSize: 15,
              ),),
            const SizedBox(height: 10,),
            _actionButtonProfile(),
            const SizedBox(height: 10,),
            const HighlightStories()
          ],
        ),
      ),
    );
  }

  Row _actionButtonProfile(){
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
              child: const Text(SourceString.editProfile),
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
              child: const Text(
                SourceString.shareProfile,
                overflow: TextOverflow.ellipsis,
              ),
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
  TextStyle _textStyleBold(){
    return const TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w700
    );
  }
  TextStyle _textStyleNormal(){
    return const TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w500
    );
  }
}