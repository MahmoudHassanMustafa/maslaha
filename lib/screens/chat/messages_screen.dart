import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/messages.dart';
import './components/message_bubble.dart';
import './components/new_message.dart';
import './components/popup_menu.dart';
import './components/profile_image_container.dart';
import './components/status_badge.dart';
import './contact_info_screen.dart';

class MessagesScreen extends StatelessWidget {
  static const routeName = '/chat-messages';
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, Object?>;
    final chatId = routeArgs['id'] as String;
    final userName = routeArgs['userName'] as String;
    final imageUrl = routeArgs['imageUrl'] as String;
    final status = routeArgs['status'] as Color;
    final conversation = Provider.of<Messages>(context).getMessages(chatId);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15),
            ),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_rounded, color: Colors.blue),
            onPressed: () => Navigator.pop(context),
          ),
          title: Row(
            children: [
              StatusBadge(
                color: status,
                child: ProfileImageContainer(
                  width: 40,
                  height: 40,
                  imageUrl: imageUrl,
                ),
              ),
              SizedBox(width: 8),
              Expanded(
                child: Text(
                  userName,
                  style: TextStyle(color: Colors.black),
                  softWrap: false,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          actions: [
            IconButton(
              icon: Icon(
                Icons.check_circle_outline_rounded,
                color: Colors.blue,
              ),
              onPressed: () {},
            ),
            PopupMenu(
              onSelection: (selectedOption) {
                switch (selectedOption) {
                  case 'contact-info':
                    Navigator.of(context)
                        .pushNamed(ContactInfoScreen.routeName);
                }
              },
              menuItems: [
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
              ],
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 8),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: conversation.length,
              itemBuilder: (_, index) {
                return MessageBubble(
                  conversation[index].userId == 'me' ? true : false,
                  conversation[index].type,
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
