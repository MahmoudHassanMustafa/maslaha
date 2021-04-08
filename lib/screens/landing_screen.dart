import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../shared/constants.dart';
import '../screens/splash/splash_screen.dart';
import '../screens/welcome_screen.dart';

//  Landing screen of the App logo and name to be shown,
//  while the necessary processes are being loaded in the background

class LandingScreen extends StatefulWidget {
  static String routeName = "/landing";

  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  late bool _isSplash;

  List<Future<dynamic>> _svgs = [
    precachePicture(
      ExactAssetPicture(SvgPicture.svgStringDecoder,
          'assets/images/splash_images/find_your_service.svg'),
      null,
    ),
    precachePicture(
      ExactAssetPicture(SvgPicture.svgStringDecoder,
          'assets/images/splash_images/full_time_support.svg'),
      null,
    ),
    precachePicture(
      ExactAssetPicture(SvgPicture.svgStringDecoder,
          'assets/images/splash_images/virtual_workshops.svg'),
      null,
    ),
    precachePicture(
      ExactAssetPicture(SvgPicture.svgStringDecoder,
          'assets/images/splash_images/online_payment.svg'),
      null,
    ),
    precachePicture(
        ExactAssetPicture(SvgPicture.svgStringDecoder,
            'assets/images/splash_images/welcome.svg'),
        null),
  ];

  Future _prepareNextScreen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _isSplash = (prefs.getBool('isSplashSeen') ?? false);
    });
    return _isSplash ? Future.wait(_svgs) : Future.wait([_svgs.last]);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _prepareNextScreen(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (_isSplash)
            return WelcomeScreen();
          else
            return SplashScreen();
        } else {
          return Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //  App logo should be here
                  Image.asset('assets/icons/logo.png'),
                  SizedBox(height: 30.0),
                  //  App name
                  Text(
                    "Msl7a.com",
                    style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
