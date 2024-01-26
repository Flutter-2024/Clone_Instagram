import 'package:flutter/cupertino.dart';

class TextStyleCustom{
  TextStyle textStyleBold(){
    return const TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w700
    );
  }
  TextStyle textStyleNormal(){
    return const TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w500
    );
  }
}