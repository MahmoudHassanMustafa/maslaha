import 'package:flutter/material.dart';
import 'package:maslaha/utils/size_config.dart';

class DrawerFooter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: getProportionateScreenHeight(65),
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            // TODO: open settings on click
            onTap: () => print('Settings'),
            child: Row(
              children: [
                const Icon(
                  Icons.settings,
                  color: Colors.white,
                  size: 25.0,
                ),
                const SizedBox(width: 6),
                const Text(
                  'Settings',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14.0,
                  ),
                ),
              ],
            ),
          ),
          const VerticalDivider(
            indent: 5.0,
            endIndent: 5.0,
            color: Colors.white,
          ),
          GestureDetector(
            // TODO: log out on click
            onTap: () => print('Log out'),
            child: Row(
              children: [
                const Icon(
                  Icons.logout,
                  color: Colors.white,
                  size: 20,
                ),
                const SizedBox(width: 6),
                const Text(
                  'Log out',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14.0,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
