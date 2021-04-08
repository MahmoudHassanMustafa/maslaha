import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DialogBox extends StatefulWidget {
  final String tag;
  final String title;
  final String description;
  final String actionButtonTitle;
  final Function actionButtonFunction;

  const DialogBox(
      {required this.tag,
      required this.title,
      required this.description,
      required this.actionButtonTitle,
      required this.actionButtonFunction});

  @override
  _DialogBoxState createState() => _DialogBoxState();
}

class _DialogBoxState extends State<DialogBox> with TickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(vsync: this, duration: Duration(milliseconds: 250));
  late final Animation<Offset> _slideAnimation =
      Tween(begin: Offset(0.0, 2.0), end: Offset(0.0, 0.0))
          .animate(_controller);

  @override
  void initState() {
    _controller.forward();

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _slideAnimation,
      child: AlertDialog(
        scrollable: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        title: Column(
          children: [
            SvgPicture.asset(
              widget.tag,
              height: 80.0,
              width: 80.0,
            ),
            SizedBox(
              height: 8.0,
            ),
            Text(
              widget.title,
            ),
          ],
        ),
        content: Text(
          widget.description,
        ),
        actions: [
          TextButton(
            onPressed: () {
              _controller.reverse();
              Navigator.of(context).pop();
            },
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              widget.actionButtonFunction();
            },
            child: Text(
              widget.actionButtonTitle,
            ),
          ),
        ],
      ),
    );
  }
}
