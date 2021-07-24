import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:maslaha/models/chat_message_model.dart';
import 'package:maslaha/utils/user_status_parser.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:socket_io_client/socket_io_client.dart' as IO;

import '../../shared/constants.dart';
import '../../utils/size_config.dart';
import '../../widgets/profile_image_container.dart';
import '../../widgets/status_badge.dart';
import 'components/message_bubble.dart';
import 'components/new_message.dart';
import 'contact_info_screen.dart';

class ChatScreen extends StatefulWidget {
  static const routeName = '/chat-messages';

  ChatScreen({
    required this.convID,
    required this.receiverID,
    required this.receiverName,
    required this.receiverProfilePic,
    required this.receiverStatus,
  });

  final String convID;
  final String receiverID;
  final String receiverName;
  final String receiverProfilePic;
  final String receiverStatus;

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List<ChatMessage> _messages = [];
  var _isLoading = false;

  final _scrollController = ScrollController();

  _getConversationContent() async {
    setState(() {
      _isLoading = true;
    });
    var userPrefs = await SharedPreferences.getInstance();
    var uid = userPrefs.getString('id');
    var currentToken = userPrefs.getString('token');

    var url = Uri.parse('https://masla7a.herokuapp.com/chatting');
    var request = http.Request('GET', url);
    request.headers.addAll(
        {'x-auth-token': '$currentToken', 'content-type': 'application/json'});
    request.body = json.encode({'id': widget.convID});
    var response = await request.send();

    final respStr = await response.stream.bytesToString();
    var resBody = json.decode(respStr);

    List<ChatMessage> messages = [];
    if (response.statusCode == 200) {
      resBody.forEach((msg) {
        messages.insert(
            0,
            ChatMessage(
              isMyMsg: msg['user']['_id'] == uid ? true : false,
              messageType: MessageType.Text,
              content: msg['content'],
              sentAt: msg['createdAt'],
            ));
      });
    }
    setState(() {
      _messages = messages;
      _isLoading = false;
    });
  }

  _deleteConversation(String convId) async {
    var userPrefs = await SharedPreferences.getInstance();
    var currentToken = userPrefs.getString('token');

    var url = Uri.parse('https://masla7a.herokuapp.com/chatting/$convId');
    await http.delete(url, headers: {'x-auth-token': '$currentToken'});
  }

  late IO.Socket _socket = IO.io(
      'https://masla7a.herokuapp.com/chatting',
      IO.OptionBuilder()
          .setTransports(['websocket'])
          .disableAutoConnect()
          .build());

  _updateMessages() async {
    var prefs = await SharedPreferences.getInstance();
    var uid = prefs.getString('id');

    _socket.connect();
    _socket.on('new-message', (data) {
      print('new message');
      var newMessage = ChatMessage(
        isMyMsg: data['sender'] == uid ? true : false,
        messageType: MessageType.Text,
        content: data['content'],
        sentAt: data['createdAt'],
      );
      setState(() {
        _messages.add(newMessage);
      });
      WidgetsBinding.instance?.addPostFrameCallback((_) {
        if (_scrollController.hasClients) {
          _scrollController.animateTo(
            _scrollController.position.maxScrollExtent,
            duration: Duration(seconds: 1),
            curve: Curves.fastOutSlowIn,
          );
        }
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _getConversationContent();
    _updateMessages();
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
    _socket.close();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
      }
    });

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(15),
            bottomRight: Radius.circular(15),
          ),
        ),
        toolbarHeight: getProportionateScreenHeight(80),
        titleSpacing: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: kPrimaryColor,
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ProfileImageContainer(
              margin: const EdgeInsets.only(left: 4),
              width: getProportionateScreenWidth(45),
              height: getProportionateScreenHeight(60),
              profileImg: widget.receiverProfilePic,
            ),
            SizedBox(width: getProportionateScreenWidth(8)),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.receiverName,
                    style: const TextStyle(color: Colors.black),
                    softWrap: false,
                    overflow: TextOverflow.ellipsis,
                  ),
                  StatusBadge(
                    status: statusParser(widget.receiverStatus),
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
            icon: const Icon(
              Icons.more_vert_rounded,
              color: Colors.grey,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            onSelected: (selectedOption) {
              switch (selectedOption) {
                case 'contact-info':
                  Navigator.of(context)
                      .pushNamed(ContactInfoScreen.routeName, arguments: {
                    'username': widget.receiverName,
                    'profile-img': widget.receiverProfilePic,
                  });
                  break;
                case 'delete-chat':
                  Navigator.pop(context);
                  _deleteConversation(widget.convID);
                  break;
                case 'close':
                  Navigator.pop(context);
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
            },
          ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 8),
          Expanded(
            child: _isLoading
                ? const Center(
                    child: const CircularProgressIndicator(
                      color: kPrimaryColor,
                    ),
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    controller: _scrollController,
                    itemCount: _messages.length,
                    itemBuilder: (_, index) {
                      return MessageBubble(
                        _messages[index].isMyMsg,
                        _messages[index].content,
                        DateTime.parse(_messages[index].sentAt),
                      );
                    },
                  ),
          ),
          NewMessage(receiverId: widget.receiverID, socket: _socket),
        ],
      ),
    );
  }
}
