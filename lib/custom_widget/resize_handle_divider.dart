import 'package:flutter/material.dart';

class ResizeHandleDivider extends StatelessWidget{
  const ResizeHandleDivider({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Divider(
      thickness: 3,
      indent: (width / 2) - 50,
      endIndent: (width / 2) - 50,
    );
  }

}