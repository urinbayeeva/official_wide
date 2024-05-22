// To parse this JSON data, do
//

import 'dart:convert';

RegistrationModel registrationModelFromJson(String str) =>
    RegistrationModel.fromJson(json.decode(str));

String registrationModelToJson(RegistrationModel data) =>
    json.encode(data.toJson());

class RegistrationModel {
  final String userName;
  final String? password;
  final String phone;

  RegistrationModel({
    required this.userName,
    required this.phone,
    required this.password,
  });

  // Add this copyWith method
  RegistrationModel copyWith({
    String? userName,
    String? phone,
    String? password,
  }) {
    return RegistrationModel(
      userName: userName ?? this.userName,
      phone: phone ?? this.phone,
      password: password ?? this.password,
    );
  }

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
