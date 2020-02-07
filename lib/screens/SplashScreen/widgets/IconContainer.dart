import 'package:flutter/material.dart';

class IconContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return Image(image: AssetImage('assets/icons/splash.svg'));
    return CircleAvatar(
      backgroundColor: Colors.blueGrey[900],
      radius: 52,
      backgroundImage: AssetImage('assets/icons/splash.png'),
    );
  }
}
