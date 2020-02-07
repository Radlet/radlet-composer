import 'package:flutter/material.dart';

class DeviceListItem extends StatelessWidget {
  DeviceListItem({this.deviceID});

  final String deviceID;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      color: Colors.amber[100],
      child: Center(child: new Text(deviceID)),
    );
  }
}
