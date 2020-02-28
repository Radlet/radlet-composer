import 'package:flutter/material.dart';
import 'package:radlet_composer/util/theme/customTheme.dart';

import 'util/theme/customTheme.dart';
import 'screens/SplashScreen/index.dart';
import 'screens/Home/index.dart';
import 'screens/Discovery/index.dart';
import 'screens/Settings/index.dart';

class Routes {
  final routes = <String, WidgetBuilder>{
    '/': (BuildContext context) => new SplashScreen(),
    '/home': (BuildContext context) => new Home(),
    '/discovery': (BuildContext context) => new Discovery(),
    '/settings': (BuildContext context) => new Settings()
  };

  Routes() {
    runApp(new MaterialApp(
        title: 'Radlet Composer',
        theme: customTheme(),
        initialRoute: '/',
        routes: routes));
  }
}
