import 'package:flutter/material.dart';
import '../constants/SourceString.dart';

class Account {
  static List<ListTile> listAccount = [
    ListTile(
      leading: Transform.scale(
          scale: 1.5, child: Image.asset("assets/images/avatar.png")),
      title: const Text(SourceString.userName),
    ),
    ListTile(
      leading: Transform.scale(
          scale: 1.5, child: Image.asset("assets/images/avatar.png")),
      title: const Text(SourceString.userName),
    ),
    ListTile(
      leading: Transform.scale(
          scale: 1.5, child: Image.asset("assets/images/avatar.png")),
      title: const Text(SourceString.userName),
    ),
    ListTile(
      leading: Container(
          decoration: BoxDecoration(
            color: Colors.green[50],
            shape: BoxShape.circle,
          ),
          padding: const EdgeInsets.all(7.5),
          child: Image.asset("assets/images/add.png")),
      title: const Text(SourceString.addNewAccount),
    )
  ];
}
