import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final Widget? leadingIconButton;
  final Function? onleadingButtonPressed;
  final String? username;
  final String? location;
  final String? profile;

  CustomAppBar({
    this.leadingIconButton,
    this.profile,
    this.username,
    this.location,
    this.onleadingButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      padding: EdgeInsets.zero,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          leadingIconButton!,
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                username!,
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.black,
                ),
              ),
              Row(
                children: [
                  Icon(
                    Icons.location_pin,
                    color: Colors.black,
                    size: 20.0,
                  ),
                  Text(
                    location!,
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ],
          ),
          CircleAvatar(
            radius: 30.0,
            backgroundColor: Colors.grey[200],
            child: ClipOval(
                child: Image.asset(
              'assets/images/user_male.png',
              width: 50.0,
              height: 50.0,
              fit: BoxFit.scaleDown,
            )),
          ),
        ],
      ),
    );
  }
}
