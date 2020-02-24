import 'dart:async';

import 'package:flutter/material.dart';
import './widgets/IconContainer.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({
    Key key,
    this.child,
  }) : super(key: key);

  final Widget child;

  @override
  State<StatefulWidget> createState() {
    return new _SplashScreenState();
  }
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation _animation;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 3));
    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller);
    super.initState();

    startTime();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  startTime() async {
    return new Timer(new Duration(seconds: 4), ( ) => Navigator.of(context).pushReplacementNamed('/home'));
  }

  @override
  Widget build(BuildContext context) {
    _controller.forward();
    return Scaffold(
      body: Stack(
        children: <Widget>[
          new Container(
            decoration: BoxDecoration(color: Colors.black38),
          ),
          new Container(
              alignment: Alignment.center,
              child: FadeTransition(
                opacity: _animation,
                child: new IconContainer(),
              )),
        ],
      ),
    );
  }
}
