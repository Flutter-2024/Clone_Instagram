import 'package:clone_instagram/constants/source_string.dart';
import 'package:clone_instagram/custom_widget/avatar_with_highlight.dart';
import 'package:clone_instagram/custom_widget/text_style_custom.dart';
import 'package:clone_instagram/pages/profile/bloc/friend_bloc.dart';
import 'package:clone_instagram/pages/profile/friend_list.dart';
import 'package:clone_instagram/pages/profile/highlight_stories.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/list_post.dart';

class ProfileHeader extends StatefulWidget {
  ProfileHeader({super.key});

  bool isShowSharedFriend = false;

  @override
  State<StatefulWidget> createState() {
    return ProfileHeaderState();
  }
}
class ProfileHeaderState extends State<ProfileHeader> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final TextStyleCustom textStyleCustom = TextStyleCustom.instance;
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 18, right: 18, bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                   Expanded(
                    child: AvatarWithHighlight(
                        sizeContainer: 90,
                        isNetworkImage: true,
                        imageUrl: Post.imageUrls[0],
                        radius: 42,
                        isShowHighlight: true,
                        haveAddIcon: true),
                  ),
                  Expanded(
                    child: _getInformation(
                        title: SourceString.numPost,
                        detail: SourceString.post,
                    )
                  ),
                  Expanded(
                    child: _getInformation(
                      title: SourceString.numFollowers,
                      detail: SourceString.followers,
                    )
                  ),
                  Expanded(
                    child: _getInformation(
                      title: SourceString.numFollowing,
                      detail: SourceString.following,
                    )

                  ),
                ]),
            const SizedBox(height: 10),
            Text(
              SourceString.userName,
              style: textStyleCustom.textStyleBold(),
            ),
            const Text(
              SourceString.yearOfBirth,
              style: TextStyle(
                fontSize: 15,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            _actionButtonProfile(),
            const SizedBox(
              height: 10,
            ),
            const FriendList(),
            const HighlightStories()
          ],
        ),
      ),
    );
  }

  Row _actionButtonProfile() {
    return Row(
      children: [
        Expanded(
          child: _getButton(title: SourceString.editProfile),
        ),
        const SizedBox(
          width: 3,
        ),
        Expanded( 
          child: _getButton(title: SourceString.shareProfile),
        ),
        IconButton(
          onPressed: (){
            if(context.read<FriendBloc>().state is FriendDisplay
              ||context.read<FriendBloc>().state is FriendLoading
            ){
              context.read<FriendBloc>().add(FriendEventHide());
            }
            else{
              context.read<FriendBloc>().add(FriendEventDisplay());
            }

          },
          icon: const FaIcon(
            FontAwesomeIcons.userPlus,
            size: 20,
          ),
          style: IconButton.styleFrom(
              backgroundColor: const Color(0x1F000000),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12))),
        )
      ],
    );
  }
  Widget _getButton({required String title}){
    return TextButton(
      onPressed: () {},
      style: TextButton.styleFrom(
          backgroundColor: const Color(0x1F000000),
          foregroundColor: Colors.black,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12)
          )
      ),
      child: Text(
        title,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
  Widget _getInformation({required String title, required String detail}){
    return Column(
      children: [
        Text(
          title,
          style: TextStyleCustom.instance.textStyleBold(),
        ),
        Text(
          detail,
          style: TextStyleCustom.instance.textStyleNormal(),
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
      ],
    );
  }
}