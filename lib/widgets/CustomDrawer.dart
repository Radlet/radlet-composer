import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: SafeArea(
      child: Container(
        decoration: BoxDecoration(
            border: Border(right: BorderSide(width: 1.0, color: Colors.white))),
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: null,
              decoration: BoxDecoration(
                color: Colors.black38,
              ),
            ),
            ListTile(
              leading: Padding(
                padding: EdgeInsets.only(left: 40),
                child: Icon(Icons.search),
              ),
              title: Text(
                "Discover Devices",
                style: TextStyle(fontSize: 16),
              ),
              onTap: () => Navigator.of(context).popAndPushNamed('/discovery'),
            ),
            ListTile(
              leading: Padding(
                padding: EdgeInsets.only(left: 40),
                child: Icon(Icons.tune),
              ),
              title: Text(
                "Configure Node",
                style: TextStyle(fontSize: 16),
              ),
              onTap: () => {},
            ),
            ListTile(
              leading: Padding(
                padding: EdgeInsets.only(left: 40),
                child: Icon(Icons.settings),
              ),
              title: Text(
                "Settings",
                style: TextStyle(fontSize: 16),
              ),
              onTap: () => Navigator.of(context).popAndPushNamed('/settings'),
            )
          ],
        ),
      ),
    ));
  }
}
