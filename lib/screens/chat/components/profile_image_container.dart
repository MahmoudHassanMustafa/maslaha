import 'package:flutter/material.dart';

class ProfileImageContainer extends StatelessWidget {
  final String imageUrl;
  final double width;
  final double height;

  const ProfileImageContainer({
    required this.imageUrl,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
        image:
            DecorationImage(image: NetworkImage(imageUrl), fit: BoxFit.cover),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade400,
            offset: Offset(0.0, 3.0),
            blurRadius: 4,
          ),
        ],
        color: Colors.grey,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
