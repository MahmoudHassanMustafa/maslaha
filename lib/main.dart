import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'providers/filters.dart';
import 'providers/search_result.dart';
import 'package:provider/provider.dart';

import 'providers/conversations.dart';
import 'providers/messages.dart';
import 'routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(MaslahaApp());
}

class MaslahaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Conversations(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Messages(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => SearchResult(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Filters(),
        ),
      ],
      child: MaterialApp(
        title: 'Masla7a',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
          scaffoldBackgroundColor: Colors.white,
          fontFamily: 'Quicksand',
        ),
        routes: routes,
      ),
    );
  }
}
