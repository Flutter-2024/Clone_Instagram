import 'package:clone_instagram/constants/source_string.dart';
import 'package:clone_instagram/pages/profile/account_app.dart';
import 'package:flutter/material.dart';

import '../../../constants/source_image.dart';
import '../../../data/list_account.dart';

class AccountChangeBts extends StatelessWidget {
  const AccountChangeBts({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      children: [
        const SizedBox(
          height: 10,
        ),
        const AccountApp(),
        const SizedBox(
          height: 15,
        ),
        const Text(SourceString.yourProfileInFacebook),
        Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: ListTile(
              leading: Transform.scale(
                  scale: 1.5, child: Image.asset(SourceImage.avatar)),
              title: const Text(SourceString.userName),
            )),
        const SizedBox(
          height: 15,
        ),
        OutlinedButton(
            onPressed: () {},
            child: const Text(
              SourceString.accountCenter,
              style: TextStyle(color: Colors.black),
            ))
      ],
    );
  }
}
