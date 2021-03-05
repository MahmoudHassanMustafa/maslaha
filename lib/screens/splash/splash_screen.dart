import 'package:maslaha/screens/splash/components/slpash_body.dart';
import 'package:maslaha/shared/size_config.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  static String routeName = "/splash";

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    //  It has to be called at the starting screen
    SizeConfig().init(context);
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: SplashBody(),
      ),
    );
  }
}
