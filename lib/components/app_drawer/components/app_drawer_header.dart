import 'package:flutter/material.dart';

class AppDrawerHeader extends StatelessWidget {
  const AppDrawerHeader({
    Key? key,
    String? profile,
    String? username,
    String? location,
  })  : _profile = profile,
        _username = username,
        _location = location,
        super(key: key);

  final String? _profile;
  final String? _username;
  final String? _location;

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
              'assets/images/user_male.png',
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
                _username!,
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
                _location!,
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
