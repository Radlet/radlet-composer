import 'package:flutter/material.dart';

import 'package:radlet_composer/widgets/CustomDrawer.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      drawer: CustomDrawer(),
      body: Container(
          // decoration: BoxDecoration(
          //   image: DecorationImage(
          //     image: AssetImage("assets/images/bulb.jpg"),
          //     fit: BoxFit.cover,
          //   ),
          // ),
          child: null),
    );
  }
}
