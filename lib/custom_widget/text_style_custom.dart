import 'package:flutter/cupertino.dart';

class TextStyleCustom{
  TextStyleCustom._internal();
  static final TextStyleCustom _instance = TextStyleCustom._internal();
  static TextStyleCustom get instance => _instance;
  TextStyle textStyleBold(){
    return const TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w700
    );
  }
  TextStyle textStyleNormal(){
    return const TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w500
    );
  }
}