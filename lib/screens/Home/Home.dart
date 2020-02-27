import 'package:flutter/material.dart';

import '../../widgets/CustomDrawer.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: new CustomDrawer(),
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
