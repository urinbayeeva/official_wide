import 'dart:convert';
import 'package:http/http.dart';

class NetworkService {
  static const String baseUrl = "http://95.47.238.47:5000/api-client/Login";
  static const String apiPostData = "/Registration";
  static const String apiGetData = "/CheckUser";

  static Map<String, String> headers = {
    "Content-Type": "application/json",
  };

  static Future<String> GET(String api) async {
    Uri url = Uri.parse(baseUrl + api);
    Response response = await get(url);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.body;
    } else {
      return "Error statusCode of ${response.statusCode}";
    }
  }

  static Future<String> POST(String api, Map<String, dynamic> body) async {
    Uri url = Uri.parse(baseUrl + api);
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
    Uri url = Uri.parse(baseUrl + api + id);
    Response response =
        await put(url, headers: headers, body: jsonEncode(body));
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.statusCode.toString();
    } else {
      return "Error statusCode of ${response.statusCode}";
    }
  }

  static Future<String> DELETE(String api, int id) async {
    Uri url = Uri.parse(baseUrl + api + id.toString());
    Response response = await delete(url);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.statusCode.toString();
    } else {
      return "Error statusCode of ${response.statusCode}";
    }
  }

  static Future<bool> checkUserExists(String username) async {
    try {
      Uri url = Uri.parse(baseUrl + apiGetData);
      Response response = await get(url, headers: headers);
      if (response.statusCode == 200) {
        List<dynamic> users = jsonDecode(response.body);
        // Check if the username exists in the list of users
        bool userExists = users.contains(username);
        return userExists;
      } else {
        // Throw an exception with a specific error message
        throw Exception(
            'Failed to fetch user data. Status code: ${response.statusCode}');
      }
    } catch (e) {
      // Log the error and return false to indicate failure
      print('Error: $e');
      return false;
    }
  }
}
