import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../utils/size_config.dart';
import '../../../widgets/profile_image_container.dart';
import '../messages_screen.dart';
import '../../../widgets/status_badge.dart';
import '../../../providers/messages.dart';
import '../../../providers/conversations.dart';

class ChatCard extends StatelessWidget {
  final String id;
  final String userName;
  final String imageUrl;
  final Map<String, Object> status;
  final Message lastMessage;
  final String lastMessageTime;

  ChatCard({
    required this.id,
    required this.userName,
    required this.imageUrl,
    required this.status,
    required this.lastMessage,
    required this.lastMessageTime,
  });

  String _showLastMessage(Message lmsg) {
    if (lmsg.type == ContentType.Image) return 'Image';
    return lmsg.messageContent;
  }

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey('${DateTime.now()}'),
      onDismissed: (_) =>
          Provider.of<Conversations>(context, listen: false).deleteChat(id),
      direction: DismissDirection.endToStart,
      background: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.red,
        ),
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: Padding(
          padding: const EdgeInsets.only(right: 20),
          child: const Icon(
            Icons.delete_rounded,
            color: Colors.white,
            size: 32,
          ),
        ),
        alignment: Alignment.centerRight,
      ),
      child: Card(
        elevation: 0,
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: InkWell(
          borderRadius: BorderRadius.circular(5),
          onTap: () {
            Navigator.of(context)
                .pushNamed(MessagesScreen.routeName, arguments: {
              'id': id,
              'userName': userName,
              'imageUrl': imageUrl,
              'status': status,
            });
          },
          child: Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Row(
              children: [
                StatusBadge.overlayed(
                  right: 10,
                  bottom: 7,
                  borderSize: 3,
                  status: status,
                  child: ProfileImageContainer(
                    profileImg: NetworkImage(imageUrl),
                    width: getProportionateScreenWidth(55),
                    height: getProportionateScreenHeight(80),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            flex: 2,
                            child: Text(
                              userName,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                              maxLines: 1,
                              softWrap: false,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Flexible(child: Text('$lastMessageTime')),
                        ],
                      ),
                      SizedBox(height: getProportionateScreenHeight(4)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            flex: 2,
                            child: Text(
                              lastMessage.userId == 'me'
                                  ? 'Me: ${_showLastMessage(lastMessage)}'
                                  : '${userName.split(' ')[0]}: ${_showLastMessage(lastMessage)}',
                              softWrap: false,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(color: Colors.black54),
                            ),
                          ),
                          Flexible(
                            child: const CircleAvatar(
                              radius: 10,
                              child: FittedBox(
                                child: Padding(
                                  padding: const EdgeInsets.all(4),
                                  child: Text(
                                    '1',
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                              backgroundColor: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
