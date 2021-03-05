import 'package:flutter/material.dart';

class AppDrawerFooter extends StatelessWidget {
  const AppDrawerFooter({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              onTap: () => print('Settings'),
              child: Row(
                children: [
                  Icon(
                    Icons.settings,
                    color: Colors.white,
                    size: 25.0,
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                  Text(
                    'Settings',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.0,
                    ),
                  ),
                ],
              ),
            ),
            VerticalDivider(
              indent: 5.0,
              endIndent: 5.0,
              color: Colors.white,
            ),
            GestureDetector(
              onTap: () => print('Log out'),
              child: Text('Log out',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.0,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
