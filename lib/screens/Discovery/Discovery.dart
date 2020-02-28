import 'dart:async';
import 'package:flutter/material.dart';

import 'package:radlet_composer/util/apis/discovery.dart';
import 'package:radlet_composer/util/data/Device.dart';
import 'widgets/DeviceListItem.dart';
import 'widgets/FetchStatus.dart';

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
  FetchStatus _fetchStatus;

  @override
  void initState() {
    _devices = new List<Device>();
    _fetchStatus = FetchStatus.NONE;
    super.initState();

    _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      getDiscoveredList().then((fetchedDevices) {
        _updateDeviceList(fetchedDevices);
        _updateFetchStatus(FetchStatus.FETCHING);
      }).catchError((onError) {
        _updateFetchStatus(FetchStatus.CONNECTION_ERROR);
        print(onError);
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _updateFetchStatus(FetchStatus status) {
    setState(() {
      _fetchStatus = status;
    });
  }

  void _updateDeviceList(List<Device> newDeviceList) {
    // TODO: Add a compasion mechanism
    setState(() {
      _devices = newDeviceList;
    });
  }

  void _clearDeviceList() {
    setState(() {
      _devices = [];
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget _child;
    switch (_fetchStatus) {
      case FetchStatus.NONE:
        _child = Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.graphic_eq),
            Padding(
              padding: EdgeInsets.only(left: 12),
            ),
            Text("Searching")
          ],
        );
        break;
      case FetchStatus.FETCHING:
        _child = ListView.builder(
            itemCount: _devices.length,
            itemBuilder: (BuildContext context, int index) {
              return new DeviceListItem(
                id: _devices[index].id,
                type: _devices[index].type,
                title: _devices[index].title,
                description: _devices[index].description,
              );
            });
        break;
      case FetchStatus.CONNECTION_ERROR:
        _child = Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.signal_wifi_off),
            Padding(
              padding: EdgeInsets.only(left: 12),
            ),
            Text("Dock Broken")
          ],
        );
        break;
      default:
    }

    return Scaffold(
      appBar: AppBar(
          title: const Text("New Devices"),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          )),
      body: Center(child: _child),
    );
  }
}
