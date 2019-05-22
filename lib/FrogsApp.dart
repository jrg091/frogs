import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:frogs/src/ui/Splash.dart';
import 'package:frogs/src/ui/Login.dart';
import 'package:frogs/src/ui/Whiteboard.dart';

class FrogsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown
    ]);

    return MaterialApp(
      theme: ThemeData.light(),
      initialRoute: Splash.ROUTE,
      routes: {
        Splash.ROUTE: (context) => Splash(),
        Login.ROUTE: (context) => Login(),
        Whiteboard.ROUTE: (context) => Whiteboard()
      },
    );
  }
}
