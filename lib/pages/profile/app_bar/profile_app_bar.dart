import 'package:clone_instagram/constants/source_image.dart';
import 'package:clone_instagram/constants/source_string.dart';
import 'package:clone_instagram/pages/profile/bottom_sheet/account_change_bts.dart';
import 'package:clone_instagram/pages/profile/bottom_sheet/hamburger_bts.dart';
import 'package:clone_instagram/pages/profile/bottom_sheet/post_create_bts.dart';
import 'package:flutter/material.dart';
class ProfileAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ProfileAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
              const SizedBox(width: 20,),
              GestureDetector(
                  child: const Text(SourceString.userName,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                  onTap: (){
                    showModalBottomSheet(context: context,
                        clipBehavior: Clip.antiAlias,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
                        ),
                        builder: (BuildContext context){
                          return  const AccountChangeBts();
                        }
                    );
                  },
              ),
              Image.asset(SourceImage.expandAccount,
                color: Colors.black,
              ),
              const Spacer(),
              InkWell(
                  child: Image.asset(SourceImage.addNewPost),
                  onTap: (){
                    showModalBottomSheet(
                      context: context,
                      clipBehavior: Clip.antiAlias,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
                      ),
                      builder: (BuildContext context) {
                        return const PostCreateBts();
                     },
                    );
                  },
              ),
              const SizedBox(width: 20,),
              InkWell(
                  child: Image.asset(SourceImage.hamburger),
                  onTap: (){
                    showModalBottomSheet(
                      context: context,
                      clipBehavior: Clip.antiAlias,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
                      ),
                      builder: (BuildContext context) {
                        return const HamburgerBts();
                      },
                    );
                  },
              ),
              const SizedBox(width: 10,)
          ],
        ),
      );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(60);

}