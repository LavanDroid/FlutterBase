// To parse this JSON data, do
//
//     final authToken = authTokenFromJson(jsonString);

import 'dart:convert';

AuthTokenResponse authTokenFromJson(String str) =>
    AuthTokenResponse.fromJson(json.decode(str));

String authTokenToJson(AuthTokenResponse data) => json.encode(data.toJson());

class AuthTokenResponse {
  AuthTokenResponse({
    this.refresh,
    this.access,
  });

  final String? refresh;
  final String? access;

  factory AuthTokenResponse.fromJson(Map<String, dynamic> json) =>
      AuthTokenResponse(
        refresh: json["refresh"],
        access: json["access"],
      );

  Map<String, dynamic> toJson() => {
        "refresh": refresh,
        "access": access,
      };
}
