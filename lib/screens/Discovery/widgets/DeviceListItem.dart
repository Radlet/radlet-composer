import 'package:flutter/material.dart';

class DeviceListItem extends StatelessWidget {
  DeviceListItem({this.id, this.type, this.title, this.description});

  final String id;
  final String type;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: InkWell(
          onTap: () {
            print("Your card has been tapped");
          },
          child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
            ListTile(
                leading: Icon(Icons.album),
                title: Text(this.title),
                subtitle: Text(this.description))
          ]),
        ),
      ),
    );
  }
}
