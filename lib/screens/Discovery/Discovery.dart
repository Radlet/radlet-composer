import 'package:flutter/material.dart';
import './widgets/DeviceListItem.dart';

class Discovery extends StatefulWidget {
  const Discovery({
    Key key,
    this.placeholder = "No device found",
    this.child,
  }) : super(key: key);

  final String placeholder;
  final Widget child;

  @override
  State createState() => new DiscoveryState();
}

class DiscoveryState extends State<Discovery> {
  List<Map<String, String>> devices;

  @override
  void initState() {
    devices = new List<Map<String, String>>();
    devices.add({"id": "A"});
    devices.add({"id": "B"});
    devices.add({"id": "C"});
    super.initState();
  }

  void updateDeviceList(List<Map<String, String>> newDeviceList) {
    // TODO: Add a compasion mechanism
    setState(() {
      devices = newDeviceList;
    });
  }

  void clearDeviceList() {
    setState(() {
      devices = [];
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("New devices"),
      ),
      body: Center(
          child: new ListView.builder(
              itemCount: devices.length,
              itemBuilder: (BuildContext context, int index) {
                return new DeviceListItem(deviceID: devices[index]["id"]);
              })),
    );
  }
}
