import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import './routes.dart';
import './providers/conversations.dart';
import './providers/messages.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
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
