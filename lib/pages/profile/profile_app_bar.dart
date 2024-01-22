import 'package:clone_instagram/constants/SourceString.dart';
import 'package:clone_instagram/pages/profile/bottom_sheet/account_change_bts.dart';
import 'package:clone_instagram/pages/profile/bottom_sheet/hamburger_bts.dart';
import 'package:clone_instagram/pages/profile/bottom_sheet/post_create_bts.dart';
import 'package:flutter/material.dart';
class ProfileAppBar extends StatelessWidget{
  const ProfileAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
      return Row(
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
            Image.asset("assets/images/expand_account.png",
              color: Colors.black,
            ),
            const Spacer(),
            InkWell(
                child: Image.asset("assets/images/add_new_post.png"),
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
                child: Image.asset("assets/images/hamburger.png"),
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
      );
  }

}