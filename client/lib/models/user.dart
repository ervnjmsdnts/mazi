// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    required this.id,
    required this.email,
    required this.isActive,
    required this.isSuperuser,
    required this.isVerified,
    required this.hashedPassword,
    required this.firstName,
    required this.lastName,
    required this.gender,
    required this.avatar,
    required this.interest,
    required this.interests,
  });

  String id;
  String email;
  bool isActive;
  bool isSuperuser;
  bool isVerified;
  String hashedPassword;
  String firstName;
  String lastName;
  String gender;
  dynamic avatar;
  dynamic interest;
  List<String> interests;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    email: json["email"],
    isActive: json["is_active"],
    isSuperuser: json["is_superuser"],
    isVerified: json["is_verified"],
    hashedPassword: json["hashed_password"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    gender: json["gender"],
    avatar: json["avatar"],
    interest: json["interest"],
    interests: List<String>.from(json["interests"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "email": email,
    "is_active": isActive,
    "is_superuser": isSuperuser,
    "is_verified": isVerified,
    "hashed_password": hashedPassword,
    "firstName": firstName,
    "lastName": lastName,
    "gender": gender,
    "avatar": avatar,
    "interest": interest,
    "interests": List<dynamic>.from(interests.map((x) => x)),
  };
}
