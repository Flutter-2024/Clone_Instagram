import 'package:flutter/cupertino.dart';

import '../data/chat_message.dart';
import '../tests/test.dart';

class ChatDetailViewModel extends ChangeNotifier {
  bool _isTyping = false;
  String _typingMessage = '';
  late String _contactorId;
  late List<ChatMessage> _messageList;

  ChatDetailViewModel() {
    _contactorId = '';
    _messageList = [];
  }

  bool get isTyping => _isTyping;
  String get typingMessage => _typingMessage;
  String get contactorId => _contactorId;
  List<ChatMessage> get messageList => _messageList;

  void setContactorId(String contactorId) {
    _contactorId = contactorId;
    notifyListeners();
  }

  void setMessageList(List<ChatMessage> messageList) {
    _messageList = messageList;
    notifyListeners();
  }

  void setIsTyping(bool isTyping) {
    _isTyping = isTyping;
    notifyListeners();
  }

  void setTypingMessage(String message) {
    _typingMessage = message;
    notifyListeners();
  }

  void addNewMessage(ChatMessage message) {
    _messageList.add(message);
    notifyListeners();
  }

  void setMessageListByContactorId(List<ChatMessage> messages, String contactorId) {
    _messageList = messages.where((message) {
      return (message.senderId == "U000" && message.receiverId == contactorId) ||
          (message.receiverId == "U000" && message.senderId == contactorId);
    }).toList();
    notifyListeners();
  }
}