import 'dart:convert';
import 'package:http/http.dart';

class NetworkService {
  // ignore: constant_identifier_names
  static const BASEURL = 'http://95.47.238.47:5000';

  static String apiPostRegistration = '/api-client/Login/Registration';

  // headers
  static Map<String, String>? headers = {
    'Content-Type': 'application/json',
  };

  //methods
  static Future<String> GET(String api) async {
    final url = Uri.https(BASEURL, api);
    Response response = await get(url, headers: headers);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.body;
    } else {
      return '\nError occurred on Status Code ${response.statusCode}\n';
    }
  }

  static Future<String?> POST(String api, Map<String, dynamic> body) async {
    Uri url = Uri.https(BASEURL, api);
    Response response =
        await post(url, headers: headers, body: jsonEncode(body));
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.body;
    }
    return response.reasonPhrase;
  }

  static Future<String?> PUT(
      String api, Map<String, dynamic> body, String id) async {
    final url = Uri.https(BASEURL, "$api$id");
    final response = await put(url, body: jsonEncode(body), headers: headers);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.body;
    }
    return null;
  }

  static Future<String?> DELETE(String api, int id) async {
    final url = Uri.https(BASEURL, "$api${id.toString()}");
    final response = await delete(url, headers: headers);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.body;
    }
    return null;
  }

  /// params
  static Map<String, String> emptyParams() => <String, String>{};

  /// body
  static Map<String, dynamic> bodyEmpty() => <String, dynamic>{};
}
