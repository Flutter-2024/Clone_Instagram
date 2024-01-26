import 'package:flutter/material.dart';

class ScaleTransitionPost extends StatefulWidget {
  ScaleTransitionPost({super.key, required this.widget});
  Widget widget;
  @override
  ScaleTransitionPostState createState() => ScaleTransitionPostState();
}

class ScaleTransitionPostState extends State<ScaleTransitionPost>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> opacityAnimation;
  late Animation<double> scaleAnimation;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 400));
    scaleAnimation =
        CurvedAnimation(parent: controller, curve: Curves.easeOutExpo);
    opacityAnimation = Tween<double>(begin: 0.0, end: 1).animate(
        CurvedAnimation(parent: controller, curve: Curves.easeOutExpo));

    controller.addListener(() => setState(() {}));
    controller.forward();
  }
  @override
  void dispose() {
    controller.dispose();
    super.dispose();

  }
  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: opacityAnimation,
      child: ScaleTransition(
        scale: scaleAnimation,
        child: widget.widget,
      ),
    );
  }

}