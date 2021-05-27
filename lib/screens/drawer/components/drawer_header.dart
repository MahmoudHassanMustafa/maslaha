import 'package:flutter/material.dart';
import 'package:maslaha/widgets/rounded_profile_image_container.dart';

import '../../../utils/size_config.dart';

class DrawerHeader extends StatelessWidget {
  final String _username = 'Mahmoud Hassan Mustafa Kamal';
  final String _location = 'Egpyt, Port-Said';
  // final String _profileImagePath = '';

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // TODO: show the user profile image in here and navigate to profile on click
        RoundedProfileImageContainer(
          // profileImg: AssetImage('assets/icons/user_female.png'),
          width: getProportionateScreenWidth(90),
          height: getProportionateScreenHeight(90),
          margin: const EdgeInsets.symmetric(horizontal: 8),
          onTap: () => print('Navigate to profie!'),
        ),
        Expanded(
          child: Wrap(
            direction: Axis.vertical,
            children: [
              SizedBox(
                width: getProportionateScreenWidth(250),
                child: Text(
                  _username,
                  softWrap: false,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
              ),
              Row(
                children: [
                  const Icon(
                    Icons.location_pin,
                    color: Colors.white60,
                    size: 20.0,
                  ),
                  Text(
                    _location,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 10.0,
                    ),
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
