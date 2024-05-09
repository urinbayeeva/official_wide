import 'dart:convert';

class RegistrationModel {
  final String userName;
  final String password;
  final String phone;

  RegistrationModel({
    required this.userName,
    required this.password,
    required this.phone,
  });

  factory RegistrationModel.fromRawJson(String str) =>
      RegistrationModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RegistrationModel.fromJson(Map<String, dynamic> json) =>
      RegistrationModel(
        userName: json["userName"],
        password: json["password"],
        phone: json["phone"],
      );

  Map<String, dynamic> toJson() => {
        "userName": userName,
        "password": password,
        "phone": phone,
      };
}
