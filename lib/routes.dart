import 'package:flutter/material.dart';
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
        theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.lightBlue[800],
          accentColor: Colors.cyan[600],

          // Define the default font family.
          fontFamily: 'Georgia',

          // Define the default TextTheme. Use this to specify the default
          // text styling for headlines, titles, bodies of text, and more.
          textTheme: TextTheme(
            headline: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
            title: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
            body1: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
          ),
        ),
        initialRoute: '/',
        routes: routes));
  }
}
