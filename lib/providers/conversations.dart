import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

enum Status {
  Online,
  Away,
  Offline,
}

class Conversation with ChangeNotifier {
  final String id;
  final String userName;
  final String imageUrl;
  final Status status;
  final String lastMessage;
  final DateTime lastMessageTime;

  Conversation({
    required this.id,
    required this.userName,
    required this.imageUrl,
    required this.status,
    required this.lastMessage,
    required this.lastMessageTime,
  });
}

class Conversations with ChangeNotifier {
  List<Conversation> _conversationList = [
    Conversation(
      id: 'c1',
      userName: 'Mahmoud Hassan',
      imageUrl:
          'https://scontent.fcai19-3.fna.fbcdn.net/v/t1.6435-9/30594925_2043671465890477_2859440508139208704_n.jpg?_nc_cat=106&ccb=1-3&_nc_sid=84a396&_nc_ohc=557dyAc3XgsAX_EZLAJ&_nc_ht=scontent.fcai19-3.fna&oh=446ffd3f39155560df5a1de238000254&oe=60C8F3AF',
      status: Status.Online,
      lastMessage: 'Hello from Mahmoud',
      lastMessageTime: DateTime.parse('2021-05-16 13:27:00'),
    ),
    Conversation(
      id: 'c2',
      userName: 'Mohamad Walid',
      imageUrl:
          'https://scontent.fcai19-3.fna.fbcdn.net/v/t1.6435-1/p200x200/130096908_3853876747990672_6336264518263949149_n.jpg?_nc_cat=108&ccb=1-3&_nc_sid=7206a8&_nc_ohc=jeuHeY3Fw5MAX8cRskp&_nc_ht=scontent.fcai19-3.fna&tp=6&oh=770bd5dcc8a25a7d9fb4c7179931c9f6&oe=60C8ACDB',
      status: Status.Away,
      lastMessage: 'Hello from Walid',
      lastMessageTime: DateTime.parse('2021-05-16 14:27:00'),
    ),
    Conversation(
      id: 'c3',
      userName: 'Kareem Alaa',
      imageUrl:
          'https://scontent.fcai19-3.fna.fbcdn.net/v/t1.6435-9/85055893_1100391650293584_3718071334660472832_n.jpg?_nc_cat=107&ccb=1-3&_nc_sid=09cbfe&_nc_ohc=USNYQqM4ZxQAX8i4WQN&_nc_ht=scontent.fcai19-3.fna&oh=56b8aa8e5a8d10a1c73da844590f8665&oe=60C89EAE',
      status: Status.Offline,
      lastMessage: 'Hello from Kareem',
      lastMessageTime: DateTime.parse('2021-05-15 11:32:00'),
    ),
  ];

  List<Conversation> _filteredList = [];

  List<Conversation> get conversationList {
    List<Conversation> conversations;
    if (_filteredList.isEmpty)
      conversations = [..._conversationList];
    else
      conversations = [..._filteredList];

    return conversations;
  }

  String formatMessageTime(DateTime dateTime) {
    var timePassed = DateTime.now().difference(dateTime);

    if (timePassed.inDays == 0 &&
        timePassed.inHours == 0 &&
        timePassed.inMinutes == 0) {
      return 'Just now';
    } else if (timePassed.inDays == 0 &&
        timePassed.inHours == 0 &&
        (timePassed.inMinutes > 2 && timePassed.inMinutes <= 10)) {
      return 'Few minutes ago';
    } else if (timePassed.inDays == 0 && timePassed.inHours != 0) {
      return '${timePassed.inHours} h ago';
    } else if (timePassed.inDays == 1) {
      return 'Yesterday';
    } else if (timePassed.inDays > 1 && timePassed.inDays <= 5) {
      return '${timePassed.inDays} days ago';
    }
    return DateFormat('dd MMM').format(dateTime);
  }

  Map<String, Object> parseUserStatus(Status status) {
    late Map<String, Object> userStatus;
    switch (status) {
      case Status.Online:
        userStatus = {'text': 'Online', 'color': Colors.green};
        break;
      case Status.Away:
        userStatus = {'text': 'Away', 'color': Colors.yellow};
        break;
      case Status.Offline:
        userStatus = {'text': 'Offline', 'color': Colors.red};
        break;
      default:
        break;
    }

    return userStatus;
  }

  void searchConversationList(String str) {
    _filteredList = _conversationList
        .where((conversation) =>
            conversation.userName.toLowerCase().contains(str.toLowerCase()))
        .toList();
    notifyListeners();
  }

  void deleteChat(String id) {
    _conversationList.removeWhere((chat) => chat.id == id);
    notifyListeners();
  }
}
