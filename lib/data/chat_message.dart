class ChatMessage {
  final String message;
  final String senderId;
  final String receiverId;
  final DateTime time;

  ChatMessage({required this.message, required this.senderId, required this.receiverId, required this.time});
}