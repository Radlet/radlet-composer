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

  final ThemeData base = ThemeData.dark();

  return base.copyWith(
    textTheme: _customTextTheme(base.textTheme),
    primaryColor: Colors.grey[850],
  );
}