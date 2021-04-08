import 'package:flutter/widgets.dart';

import '../screens/authenticaton/create_new_password_screen.dart';
import '../screens/authenticaton/forget_password_screen.dart';
import '../screens/authenticaton/login_screen.dart';
import '../screens/authenticaton/register_screen_1.dart';
import '../screens/authenticaton/register_screen_2.dart';
import '../screens/authenticaton/verify_your_email_screen.dart';
import '../screens/home/home_screen.dart';
import '../screens/landing_screen.dart';
import '../screens/splash/splash_screen.dart';
import '../screens/welcome_screen.dart';

//  All routes will be avilable here
//  named routes are used

final Map<String, WidgetBuilder> routes = {
  LandingScreen.routeName: (context) => LandingScreen(),
  SplashScreen.routeName: (context) => SplashScreen(),
  WelcomeScreen.routeName: (context) => WelcomeScreen(),
  RegisterScreen1.routeName: (context) => RegisterScreen1(),
  RegisterScreen2.routeName: (context) => RegisterScreen2(),
  LoginScreen.routeName: (context) => LoginScreen(),
  ForgetPasswordScreen.routeName: (context) => ForgetPasswordScreen(),
  VerifyYourEmailScreen.routeName: (context) => VerifyYourEmailScreen(),
  CreateNewPasswordScreen.routeName: (context) => CreateNewPasswordScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
};
