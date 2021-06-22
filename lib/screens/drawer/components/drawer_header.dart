import 'package:flutter/material.dart';

import '../../../utils/size_config.dart';
import '../../../widgets/profile_image_container.dart';

class DrawerHeader extends StatelessWidget {
  final String _username = 'Mahmoud Hassan Mustafa Kamal';
  final String _location = 'Egpyt, Port-Said';
  // final String _profileImagePath = '';

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // TODO: show the user profile image in here and navigate to profile on click
        ProfileImageContainer(
          profileImg: NetworkImage(
              'https://scontent.fcai19-3.fna.fbcdn.net/v/t1.6435-9/30594925_2043671465890477_2859440508139208704_n.jpg?_nc_cat=106&ccb=1-3&_nc_sid=84a396&_nc_ohc=557dyAc3XgsAX_EZLAJ&_nc_ht=scontent.fcai19-3.fna&oh=446ffd3f39155560df5a1de238000254&oe=60C8F3AF'),
          width: getProportionateScreenWidth(60),
          height: getProportionateScreenHeight(80),
          margin: const EdgeInsets.symmetric(horizontal: 8),
          onTap: () => print('Navigate to profie!'),
        ),
        Wrap(
          direction: Axis.vertical,
          children: [
            SizedBox(
              width: getProportionateScreenWidth(180),
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
        )
      ],
    );
  }
}
