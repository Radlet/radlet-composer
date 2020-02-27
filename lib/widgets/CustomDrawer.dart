import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
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
            leading: Icon(Icons.search),
            title: Text("Discover Devices"),
            onTap: () => Navigator.of(context).popAndPushNamed('/discovery'),
          )
        ],
      ),
    );
  }
}
