import 'package:clone_instagram/data/chat_message.dart';
import 'package:clone_instagram/widgets/custom_active_account_widget.dart';
import 'package:flutter/cupertino.dart';

import '../data/user.dart';

class Test {
  static final List<Widget> storyTest = _initializeStoryTest();

  static List<Widget> _initializeStoryTest() {
    return const [
      CustomActiveAccountWidget(
        isActive: true,
        noteContent:
            "Helooooooooooooooooooooooooooooooooooooooooooooooooooooooooo",
        username: "Hello 1",
        imageUrl:
            "https://static-00.iconduck.com/assets.00/flutter-icon-2048x2048-ufx4idi8.png",
      ),
      CustomActiveAccountWidget(
        isActive: true,
        noteContent: "Hello",
        username: "Hello 2",
        imageUrl:
            "https://static-00.iconduck.com/assets.00/flutter-icon-2048x2048-ufx4idi8.png",
      ),
      CustomActiveAccountWidget(
        isActive: false,
        username: "Hello 3",
        imageUrl:
            "https://static-00.iconduck.com/assets.00/flutter-icon-2048x2048-ufx4idi8.png",
      ),
    ];
  }

  static final List<ChatMessage> chatMessageList = [
    ChatMessage(
        message: "Hello U001",
        senderId: "U000",
        receiverId: "U001",
        time: DateTime.parse("2022-01-01 10:00:00")),
    ChatMessage(
        message: "Hello U000",
        senderId: "U002",
        receiverId: "U000",
        time: DateTime.parse("2022-01-01 10:03:00")),
    ChatMessage(
        message: "How are you?",
        senderId: "U000",
        receiverId: "U002",
        time: DateTime.parse("2022-01-01 10:05:00")),
    ChatMessage(
        message: "I'm doing well, thank you! How about you?",
        senderId: "U002",
        receiverId: "U000",
        time: DateTime.parse("2022-01-01 10:06:00")),
    ChatMessage(
        message: "I'm good too, thanks for asking.",
        senderId: "U000",
        receiverId: "U002",
        time: DateTime.parse("2022-01-01 10:08:00")),
    ChatMessage(
        message: "What have you been up to lately?",
        senderId: "U000",
        receiverId: "U002",
        time: DateTime.parse("2022-01-01 10:15:00")),
    ChatMessage(
        message: "Just working on some projects. How about you?",
        senderId: "U002",
        receiverId: "U000",
        time: DateTime.parse("2022-01-01 10:16:00")),
    ChatMessage(
        message: "I've been studying for exams. It's been quite hectic.",
        senderId: "U000",
        receiverId: "U002",
        time: DateTime.parse("2022-01-01 12:30:00")),
    ChatMessage(
        message: "Good luck with your exams! You'll do great.",
        senderId: "U002",
        receiverId: "U000",
        time: DateTime.parse("2022-01-01 12:31:00")),
    ChatMessage(
        message: "Thanks! I really appreciate it.",
        senderId: "U000",
        receiverId: "U002",
        time: DateTime.parse("2022-01-01 12:32:00")),
    ChatMessage(
        message:
            "No problem. Hey, do you want to grab lunch sometime this week?",
        senderId: "U002",
        receiverId: "U000",
        time: DateTime.parse("2022-01-01 12:35:00")),
    ChatMessage(
        message: "Sure, that sounds like a great idea! How about Wednesday?",
        senderId: "U000",
        receiverId: "U002",
        time: DateTime.parse("2022-01-01 12:40:00")),
    ChatMessage(
        message: "Wednesday works for me. What time?",
        senderId: "U002",
        receiverId: "U000",
        time: DateTime.parse("2022-01-01 12:45:00")),
    ChatMessage(
        message: "Around 12:30 PM?",
        senderId: "U000",
        receiverId: "U004",
        time: DateTime.parse("2022-01-01 12:46:00")),
    ChatMessage(
        message: "Sounds good. Let's meet at the usual spot.",
        senderId: "U004",
        receiverId: "U000",
        time: DateTime.parse("2022-01-01 14:15:00")),
    ChatMessage(
        message: "Perfect. See you then!",
        senderId: "U000",
        receiverId: "U004",
        time: DateTime.parse("2022-01-01 14:30:00")),
    ChatMessage(
        message: "Looking forward to it! Bye for now.",
        senderId: "U004",
        receiverId: "U000",
        time: DateTime.parse("2022-01-01 14:45:00")),
    ChatMessage(
        message: "Bye!",
        senderId: "U000",
        receiverId: "U003",
        time: DateTime.parse("2022-01-01 15:00:00")),
    ChatMessage(
        message: "Hey, I forgot to ask, how's your family?",
        senderId: "U003",
        receiverId: "U000",
        time: DateTime.parse("2022-01-01 15:15:00")),
    ChatMessage(
        message: "They're doing well, thanks for asking. How about yours?",
        senderId: "U000",
        receiverId: "U002",
        time: DateTime.parse("2022-01-01 15:30:00")),
  ];

  static List<User> userList = List.generate(20, (index) {
    return User(
      id: "id_$index",
      fullName: "Full Name $index",
      username: "username_$index",
    );
  });
}
