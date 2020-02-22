import 'package:flutter/material.dart';

class DeviceListItem extends StatelessWidget {
  DeviceListItem({this.deviceID, this.deviceName});

  final String deviceID;
  final String deviceName;

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
                title: Text(this.deviceName),
                subtitle: Text("Sample device description"))
          ]),
        ),
      ),
    );
  }
}
