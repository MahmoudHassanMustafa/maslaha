import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/conversations.dart';
import '../../providers/messages.dart';
import '../../shared/constants.dart';
import '../../utils/size_config.dart';
import 'components/chat_card.dart';
import 'components/chat_search.dart';

class ChatScreen extends StatefulWidget {
  static const routeName = '/chat';
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    var chatsData = Provider.of<Conversations>(context);
    var chats = chatsData.conversationList;
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: kPrimaryColor),
        centerTitle: true,
        backgroundColor: Colors.white,
        title: const Text(
          'Chat',
          style: const TextStyle(
            fontSize: 24,
            color: Colors.black87,
            fontWeight: FontWeight.bold,
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(15),
            bottomRight: Radius.circular(15),
          ),
        ),
        bottom: ChatSearch(),
      ),
      body: Column(
        children: [
          const SizedBox(height: 4),
          Expanded(
            child: ListView.builder(
              itemBuilder: (ctx, index) => ChangeNotifierProvider.value(
                value: chats[index],
                child: Column(
                  children: [
                    ChatCard(
                      id: chats[index].id,
                      userName: chats[index].userName,
                      imageUrl: chats[index].imageUrl,
                      status: chatsData.parseUserStatus(chats[index].status),
                      lastMessage: Provider.of<Messages>(context)
                          .getLastMessage(chats[index].id),
                      lastMessageTime: chatsData
                          .formatMessageTime(chats[index].lastMessageTime),
                    ),
                    if (index != chats.length - 1)
                      Divider(
                        endIndent: getProportionateScreenWidth(20),
                        indent: getProportionateScreenWidth(20),
                      ),
                  ],
                ),
              ),
              itemCount: chats.length,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.add,
          size: 32,
        ),
        onPressed: () {},
      ),
    );
  }
}
