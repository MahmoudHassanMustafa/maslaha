import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/messages.dart';
import '../../shared/constants.dart';
import '../../utils/size_config.dart';
import '../../widgets/profile_image_container.dart';
import '../../widgets/status_badge.dart';
import 'components/image_msg_container.dart';
import 'components/message_bubble.dart';
import 'components/new_message.dart';
import 'contact_info_screen.dart';

class MessagesScreen extends StatelessWidget {
  static const routeName = '/chat-messages';
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, Object?>;
    final chatId = routeArgs['id'] as String;
    final userName = routeArgs['userName'] as String;
    final imageUrl = routeArgs['imageUrl'] as String;
    final status = routeArgs['status'] as Map<String, Object>;
    final conversation = Provider.of<Messages>(context).getMessages(chatId);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: kPrimaryColor),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(15),
            bottomRight: Radius.circular(15),
          ),
        ),
        toolbarHeight: getProportionateScreenHeight(80),
        titleSpacing: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ProfileImageContainer(
              margin: const EdgeInsets.only(left: 4),
              width: getProportionateScreenWidth(45),
              height: getProportionateScreenHeight(60),
              profileImg: imageUrl,
            ),
            SizedBox(width: getProportionateScreenWidth(8)),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    userName,
                    style: const TextStyle(color: Colors.black),
                    softWrap: false,
                    overflow: TextOverflow.ellipsis,
                  ),
                  StatusBadge(
                    status: status,
                    size: 5,
                    withText: true,
                    textColor: Colors.grey,
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: [
          PopupMenuButton(
              icon: Icon(
                Icons.more_vert_rounded,
                color: Colors.grey,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              onSelected: (selectedOption) {
                switch (selectedOption) {
                  case 'contact-info':
                    Navigator.of(context).pushNamed(ContactInfoScreen.routeName,
                        arguments: {
                          'username': userName,
                          'profile-img': imageUrl
                        });
                    break;
                }
              },
              itemBuilder: (ctx) {
                return [
                  PopupMenuItem(
                    child: Text('Contact info'),
                    value: 'contact-info',
                  ),
                  PopupMenuItem(
                    child: Text('Delete chat'),
                    value: 'delete-chat',
                  ),
                  PopupMenuItem(
                    child: Text(
                      'close',
                      style: TextStyle(color: Colors.red),
                    ),
                    value: 'close',
                  ),
                ];
              }),
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 8),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: conversation.length,
              itemBuilder: (_, index) {
                if (conversation[index].type == ContentType.Image)
                  return ImageMsgContainer(
                    conversation[index].userId == 'me' ? true : false,
                    conversation[index].messageContent,
                    conversation[index].sentAt,
                  );

                return MessageBubble(
                  conversation[index].userId == 'me' ? true : false,
                  conversation[index].messageContent,
                  conversation[index].sentAt,
                );
              },
            ),
          ),
          NewMessage(chatId, 'me'),
        ],
      ),
    );
  }
}
