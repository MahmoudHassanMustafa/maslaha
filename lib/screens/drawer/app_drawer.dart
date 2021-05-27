import 'package:flutter/material.dart';
import 'package:reside_menu/reside_menu.dart';

import './components/drawer_header.dart' as header;
import '../../widgets/rounded_profile_image_container.dart';
import './components/navigation_tabs.dart';
import './components/drawer_footer.dart';

class AppDrawer extends StatelessWidget {
  final Widget home;

  AppDrawer({required this.home});

  // TODO: fitch user data from server
  final Map<String, String> _userData = {
    'username': 'Mahmoud Hassan',
    'location': 'Egypt, Port-Said',
    'profileImageUrl': '',
  };

  @override
  Widget build(BuildContext context) {
    return ResideMenu.scaffold(
      appBarTitle: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            _userData['username'] as String,
            style: const TextStyle(
              fontFamily: 'OpenSans',
              fontSize: 16.0,
              color: Colors.black,
            ),
            softWrap: false,
            overflow: TextOverflow.fade,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.location_pin,
                color: Colors.black,
                size: 20.0,
              ),
              Text(
                _userData['location'] as String,
                style: const TextStyle(
                  fontSize: 12.0,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ],
      ),
      appBarTrailing:
          // TODO: show the user profile image in here and navigate to profile on click
          RoundedProfileImageContainer(
        // profileImg: AssetImage('assets/icons/user_female.png'),
        // width: getProportionateScreenWidth(65),
        onTap: () => print('Navigate to profie!'),
      ),
      decoration: const BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF107AD6), Color(0xFF083D6B)],
        ),
      ),
      leftScaffold: MenuScaffold(
        header: header.DrawerHeader(),
        children: NavigationTabs(),
        footer: DrawerFooter(),
      ),
      enableFade: false,
      child: home,
    );
  }
}
