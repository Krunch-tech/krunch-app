import 'dart:convert';

SignUpRequestModel signUpRequestModelFromJson(String str) =>
    SignUpRequestModel.fromJson(json.decode(str));

String signUpRequestModelToJson(SignUpRequestModel data) =>
    json.encode(data.toJson());

class SignUpRequestModel {
  SignUpRequestModel({
    required this.name,
    required this.email,
    required this.password,
  });

  String? name;
  String? email;
  String? password;

  factory SignUpRequestModel.fromJson(Map<String, dynamic> json) =>
      SignUpRequestModel(
        name: json["name"],
        email: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "password": password,
      };
}

SignUpResponseModel signUpResponseModelFromJson(String str) =>
    SignUpResponseModel.fromJson(json.decode(str));

String signUpResponseModelToJson(SignUpResponseModel data) =>
    json.encode(data.toJson());

class SignUpResponseModel {
  SignUpResponseModel({
    required this.success,
    this.error,
    this.token,
    this.authtype,
  });

  bool success;
  String? error;
  String? token;
  String? authtype;

  factory SignUpResponseModel.fromJson(Map<String, dynamic> json) =>
      SignUpResponseModel(
        success: json["success"],
        error: json["error"],
        token: json["token"],
        authtype: json["authtype"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "error": error,
        "token": token,
        "authtype": authtype,
      };
}
