import 'package:flutter/material.dart';

ThemeData customTheme(){
  TextTheme _customTextTheme( TextTheme base ){
    return base.copyWith(
      headline: base.headline.copyWith(
        fontFamily: 'Roboto',
        fontSize: 22.0,
        color: Colors.white70
      )
    );
  }

  // AppBarTheme _customAppBarTheme( AppBarTheme base ){
  //   return base.copyWith(

  //   );
  // }

  final ThemeData base = ThemeData.dark();

  return base.copyWith(
    textTheme: _customTextTheme(base.textTheme),
    primaryColor: Colors.grey[850],
    primaryColorBrightness: Brightness.dark,
    accentColor: Colors.cyan[600],
    accentColorBrightness: Brightness.dark,
    // appBarTheme: _customAppBarTheme(base.appBarTheme),
    applyElevationOverlayColor: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.black87,
    cardColor: Colors.grey[850],
    dividerColor: Colors.white38
  );
}