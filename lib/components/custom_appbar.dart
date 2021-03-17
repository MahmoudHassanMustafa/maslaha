import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget with PreferredSizeWidget {
  final AnimationController? menuButtonAnimationController;
  final Function()? onMenuButtonPressed;

  CustomAppBar({
    this.menuButtonAnimationController,
    this.onMenuButtonPressed,
  });

  @override
  _CustomAppBarState createState() => _CustomAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(80);
}

class _CustomAppBarState extends State<CustomAppBar> {
  final String _username = 'Mahmoud Hassan';
  final String _location = 'Egypt, Port-Said';
  final String _profileImagePath = '';

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      flexibleSpace: Container(
        margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              child: AnimatedIcon(
                icon: AnimatedIcons.menu_arrow,
                progress: widget.menuButtonAnimationController!,
                color: Colors.black,
                size: 35.0,
              ),
              onTap: () {
                widget.onMenuButtonPressed!();
              },
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  _username,
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
                      _location,
                      style: TextStyle(
                        fontSize: 12.0,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            GestureDetector(
              child: CircleAvatar(
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
              onTap: () => print('Navigate to profie!'),
            ),
          ],
        ),
      ),
    );
  }
}
