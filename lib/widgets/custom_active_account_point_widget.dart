import 'package:flutter/material.dart';

class CustomActivePointWidget extends StatelessWidget {
  final double width;
  final double height;
  const CustomActivePointWidget({
    super.key,
    this.width = 20,
    this.height = 20,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.green.shade400,
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.white,
          width: 2,
        ),
      ),
    );
  }
}