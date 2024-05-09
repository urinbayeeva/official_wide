// auth_service.dart

import 'package:http/http.dart' as http;
import 'package:wide/data/entity/auth_model/registration_model.dart';

class AuthService {
  static const baseUrl = "http://95.47.238.47:5000/api-client/Login";
  static String apiGetRegistrationData = "/Registration";

  static Map<String, String> headers = {
    "Content-type": "application/json",
  };

  // Method to register user
  static Future<String?> register(RegistrationModel registrationData) async {
    Uri url = Uri.http(baseUrl, apiGetRegistrationData);
    http.Response response = await http.post(
      url,
      headers: headers,
      body: registrationData.toRawJson(), // Serialize RegistrationModel to JSON
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      return null; // Registration successful
    } else {
      return response.reasonPhrase; // Registration failed
    }
  }
}
