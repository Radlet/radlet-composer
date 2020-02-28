import 'dart:async';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:radlet_composer/util/auth/googleAuth.dart' as auth;
import 'package:radlet_composer/widgets/CustomIcon.dart';
import 'package:radlet_composer/widgets/SignInButton.dart';

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
  bool loading = true;
  bool isSignInActive = false;
  FirebaseUser userData;

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

  void _showSignIn() {
    setState(() {
      loading = false;
      isSignInActive = true;
    });
  }

  void _signInSuccess(FirebaseUser user) {
    print(user);
    print("Sign in successful");

    setState(() {
      loading = false;
    });
    Navigator.of(context).pushReplacementNamed('/home');
  }

  startTime() async {
    return new Timer(new Duration(seconds: 3), () {
      auth.isSignedIn().then((FirebaseUser user) {
        if (user == null) {
          _showSignIn();
        } else {
          print(user);
          print("Already Signed in");
          Navigator.of(context).pushReplacementNamed('/home');
        }
      });
    });
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
                child: new CustomIcon(size: 200),
              )),
          new Container(
            alignment: Alignment.bottomCenter,
            child: loading
                ? Text(
                    "Loading...",
                    style: TextStyle(fontSize: 16),
                  )
                : new SignInButton(onSignInSuccess: _signInSuccess),
            padding: EdgeInsets.only(bottom: 64.0),
          )
        ],
      ),
    );
  }
}
