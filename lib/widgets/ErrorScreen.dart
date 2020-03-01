import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  ErrorScreen(this.errorIcon, this.errorMessage);

  final String errorMessage;
  final IconData errorIcon;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Icon(errorIcon),
        Padding(
          padding: EdgeInsets.only(left: 12),
        ),
        Text(errorMessage)
      ],
    );
  }
}
