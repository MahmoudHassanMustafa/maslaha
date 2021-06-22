import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../../providers/messages.dart';
import '../../../shared/constants.dart';
import 'service_submit_form.dart';

class NewMessage extends StatefulWidget {
  final String chatId;
  final String userId;

  const NewMessage(this.chatId, this.userId);

  @override
  _NewMessageState createState() => _NewMessageState();
}

class _NewMessageState extends State<NewMessage> {
  File? _selectedMediaFile;
  final _pageController = PageController();

  final _controller = TextEditingController();
  final _picker = ImagePicker();

  var showSendButton = false;

  Future getMedia() async {
    final pickedFile = await _picker.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _selectedMediaFile = File(pickedFile.path);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final messages = Provider.of<Messages>(context, listen: false);
    return Container(
      margin: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: Stack(
              children: [
                TextField(
                  controller: _controller,
                  onChanged: (msg) {
                    if (msg.isNotEmpty)
                      setState(() {
                        showSendButton = true;
                      });
                    else
                      setState(() {
                        showSendButton = false;
                      });
                  },
                  onSubmitted: (msg) {
                    if (msg.isNotEmpty) {
                      messages.sendMessage(
                          widget.chatId, widget.userId, ContentType.Text, msg);
                      _controller.clear();
                    }
                  },
                  decoration: InputDecoration(
                    prefixIcon: SizedBox.shrink(),
                    hintText: 'Send a message...',
                    filled: true,
                    fillColor: Colors.grey.withOpacity(0.3),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 15,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.photo,
                    size: 28,
                    color: kPrimaryColor,
                  ),
                  splashRadius: 1,
                  onPressed: () async {
                    await getMedia();
                    if (_selectedMediaFile != null)
                      messages.sendMessage(widget.chatId, widget.userId,
                          ContentType.Image, _selectedMediaFile);
                  },
                ),
              ],
            ),
          ),
          const SizedBox(width: 6),
          Container(
            decoration: BoxDecoration(
              color: kPrimaryColor,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: SvgPicture.asset(
                showSendButton
                    ? 'assets/icons/chat_icons/send.svg'
                    : 'assets/icons/chat_icons/contract.svg',
                color: Colors.white,
              ),
              onPressed: () {
                if (_controller.text.isNotEmpty) {
                  messages.sendMessage(widget.chatId, widget.userId,
                      ContentType.Text, _controller.text);
                  _controller.clear();
                } else {
                  showDialog(
                    context: context,
                    builder: (_) {
                      return AlertDialog(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        title: Text(
                          'Pose a service',
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        content: ConstrainedBox(
                          constraints: BoxConstraints(
                            maxHeight: 170,
                          ),
                          child: ServiceSubmitForm(_pageController),
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              _pageController.nextPage(
                                  duration: Duration(seconds: 1),
                                  curve: Curves.bounceInOut);
                            },
                            child: Text('Next'),
                          )
                        ],
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  GestureDetector buildMediaPicker(
      {required IconData icon, required Function() tapHandler}) {
    return GestureDetector(
      onTap: tapHandler,
      child: CircleAvatar(
        radius: 25,
        child: Icon(
          icon,
          color: Colors.white,
        ),
      ),
    );
  }
}
