import 'package:flutter/material.dart';

import './screens/landing_screen.dart';
import './screens/splash_screen/splash_screen.dart';
import './screens/welcome_screen.dart';
import './screens/authenticaton/register_screen_1.dart';
import './screens/authenticaton/register_screen_2.dart';
import 'screens/authenticaton/login_screen.dart';
import 'screens/authenticaton/forget_password_screen.dart';
import './screens/authenticaton/create_new_password_screen.dart';
import './screens/authenticaton/verify_your_email_screen.dart';
import './screens/home/home_screen.dart';
import './screens/chat/chat_screen.dart';
import './screens/chat/messages_screen.dart';
import './screens/chat/contact_info_screen.dart';

// //  All routes will be avilable here

final Map<String, WidgetBuilder> routes = {
  // Initial route
  '/': (context) => LandingScreen(),

  SplashScreen.routeName: (context) => SplashScreen(),
  WelcomeScreen.routeName: (context) => WelcomeScreen(),
  RegisterScreen1.routeName: (context) => RegisterScreen1(),
  RegisterScreen2.routeName: (context) => RegisterScreen2(),
  LoginScreen.routeName: (context) => LoginScreen(),
  ForgetPasswordScreen.routeName: (context) => ForgetPasswordScreen(),
  CreateNewPasswordScreen.routeName: (context) => CreateNewPasswordScreen(),
  VerifyYourEmailScreen.routeName: (context) => VerifyYourEmailScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  ChatScreen.routeName: (context) => ChatScreen(),
  MessagesScreen.routeName: (context) => MessagesScreen(),
  ContactInfoScreen.routeName: (context) => ContactInfoScreen(),
};
