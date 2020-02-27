import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lattice_remote/widgets/CustomDrawer.dart';
import './widgets/DeviceListItem.dart';
import '../../util/apis/discovery.dart';
import '../../util/data/Device.dart';

class Discovery extends StatefulWidget {
  const Discovery({
    Key key,
    this.child,
  }) : super(key: key);

  final Widget child;

  @override
  State createState() {
    return new _DiscoveryState();
  }
}

class _DiscoveryState extends State<Discovery> {
  List<Device> devices;
  var timer;

  @override
  void initState() {
    devices = new List<Device>();
    super.initState();

    timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      getDiscoveredList().then((fetchedDevices) {
        updateDeviceList(fetchedDevices);
      }).catchError((onError) {
        print("Error fetching device list");
      });
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  void updateDeviceList(List<Device> newDeviceList) {
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
      drawer: new CustomDrawer(),
      appBar: AppBar(
        title: const Text("New devices"),
      ),
      body: Center(
          child: new ListView.builder(
              itemCount: devices.length,
              itemBuilder: (BuildContext context, int index) {
                return new DeviceListItem(
                  id: devices[index].id,
                  type: devices[index].type,
                  title: devices[index].title,
                  description: devices[index].description,
                );
              })),
    );
  }
}
