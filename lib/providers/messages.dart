import 'package:flutter/foundation.dart';

enum ContentType {
  Text,
  Image,
  Video,
}

class Message {
  final String chatId;
  final String userId;
  final ContentType type;
  final messageContent;
  final DateTime sentAt;

  Message({
    required this.chatId,
    required this.userId,
    required this.type,
    required this.messageContent,
    required this.sentAt,
  });
}

class Messages with ChangeNotifier {
  List<Message> _messages = [
    Message(
      chatId: 'c1',
      userId: 'me',
      type: ContentType.Text,
      messageContent: 'Hello there!',
      sentAt: DateTime.parse('2021-05-16 13:32:00'),
    ),
    Message(
      chatId: 'c1',
      userId: 'not me',
      type: ContentType.Text,
      messageContent: 'Hey',
      sentAt: DateTime.parse('2021-05-16 13:32:00'),
    ),
    Message(
      chatId: 'c1',
      userId: 'me',
      type: ContentType.Text,
      messageContent: 'How are you?',
      sentAt: DateTime.parse('2021-05-16 13:33:00'),
    ),
    Message(
      chatId: 'c1',
      userId: 'not me',
      type: ContentType.Text,
      messageContent: 'I\'m alright',
      sentAt: DateTime.parse('2021-05-16 13:34:00'),
    ),
    Message(
      chatId: 'c2',
      userId: 'not me',
      type: ContentType.Text,
      messageContent: 'Hey!',
      sentAt: DateTime.parse('2021-05-16 11:22:00'),
    ),
    Message(
      chatId: 'c2',
      userId: 'me',
      type: ContentType.Text,
      messageContent: 'Hi',
      sentAt: DateTime.parse('2021-05-16 11:25:00'),
    ),
    Message(
      chatId: 'c3',
      userId: 'me',
      type: ContentType.Text,
      messageContent: 'Hello World!',
      sentAt: DateTime.parse('2021-05-15 10:11:00'),
    ),
    Message(
      chatId: 'c3',
      userId: 'not me',
      type: ContentType.Text,
      messageContent: 'Only one here, LOL',
      sentAt: DateTime.parse('2021-05-15 11:32:00'),
    ),
  ];

  List<Message> get messages {
    return [..._messages];
  }

  List<Message> getMessages(String chatId) {
    return [..._messages.where((message) => message.chatId == chatId)];
  }

  Message getLastMessage(String chatId) {
    return _messages.where((message) => message.chatId == chatId).last;
  }

  void sendMessage(
      String chatId, String userId, ContentType messageType, content) {
    _messages.add(
      Message(
          chatId: chatId,
          userId: userId,
          type: messageType,
          messageContent: content,
          sentAt: DateTime.now()),
    );
    notifyListeners();
  }
}
