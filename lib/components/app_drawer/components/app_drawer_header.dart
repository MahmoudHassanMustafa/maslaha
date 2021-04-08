import 'package:flutter/material.dart';

class AppDrawerHeader extends StatefulWidget {
  @override
  _AppDrawerHeaderState createState() => _AppDrawerHeaderState();
}

class _AppDrawerHeaderState extends State<AppDrawerHeader> {
  final String _username = 'Mahmoud Hassan';
  final String _location = 'Egpyt, Port-Said';
  final String _profileImagePath = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10.0),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.white,
            radius: 35.0,
            child: ClipOval(
                child: Image.asset(
              'assets/icons/user_male.png',
              width: 50.0,
              height: 50.0,
              fit: BoxFit.scaleDown,
            )),
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                _username,
                maxLines: 1,
                overflow: TextOverflow.clip,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
              SizedBox(
                height: 4.0,
              ),
              Text(
                _location,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10.0,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
