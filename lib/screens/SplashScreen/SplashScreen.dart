import 'package:flutter/material.dart';
import './widgets/IconContainer.dart';
import './widgets/NetAnimation.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          new Container(
            decoration: BoxDecoration(color: Colors.black38),
          ),
          new Container(
            alignment: Alignment.center,
            child: new NetAnimation(),
          ),
          new Container(
            alignment: Alignment.center,
            child: new IconContainer(),
          ),
        ],
      ),
    );
  }
}
