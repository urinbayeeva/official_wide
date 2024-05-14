import 'dart:convert';

import 'package:http/http.dart';

class NetworkService {
  static const String baseUrl = "95.47.238.47:5000/api-client/Login";
  static const String apiPostData = "/Registration";

  static Map<String, String> headers = {
    "Content-Type": "application/json",
  };

  static Future<String> GET(String api) async {
    Uri url = Uri.https(baseUrl, api);
    Response response = await get(url);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.body;
    } else {
      return "Error statusCode of ${response.statusCode}";
    }
  }

  static Future<String> POST(String api, Map<String, dynamic> body) async {
    Uri url = Uri.https(baseUrl, api);
    Response response =
        await post(url, body: jsonEncode(body), headers: headers);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.body;
    } else {
      return "Error statusCode of ${response.statusCode}";
    }
  }

  static Future<String> PUT(
      String api, Map<String, dynamic> body, String id) async {
    Uri url = Uri.https(baseUrl, api + id);
    Response response =
        await put(url, headers: headers, body: jsonEncode(body));
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.statusCode.toString();
    } else {
      return "Error statusCode of ${response.statusCode}";
    }
  }

  static Future<String> DELETE(String api, int id) async {
    Uri url = Uri.https(baseUrl, api + id.toString());
    Response response = await delete(url);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.statusCode.toString();
    } else {
      return "Error statusCode of ${response.statusCode}";
    }
  }
}
