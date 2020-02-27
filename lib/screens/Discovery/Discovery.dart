import 'dart:async';
import 'package:flutter/material.dart';

import 'package:radlet_composer/util/apis/discovery.dart';
import 'package:radlet_composer/util/data/Device.dart';
import 'widgets/DeviceListItem.dart';

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
  List<Device> _devices;
  var _timer;

  @override
  void initState() {
    _devices = new List<Device>();
    super.initState();

    _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      getDiscoveredList().then((fetchedDevices) {
        updateDeviceList(fetchedDevices);
      }).catchError((onError) {
        print(onError);
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void updateDeviceList(List<Device> newDeviceList) {
    // TODO: Add a compasion mechanism
    setState(() {
      _devices = newDeviceList;
    });
  }

  void clearDeviceList() {
    setState(() {
      _devices = [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("New Devices"),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          )),
      body: Center(
          child: new ListView.builder(
              itemCount: _devices.length,
              itemBuilder: (BuildContext context, int index) {
                return new DeviceListItem(
                  id: _devices[index].id,
                  type: _devices[index].type,
                  title: _devices[index].title,
                  description: _devices[index].description,
                );
              })),
    );
  }
}
