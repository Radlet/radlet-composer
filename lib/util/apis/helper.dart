import 'package:http/http.dart' as http;

Future makePostRequest(String url, Map<String, String> data) {
  return http.post(url, body: data);
}
