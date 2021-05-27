import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';

import '../../../providers/messages.dart';

enum MediaSource { Image, Vedio }

class NewMessage extends StatefulWidget {
  final String chatId;
  final String userId;

  const NewMessage(this.chatId, this.userId);

  @override
  _NewMessageState createState() => _NewMessageState();
}

class _NewMessageState extends State<NewMessage> {
  File? _selectedMediaFile;

  final _controller = TextEditingController();
  final _picker = ImagePicker();

  Future getMedia(MediaSource mediaSource) async {
    final pickedFile = mediaSource == MediaSource.Image
        ? await _picker.getImage(source: ImageSource.gallery)
        : await _picker.getVideo(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _selectedMediaFile = File(pickedFile.path);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final messages = Provider.of<Messages>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: Stack(
              children: [
                TextField(
                  controller: _controller,
                  onSubmitted: (_) {
                    messages.sendMessage(
                        widget.chatId, widget.userId, 'text', _controller.text);
                    _controller.clear();
                  },
                  decoration: InputDecoration(
                    prefixIcon: SizedBox(),
                    hintText: 'Send a message...',
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 15,
                    ),
                    filled: true,
                    fillColor: Colors.grey.shade300,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.attach_file,
                    color: Colors.blue,
                  ),
                  splashRadius: 1,
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      backgroundColor: Colors.transparent,
                      barrierColor: Colors.transparent,
                      builder: (_) {
                        return Container(
                          color: Colors.transparent,
                          height: 130,
                          margin: const EdgeInsets.only(left: 10, bottom: 55),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              buildMediaPicker(
                                icon: Icons.photo,
                                tapHandler: () async {
                                  await getMedia(MediaSource.Image);
                                  print(
                                      'FFFFFFFFFFFFIIIIIIIIILLLLLLLLLLLLLLEEEEEEEEEE $_selectedMediaFile');
                                  if (_selectedMediaFile != null)
                                    messages.sendMessage(
                                        widget.chatId,
                                        widget.userId,
                                        'image',
                                        _selectedMediaFile);

                                  Navigator.pop(context);
                                },
                              ),
                              buildMediaPicker(
                                icon: Icons.videocam_rounded,
                                tapHandler: () async {
                                  await getMedia(MediaSource.Vedio);
                                  print(
                                      'FFFFFFFFFFFFIIIIIIIIILLLLLLLLLLLLLLEEEEEEEEEE $_selectedMediaFile');
                                  if (_selectedMediaFile != null)
                                    messages.sendMessage(
                                        widget.chatId,
                                        widget.userId,
                                        'video',
                                        _selectedMediaFile);

                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
          SizedBox(width: 6),
          CircleAvatar(
            radius: 22,
            child: IconButton(
              icon: Icon(Icons.send_rounded),
              onPressed: () {
                messages.sendMessage(
                    widget.chatId, widget.userId, 'text', _controller.text);
                _controller.clear();
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
