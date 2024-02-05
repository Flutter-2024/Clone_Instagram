import 'package:clone_instagram/widgets/custom_active_account_widget.dart';
import 'package:flutter/cupertino.dart';

class Test {
  static final List<Widget> storyTest = _initializeStoryTest();

  static List<Widget> _initializeStoryTest() {
    return const [
      CustomActiveAccountWidget(
        isActive: true,
        noteContent: "Helooooooooooooooooooooooooooooooooooooooooooooooooooooooooo",
        username: "Hello 1",
        imageUrl: "https://static-00.iconduck.com/assets.00/flutter-icon-2048x2048-ufx4idi8.png",
      ),
      CustomActiveAccountWidget(
        isActive: true,
        noteContent: "Hello",
        username: "Hello 2",
        imageUrl: "https://static-00.iconduck.com/assets.00/flutter-icon-2048x2048-ufx4idi8.png",
      ),
      CustomActiveAccountWidget(
        isActive: false,
        username: "Hello 3",
        imageUrl: "https://static-00.iconduck.com/assets.00/flutter-icon-2048x2048-ufx4idi8.png",
      ),
    ];
  }
}