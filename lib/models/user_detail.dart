// To parse this JSON data, do
//
//     final userDetail = userDetailFromJson(jsonString);

import 'dart:convert';

UserDetail userDetailFromJson(String str) =>
    UserDetail.fromJson(json.decode(str));

String userDetailToJson(UserDetail data) => json.encode(data.toJson());

class UserDetail {
  UserDetail({
    this.token,
    this.user,
  });

  Token? token;
  User? user;

  factory UserDetail.fromJson(Map<String, dynamic> json) => UserDetail(
        token: Token.fromJson(json["token"]),
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "token": token!.toJson(),
        "user": user!.toJson(),
      };
}

class Token {
  Token(
      {this.token,
      this.refreshToken,
      this.expiration,
      this.refreshTokenExpiration,
      this.id});

  String? token;
  String? refreshToken;
  String? expiration;
  String? refreshTokenExpiration;
  String? id;

  factory Token.fromJson(Map<String, dynamic> json) => Token(
        token: json["Token"],
        refreshToken: json["RefreshToken"],
        expiration: json["Expiration"],
        refreshTokenExpiration: json["RefreshTokenExpiration"],
        id: json["Id"],
      );

  Map<String, dynamic> toJson() => {
        "Token": token,
        "RefreshToken": refreshToken,
        "Expiration": expiration,
        "RefreshTokenExpiration": refreshTokenExpiration,
        "Id": id
      };
}

class User {
  User(
      {this.id,
      this.firstName = "",
      this.lastName = "",
      this.email = "",
      this.profileUrl,
      this.profileImageData});

  String? id;
  String? firstName = "";
  String? lastName = "";
  String? email = "";
  String? profileUrl;
  String? profileImageData;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["Id"],
        firstName: json["FirstName"],
        lastName: json["LastName"],
        email: json["Email"],
        profileUrl: json["ProfileUrl"],
        profileImageData: json["ProfileImageData"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "FirstName": firstName,
        "LastName": lastName,
        "Email": email,
        "ProfileUrl": profileUrl,
        "ProfileImageData": profileImageData
      };
}
