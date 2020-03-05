import 'dart:convert';

import 'helper.dart' as helper;
import 'urls.dart' as urls;
import 'package:radlet_composer/util/data/Device.dart';

Future<List<Device>> getDiscoveredList(
    [Map<String, String> data = const {}]) async {
  try {
    var response = await helper.makeGetRequest(urls.DISCOVERY_ENDPOINT, data);
    if (response.statusCode != 200) {
      return Future.error("Server Error $response.statusCode");
    }

    var parsedJson = jsonDecode(response.body);

    List<Device> devices = new List<Device>();
    if (parsedJson["devices"] is List) {
      for (var item in parsedJson["devices"]) {
        devices.add(new Device(
            item["id"], item["type"], item["title"], item["description"], item["attached"].toLowerCase() == "true"));
      }
    }
    return devices;
  } catch (error) {
    return Future.error("Dock Unreachable");
  }
}

Future<void> postAttachDevice(
    [Map<String, String> data = const {}]) async {
  try {
    var response = await helper.makePostRequest(urls.NODE_ATTACH_ENDPOINT, data);
    if (response.statusCode != 200) {
      return Future.error("Server Error $response.statusCode");
    }

    return;
  } catch (error) {
    return Future.error("Dock Unreachable");
  }
}

Future<void> postDetachDevice(
    [Map<String, String> data = const {}]) async {
  try {
    var response = await helper.makePostRequest(urls.NODE_DETACH_ENDPOINT, data);
    if (response.statusCode != 200) {
      return Future.error("Server Error $response.statusCode");
    }

    return;
  } catch (error) {
    return Future.error("Dock Unreachable");
  }
}
