import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;
import 'package:photo_view/photo_view.dart';

import '../../../shared/constants.dart';
import '../../../utils/size_config.dart';
import '../view_image_screen.dart';

class ImageMsgContainer extends StatelessWidget {
  const ImageMsgContainer(this.isMe, this.img, this.sentAt, {this.key});

  final Key? key;
  final bool isMe;
  final DateTime sentAt;
  final File img;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      children: [
        Container(
          width: getProportionateScreenWidth(250),
          height: getProportionateScreenHeight(350),
          padding: const EdgeInsets.all(3),
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
          decoration: BoxDecoration(
            color: isMe ? Colors.blueGrey[400] : kPrimaryColor,
            borderRadius: BorderRadius.circular(5),
          ),
          child: GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return ViewImageScreen(image: FileImage(img));
              }));
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Hero(
                tag: 'image',
                child: PhotoView(
                  imageProvider: FileImage(img),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 10,
          right: 16,
          child: Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.4),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              intl.DateFormat.jm().format(sentAt),
              style: TextStyle(
                color: Colors.white70,
                fontSize: 12,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
