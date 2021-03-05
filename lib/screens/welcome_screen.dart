import 'package:maslaha/screens/authenticaton/login_screen.dart';
import 'package:maslaha/screens/authenticaton/register_screen_1.dart';
import 'package:maslaha/screens/home/home_screen.dart';
import 'package:maslaha/shared/constants.dart';
import 'package:maslaha/shared/size_config.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'splash/components/splash_content.dart';

class WelcomeScreen extends StatefulWidget {
  static String routeName = "/welcome_screen";

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with TickerProviderStateMixin {
  late AnimationController _signUpNGuestAnimationController;
  late AnimationController _signInAnimationController;

  late Animation<Offset> _signUpOffset;
  late Animation<Offset> _signInOffset;
  late Animation<Offset> _guestOffset;

  @override
  void initState() {
    super.initState();
    _signUpNGuestAnimationController =
        AnimationController(vsync: this, duration: kAnimationDuration);

    _signInAnimationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 400));

    _signUpOffset = Tween(begin: Offset(0.0, 1.0), end: Offset(0.0, 0.0))
        .animate(_signUpNGuestAnimationController);

    _guestOffset = Tween(begin: Offset(0.0, -1.0), end: Offset(0.0, 0.0))
        .animate(_signUpNGuestAnimationController);

    _signInOffset = Tween(begin: Offset(0.0, 2.0), end: Offset(0.0, 0.0))
        .animate(_signInAnimationController);

    //  wait the page transition for the buttons animations
    Timer(Duration(milliseconds: 500), () {
      _signUpNGuestAnimationController
          .forward()
          .whenComplete(() => _signInAnimationController.forward());
    });
  }

  @override
  void dispose() {
    super.dispose();
    _signUpNGuestAnimationController.dispose();
    _signInAnimationController.dispose();
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
