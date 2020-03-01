import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: SafeArea(
      child: Container(
        color: Colors.grey[750],
        decoration: BoxDecoration(
            border: Border(right: BorderSide(width: 1.0, color: Colors.white))),
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    
                  ],
                ),
                decoration: BoxDecoration(
                  image: DecorationImage(
                      colorFilter: ColorFilter.mode(Colors.black54, BlendMode.dstATop),
                      image: AssetImage('assets/images/drawer_background.png'),
                      fit: BoxFit.cover),
                )),
            ListTile(
              leading: Padding(
                padding: EdgeInsets.only(left: 40),
                child: Icon(Icons.search),
              ),
              title: Text(
                "Discover Nodes",
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
            Divider(),
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
