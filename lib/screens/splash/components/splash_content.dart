import 'package:maslaha/shared/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

//  The default structure for the splash screen

class SplashContent extends StatelessWidget {
  const SplashContent({
    Key? key,
    this.image,
    this.title,
    this.description,
  }) : super(key: key);

  final String? image, title, description;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(
          flex: 2,
        ),
        SvgPicture.asset(
          image!,
          fit: BoxFit.cover,
        ),
        Spacer(
          flex: 2,
        ),
        Text(
          title!,
          style: TextStyle(
            fontSize: getProportionateScreenWidth(20),
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0, right: 10.0, left: 10.0),
          child: Text(
            description!,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: getProportionateScreenWidth(16)),
          ),
        ),
      ],
    );
  }
}
