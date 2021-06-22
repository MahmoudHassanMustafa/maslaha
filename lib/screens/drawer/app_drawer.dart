import 'package:flutter/material.dart';
import 'package:reside_menu/reside_menu.dart';

import '../../utils/size_config.dart';
import '../../widgets/profile_image_container.dart';
import 'components/drawer_footer.dart';
import 'components/drawer_header.dart' as header;
import 'components/navigation_tabs.dart';

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
          ProfileImageContainer(
        width: getProportionateScreenWidth(55),
        profileImg: NetworkImage(
            'https://scontent.fcai19-3.fna.fbcdn.net/v/t1.6435-9/30594925_2043671465890477_2859440508139208704_n.jpg?_nc_cat=106&ccb=1-3&_nc_sid=84a396&_nc_ohc=557dyAc3XgsAX_EZLAJ&_nc_ht=scontent.fcai19-3.fna&oh=446ffd3f39155560df5a1de238000254&oe=60C8F3AF'),
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
