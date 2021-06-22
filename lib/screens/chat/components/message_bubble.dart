import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;
import 'package:video_player/video_player.dart';

import '../../../providers/messages.dart';
import '../../../shared/constants.dart';

class MessageBubble extends StatefulWidget {
  MessageBubble(
    this.isMe,
    this.content,
    this.sentAt, {
    this.key,
  });

  final Key? key;
  final bool isMe;
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
    return Bubble(
      alignment: widget.isMe ? Alignment.centerRight : Alignment.centerLeft,
      margin: BubbleEdges.symmetric(horizontal: 8, vertical: 3),
      color: widget.isMe ? Colors.blueGrey[400] : kPrimaryColor,
      nip: widget.isMe ? BubbleNip.rightTop : BubbleNip.leftTop,
      child: Wrap(
        alignment: WrapAlignment.end,
        clipBehavior: Clip.none,
        spacing: 10,
        runSpacing: 10,
        crossAxisAlignment: WrapCrossAlignment.end,
        children: [
          Text(
            widget.content,
            style: TextStyle(
              color: Colors.white,
            ),
            textAlign: TextAlign.start,
            softWrap: true,
            overflow: TextOverflow.visible,
          ),
          Text(
            intl.DateFormat.jm().format(widget.sentAt),
            style: TextStyle(
              color: Colors.white70,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildMessageBubbleContent(ContentType type) {
    late Widget resultedWidget;
    switch (type) {
      case ContentType.Text:
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
      case ContentType.Image:
        resultedWidget = Image.file(
          widget.content,
          fit: BoxFit.cover,
        );
        break;
      case ContentType.Video:
        initializeVideoController();
        resultedWidget = VideoPlayer(_playerController!);
    }
    return resultedWidget;
  }
}
