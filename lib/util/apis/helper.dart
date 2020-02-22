import 'package:http/http.dart' as http;
import './urls.dart';

Future makePostRequest(String endpoint, Map<String, String> data) {
  return http.post(new Uri.http(SERVER_URL,endpoint), body: data);
}

Future makeGetRequest(String endpoint, Map<String, String> data) {
  return http.get(new Uri.http(SERVER_URL,endpoint));
  // TODO: catch connection failed exception
}
