import 'dart:convert';

import 'package:flutter/cupertino.dart';
import "package:get/get.dart";
import 'package:mazi/const/app_urls.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:location/location.dart';

class SocketController extends GetxController {
  WebSocketChannel? channel;
  Location location = Location();
  RxList matchUsers = [].obs;

  @override
  void onInit() {
    super.onInit();
    getToken().then((token) {
      channel = IOWebSocketChannel.connect(
        Uri.parse(AppUrls.websocketUrl),
        headers: {"Authorization": "Bearer $token"},
      );
      location.onLocationChanged.listen((locationData) {
        channel!.sink.add(json.encode({
          "location": [locationData.latitude, locationData.longitude]
        }));
      });
      channel?.stream.listen((listData) {
        List listUser = json.decode(listData);
        for (var user in listUser) {
          var exist = matchUsers.where(
            (data) => data["email"] == user["email"],
          );
          if (exist.isEmpty) {
            matchUsers.add(user);
          }
        }
      });
    });
  }

  @override
  void onClose() {
    super.onClose();
    channel!.sink.close();
    debugPrint("Connection closed");
  }

  Future<String?> getToken() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString("token");
  }
}
