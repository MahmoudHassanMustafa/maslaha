enum MessageType { Text, Picture }

class ChatMessage {
  final bool isMyMsg;
  final String content;
  final String sentAt;
  final MessageType messageType;

  ChatMessage({
    required this.isMyMsg,
    required this.messageType,
    required this.content,
    required this.sentAt,
  });
}
