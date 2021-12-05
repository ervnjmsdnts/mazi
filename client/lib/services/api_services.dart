import 'dart:convert';

import "package:http/http.dart" as http;
import 'package:mazi/const/app_urls.dart';
import 'package:mazi/models/interest_model.dart';
import 'package:mazi/models/token_model.dart';
import 'package:mazi/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class APIServices {
  static var client = http.Client();

  static Future<String?> loginUserService(Map<String, dynamic> data) async {
    var response = await client.post(
      Uri.parse(AppUrls.url + "/auth/jwt/login"),
      headers: {"Content-Type": "application/x-www-form-urlencoded"},
      body: data,
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonData = json.decode(response.body);
      return Token.fromJson(jsonData).accessToken;
    } else {
      return null;
    }
  }

  static Future<bool> registerUserService(Map<String, dynamic> data) async {
    var body = json.encode(data);
    var response = await client.post(
      Uri.parse(AppUrls.url + "/auth/register"),
      headers: {"Content-Type": "application/json"},
      body: body,
    );

    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }

  static Future<User?> getUserService() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    String? token = pref.getString("token");
    var response = await client.get(
      Uri.parse(AppUrls.url + "/user"),
      headers: {"Authorization": "Bearer $token"},
    );

    if (response.statusCode == 200) {
      return userFromJson(response.body);
    } else {
      return null;
    }
  }

  static Future<List<Interest>?> getInterestService() async {
    var response = await client.get(Uri.parse(AppUrls.url + "/interest"));

    if (response.statusCode == 200) {
      return interestFromJson(response.body);
    } else {
      return null;
    }
  }

  static Future<bool> createUserInterestService(
      Map<String, dynamic> data) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    String? token = pref.getString("token");
    var body = json.encode(data);
    var response = await client.put(
      Uri.parse(AppUrls.url + "/user/interest"),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      },
      body: body,
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
