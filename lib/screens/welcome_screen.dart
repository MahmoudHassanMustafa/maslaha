import 'dart:async';

import 'package:flutter/material.dart';

import '../screens/authenticaton/login_screen.dart';
import '../screens/authenticaton/register_screen_1.dart';
import '../screens/home/home_screen.dart';
import '../screens/splash/components/splash_content.dart';
import '../shared/constants.dart';
import '../shared/size_config.dart';

class WelcomeScreen extends StatefulWidget {
  static String routeName = "/welcome_screen";

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with TickerProviderStateMixin {
  late final AnimationController _signUpNGuestAnimationController =
      AnimationController(vsync: this, duration: kAnimationDuration);

  late final AnimationController _signInAnimationController =
      AnimationController(vsync: this, duration: Duration(milliseconds: 300));

  late final Animation<Offset> _signUpOffset =
      Tween(begin: Offset(0.0, 3.0), end: Offset(0.0, 0.0))
          .animate(_signUpNGuestAnimationController);

  late final Animation<Offset> _signInOffset =
      Tween(begin: Offset(0.0, 2.0), end: Offset(0.0, 0.0))
          .animate(_signInAnimationController);

  late final Animation<Offset> _guestOffset =
      Tween(begin: Offset(0.0, -1.0), end: Offset(0.0, 0.0))
          .animate(_signUpNGuestAnimationController);

  @override
  void initState() {
    super.initState();

    //  wait the page transition for the buttons animations
    Timer(kAnimationDuration, () {
      _signUpNGuestAnimationController
          .forward()
          .whenComplete(() => _signInAnimationController.forward());
    });
  }

  @override
  void dispose() {
    _signUpNGuestAnimationController.dispose();
    _signInAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: SafeArea(
          child: Container(
            width: double.infinity,
            child: Column(
              children: [
                //  Join as guest button
                Align(
                  alignment: Alignment.topRight,
                  child: SlideTransition(
                    position: _guestOffset,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                      ),
                      onPressed: () async {
                        Navigator.pushNamed(context, HomeScreen.routeName);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Join as a guest',
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: getProportionateScreenWidth(16),
                                letterSpacing: 0.75,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(
                              width: 4.0,
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.black54,
                              size: 18.0,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                //  Page view
                Expanded(
                  flex: 3,
                  child: Stack(
                    children: [
                      //  Background circle
                      Center(
                        child: Container(
                          margin: EdgeInsets.only(
                              bottom: getProportionateScreenHeight(100)),
                          height: getProportionateScreenHeight(330),
                          decoration: BoxDecoration(
                            gradient: kPrimaryGradientColor,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                      //  Screen vector
                      SplashContent(
                        image: 'assets/images/splash_images/welcome.svg',
                        title: 'Welcome',
                        description:
                            'Lorem ipsum dolor sit amet, consect adipiscing elit, sed do eiusmod tempor et.',
                      ),
                    ],
                  ),
                ),
                //  Sign in & out buttons
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(20),
                    ),
                    child: Column(
                      children: [
                        Spacer(),
                        buildEntryButton(
                          label: 'Sign up',
                          onPress: () {
                            Navigator.pushNamed(
                                context, RegisterScreen1.routeName);
                          },
                          offset: _signUpOffset,
                        ),
                        buildEntryButton(
                          label: 'Sign in',
                          onPress: () {
                            Navigator.pushNamed(context, LoginScreen.routeName);
                          },
                          offset: _signInOffset,
                        ),
                        Spacer(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  SlideTransition buildEntryButton(
      {required String label,
      Function? onPress,
      required Animation<Offset> offset}) {
    return SlideTransition(
      position: offset,
      child: Container(
        width: double.infinity,
        child: TextButton(
          style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            padding: EdgeInsets.zero,
            backgroundColor: kPrimaryColor,
          ),
          onPressed: onPress as void Function()?,
          child: Text(
            label,
            style: TextStyle(
              color: Colors.white,
              fontSize: getProportionateScreenWidth(16),
              letterSpacing: 0.75,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
