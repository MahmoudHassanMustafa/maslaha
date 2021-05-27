import 'package:flutter/material.dart';

import '../utils/size_config.dart';

class RoundedProfileImageContainer extends StatelessWidget {
  final ImageProvider profileImg;
  final double? width;
  final double? height;
  final EdgeInsets? margin;
  final Function()? onTap;

  const RoundedProfileImageContainer({
    this.profileImg = const AssetImage('assets/icons/user_male.png'),
    this.width,
    this.height,
    this.margin = const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: margin,
        decoration: BoxDecoration(
          color: Colors.grey[100],
          shape: BoxShape.circle,
          image: DecorationImage(image: profileImg, fit: BoxFit.contain),
        ),
        width: width ?? getProportionateScreenWidth(65),
        height: height ?? getProportionateScreenHeight(65),
      ),
      onTap: onTap ?? () {},
    );
  }
}
