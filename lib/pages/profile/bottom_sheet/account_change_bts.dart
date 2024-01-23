import 'package:clone_instagram/constants/SourceString.dart';
import 'package:clone_instagram/pages/profile/account_app.dart';
import 'package:flutter/material.dart';

import '../../../data/list_account.dart';

class AccountChangeBts extends StatelessWidget {
  const AccountChangeBts({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery
        .of(context)
        .size
        .width;
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      children: [
        Divider(
          thickness: 3, indent: (width / 2) - 50, endIndent: (width / 2) - 50,),
        const SizedBox(height: 10,),
        const AccountApp(),
        const SizedBox(height: 15,),
        const Text(SourceString.yourProfileInFacebook),
        Container(
            decoration:  const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10))
            ),
            child: Account.listAccount[0]
        ),
        const SizedBox(height: 15,),
        OutlinedButton(
            onPressed: () {},
            child: const Text(SourceString.accountCenter,
              style: TextStyle(color: Colors.black),)
        )

      ],
    );
  }

}