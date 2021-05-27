import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;
import 'package:video_player/video_player.dart';

class MessageBubble extends StatefulWidget {
  MessageBubble(
    this.isMe,
    this.msgType,
    this.content,
    this.sentAt, {
    this.key,
  });

  final Key? key;
  final bool isMe;
  final String msgType;
  final dynamic content;
  final DateTime sentAt;

  @override
  _MessageBubbleState createState() => _MessageBubbleState();
}

class _MessageBubbleState extends State<MessageBubble> {
  VideoPlayerController? _playerController;
  late VoidCallback listener;

  @override
  void initState() {
    super.initState();
    listener = () {
      setState(() {});
    };
  }

  void initializeVideoController() {
    if (_playerController == null) {
      _playerController = VideoPlayerController.file(widget.content)
        ..addListener(listener)
        ..setVolume(0.7)
        ..initialize();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: widget.isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        decoration: BoxDecoration(
          color: widget.isMe ? Colors.blueGrey[300] : Colors.blue,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
            bottomLeft: !widget.isMe ? Radius.circular(0) : Radius.circular(15),
            bottomRight: widget.isMe ? Radius.circular(0) : Radius.circular(15),
          ),
        ),
        padding: EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 14,
        ),
        margin: EdgeInsets.symmetric(
          vertical: 4,
          horizontal: 8,
        ),
        child: Wrap(
          alignment: WrapAlignment.end,
          clipBehavior: Clip.none,
          spacing: 10,
          runSpacing: 10,
          crossAxisAlignment: WrapCrossAlignment.end,
          children: [
            buildMessageBubbleContent(widget.msgType),
            Text(
              intl.DateFormat.jm().format(widget.sentAt),
              style: TextStyle(
                color: Colors.white70,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildMessageBubbleContent(String type) {
    late Widget resultedWidget;
    switch (type) {
      case 'text':
        resultedWidget = Text(
          widget.content,
          style: TextStyle(
            color: Colors.white,
          ),
          textAlign: TextAlign.start,
          softWrap: true,
          overflow: TextOverflow.visible,
        );
        break;
      case 'image':
        resultedWidget = Image.file(
          widget.content,
          fit: BoxFit.cover,
        );
        break;
      case 'video':
        initializeVideoController();
        resultedWidget = VideoPlayer(_playerController!);
    }
    return resultedWidget;
  }
}
