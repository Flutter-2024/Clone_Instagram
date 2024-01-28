import 'package:clone_instagram/constants/source_image.dart';
import 'package:flutter/material.dart';
import '../constants/source_string.dart';

class Account {
  String avatar;
  String userName;
  Account(this.avatar, this.userName);
  static List<Account> listAccount = [
    Account(SourceImage.avatar, SourceString.userName),
    Account(SourceImage.avatar, SourceString.userName),
    Account(SourceImage.avatar, SourceString.userName),
    Account(SourceImage.add, SourceString.addNewAccount),
  ];
}
