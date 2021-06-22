import 'package:flutter/material.dart';

class ProfileImageContainer extends StatelessWidget {
  final ImageProvider profileImg;
  final double? width;
  final double? height;
  final EdgeInsets? margin;
  final Function()? onTap;

  const ProfileImageContainer({
    this.profileImg = const AssetImage('assets/icons/user_male.png'),
    this.width,
    this.height,
    this.margin = const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, cons) {
      return GestureDetector(
        child: Container(
          width: width ?? cons.constrainWidth(60),
          height: height ?? cons.constrainHeight(60),
          margin: margin,
          decoration: BoxDecoration(
            color: Colors.grey[100],
            image: DecorationImage(image: profileImg, fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onTap: onTap ?? () {},
      );
    });
  }
}
