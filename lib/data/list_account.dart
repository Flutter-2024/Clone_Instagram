import 'package:clone_instagram/constants/source_image.dart';
import 'package:flutter/material.dart';
import '../constants/source_string.dart';

class Account {
  static List<ListTile> listAccount = [
    ListTile(
      leading: Transform.scale(
          scale: 1.5, child: Image.asset(SourceImage.avatar)),
      title: const Text(SourceString.userName),
    ),
    ListTile(
      leading: Transform.scale(
          scale: 1.5, child: Image.asset(SourceImage.avatar)),
      title: const Text(SourceString.userName),
    ),
    ListTile(
      leading: Transform.scale(
          scale: 1.5, child: Image.asset(SourceImage.avatar)),
      title: const Text(SourceString.userName),
    ),
    ListTile(
      leading: Container(
          decoration: BoxDecoration(
            color: Colors.green[50],
            shape: BoxShape.circle,
          ),
          padding: const EdgeInsets.all(7.5),
          child: Image.asset(SourceString.add)),
      title: const Text(SourceString.addNewAccount),
    )
  ];
}
