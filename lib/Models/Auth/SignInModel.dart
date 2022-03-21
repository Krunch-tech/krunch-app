// To parse this JSON data, do
//
//     final signInRequestModel = signInRequestModelFromJson(jsonString);

import 'dart:convert';

SignInRequestModel signInRequestModelFromJson(String str) =>
    SignInRequestModel.fromJson(json.decode(str));

String signInRequestModelToJson(SignInRequestModel data) =>
    json.encode(data.toJson());

class SignInRequestModel {
  SignInRequestModel({
    required this.email,
    required this.password,
  });

  String? email;
  String? password;

  factory SignInRequestModel.fromJson(Map<String, dynamic> json) =>
      SignInRequestModel(
        email: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
      };
}

SignInResponseModel signInResponseModelFromJson(String str) =>
    SignInResponseModel.fromJson(json.decode(str));

String signInResponseModelToJson(SignInResponseModel data) =>
    json.encode(data.toJson());

class SignInResponseModel {
  SignInResponseModel({
    required this.success,
    this.error,
    this.token,
    this.authtype,
  });

  bool success;
  String? error;
  String? token;
  String? authtype;

  factory SignInResponseModel.fromJson(Map<String, dynamic> json) =>
      SignInResponseModel(
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
