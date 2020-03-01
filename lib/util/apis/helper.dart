import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'urls.dart';

Future makeGetRequest(String endpoint, Map<String, String> data) {
  return http.get(new Uri.http(SERVER_URL, endpoint));
}

Future makePostRequest(String endpoint, Map<String, String> data) {
  return http.post(new Uri.http(SERVER_URL, endpoint),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
      },
      body: jsonEncode(data));
}
