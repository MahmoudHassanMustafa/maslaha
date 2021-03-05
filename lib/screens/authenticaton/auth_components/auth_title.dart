import 'package:maslaha/shared/size_config.dart';
import 'package:flutter/material.dart';

Widget authTitle(String title, double top, double left) {
  return Positioned(
    child: Text(
      title,
      style: TextStyle(
          fontSize: getProportionateScreenHeight(25),
          fontWeight: FontWeight.bold,
          color: Colors.black),
      textAlign: TextAlign.center,
    ),
    top: getProportionateScreenHeight(top),
    left: getProportionateScreenWidth(left),
  );
}
