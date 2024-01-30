import 'package:clone_instagram/pages/widgets/video_grid_view.dart';
import 'package:flutter/material.dart';

class ForYouResultScreen extends StatefulWidget {
  const ForYouResultScreen({super.key});

  @override
  State<ForYouResultScreen> createState() => _ForYouResultScreenState();
}

class _ForYouResultScreenState extends State<ForYouResultScreen> {
  @override
  Widget build(BuildContext context) {
    return const VideoGridView();
  }
}
