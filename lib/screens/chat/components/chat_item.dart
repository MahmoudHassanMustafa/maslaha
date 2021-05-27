import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../messages_screen.dart';
import './profile_image_container.dart';
import './status_badge.dart';
import '../../../providers/messages.dart';
import '../../../providers/conversations.dart';

class ChatEntry extends StatelessWidget {
  final String id;
  final String userName;
  final String imageUrl;
  final Map<String, Object> status;
  final Message lastMessage;
  final String lastMessageTime;

  ChatEntry({
    required this.id,
    required this.userName,
    required this.imageUrl,
    required this.status,
    required this.lastMessage,
    required this.lastMessageTime,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey('${DateTime.now()}'),
      onDismissed: (_) =>
          Provider.of<Conversations>(context, listen: false).deleteChat(id),
      direction: DismissDirection.endToStart,
      background: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.red,
        ),
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        child: Padding(
          padding: const EdgeInsets.only(right: 20),
          child: Icon(
            Icons.delete_rounded,
            color: Colors.white,
            size: 32,
          ),
        ),
        alignment: Alignment.centerRight,
      ),
      child: Card(
        elevation: 5,
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(15),
          onTap: () {
            Navigator.of(context)
                .pushNamed(MessagesScreen.routeName, arguments: {
              'id': id,
              'userName': userName,
              'imageUrl': imageUrl,
              'status': status['color'],
            });
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: Column(
              children: [
                ListTile(
                  contentPadding: const EdgeInsets.all(0),
                  leading: StatusBadge(
                    color: status['color'] as Color,
                    child: ProfileImageContainer(
                      height: 60,
                      width: 60,
                      imageUrl: imageUrl,
                    ),
                  ),
                  title: Text(
                    userName,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                    maxLines: 1,
                    softWrap: false,
                    overflow: TextOverflow.fade,
                  ),
                  subtitle: Text(status['status'] as String),
                  trailing: Text('$lastMessageTime'),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        lastMessage.userId == 'me'
                            ? 'Me: ${lastMessage.messageContent.runtimeType}'
                            : '${userName.split(' ')[0]}: ${lastMessage.messageContent}',
                        softWrap: false,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: Colors.black54),
                      ),
                    ),
                    CircleAvatar(
                      radius: 10,
                      child: FittedBox(
                        child: Padding(
                          padding: const EdgeInsets.all(4),
                          child: Text(
                            '1',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      backgroundColor: Colors.red,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
