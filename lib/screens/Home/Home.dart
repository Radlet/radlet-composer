import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        onPressed: () => Navigator.of(context).pushNamed('/discovery'),
        child: const Text('New Device'));
  }
}
