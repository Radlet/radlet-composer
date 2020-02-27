import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  CustomIcon({this.size = 400});

  final double size;
  
  @override
  Widget build(BuildContext context) {
    return Image.asset('assets/icons/logo.png', height: size, width: size,);
  }
}
