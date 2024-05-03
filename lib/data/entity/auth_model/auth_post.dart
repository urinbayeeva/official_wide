import 'dart:convert';

class AuthPost {
  String userName;
  String password;
  String phone;

  AuthPost({
    required this.userName,
    required this.password,
    required this.phone,
  });

  factory AuthPost.fromRawJson(String str) =>
      AuthPost.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AuthPost.fromJson(Map<String, dynamic> json) => AuthPost(
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
