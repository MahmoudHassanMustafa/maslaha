import 'package:maslaha/screens/authenticaton/create_new_password_screen.dart';
import 'package:maslaha/screens/authenticaton/forget_password_screen.dart';
import 'package:maslaha/screens/authenticaton/login_screen.dart';
import 'package:maslaha/screens/authenticaton/register_screen_1.dart';
import 'package:maslaha/screens/authenticaton/register_screen_2.dart';
import 'package:maslaha/screens/authenticaton/verify_your_email_screen.dart';
import 'package:maslaha/screens/home/home_screen.dart';
import 'package:maslaha/screens/landing_screen.dart';
import 'package:maslaha/screens/splash/splash_screen.dart';
import 'package:maslaha/screens/welcome_screen.dart';
import 'package:flutter/widgets.dart';

//  All routes will be avilable here
//  named routes are used

final Map<String, WidgetBuilder> routes = {
  LandingScreen.routeName: (context) => LandingScreen(),
  SplashScreen.routeName: (context) => SplashScreen(),
  LoginScreen.routeName: (context) => LoginScreen(),
  WelcomeScreen.routeName: (context) => WelcomeScreen(),
  RegisterScreen1.routeName: (context) => RegisterScreen1(),
  RegisterScreen2.routeName: (context) => RegisterScreen2(),
  ForgetPasswordScreen.routeName: (context) => ForgetPasswordScreen(),
  VerifyYourEmailScreen.routeName: (context) => VerifyYourEmailScreen(),
  CreateNewPasswordScreen.routeName: (context) => CreateNewPasswordScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
};
