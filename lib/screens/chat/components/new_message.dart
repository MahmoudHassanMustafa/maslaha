import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

import '../../../shared/constants.dart';
import 'service_submit_form.dart';

class NewMessage extends StatefulWidget {
  final String receiverId;
  final IO.Socket socket;

  const NewMessage({required this.receiverId, required this.socket});

  @override
  _NewMessageState createState() => _NewMessageState();
}

class _NewMessageState extends State<NewMessage>
    with SingleTickerProviderStateMixin {
  File? _selectedMediaFile;
  final _picker = ImagePicker();

  final _controller = TextEditingController();

  var _showSendButton = false;

  Future getMedia() async {
    final pickedFile = await _picker.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _selectedMediaFile = File(pickedFile.path);
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                        _showSendButton = true;
                      });
                    else
                      setState(() {
                        _showSendButton = false;
                      });
                  },
                  onSubmitted: (msg) async {
                    var prefs = await SharedPreferences.getInstance();
                    var token = prefs.getString('token');

                    if (_controller.text.isNotEmpty) {
                      widget.socket.connect();
                      print('sending');
                      widget.socket.emit('authenticate', {'token': token});
                      widget.socket.emit(
                        'private',
                        {
                          'content': _controller.value.text,
                          'to': widget.receiverId,
                        },
                      );
                      print('sent');

                      _controller.clear();
                      setState(() {
                        _showSendButton = false;
                      });
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
                  icon: const Icon(
                    Icons.photo,
                    size: 28,
                    color: kPrimaryColor,
                  ),
                  splashRadius: 1,
                  onPressed: () async {
                    await getMedia();

                    var prefs = await SharedPreferences.getInstance();
                    var token = prefs.getString('token');

                    if (_selectedMediaFile != null) {
                      // socket.emit('authenticate', token);
                      // socket.emit(
                      //   'private',
                      //   {
                      //     'to': widget.receiverId,
                      //     // 'content': _controller.text,
                      //   },
                      // );
                    }
                  },
                ),
              ],
            ),
          ),
          const SizedBox(width: 6),
          Container(
            decoration: const BoxDecoration(
              color: kPrimaryColor,
              shape: BoxShape.circle,
            ),
            child: _showSendButton
                ? IconButton(
                    icon: SvgPicture.asset(
                      'assets/icons/chat_icons/send.svg',
                      color: Colors.white,
                    ),
                    onPressed: () async {
                      print('sent button pressed');
                      var prefs = await SharedPreferences.getInstance();
                      var token = prefs.getString('token');

                      if (_controller.text.isNotEmpty) {
                        widget.socket.connect();
                        print('sending');
                        widget.socket.emit('authenticate', {'token': token});
                        widget.socket.emit(
                          'private',
                          {
                            'content': _controller.value.text,
                            'to': widget.receiverId,
                          },
                        );
                        print('sent');

                        _controller.clear();
                        setState(() {
                          _showSendButton = false;
                        });
                      }
                    },
                  )
                : IconButton(
                    icon: SvgPicture.asset(
                      'assets/icons/chat_icons/contract.svg',
                      color: Colors.white,
                    ),
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        enableDrag: true,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                        ),
                        builder: (context) {
                          return ServiceSubmitForm();
                        },
                      );
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
