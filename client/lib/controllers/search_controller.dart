import 'dart:async';
import 'dart:convert';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mazi/const/app_colors.dart';
import 'package:mazi/const/app_routes.dart';
import 'package:mazi/const/app_urls.dart';
import 'package:mazi/utils/auth_utils.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:location/location.dart';

class SearchController extends GetxController {
  WebSocketChannel? channel;
  Location location = Location();
  RxList matchUsers = [].obs;

  @override
  void onInit() {
    super.onInit();
    AuthUtil().getToken().then((token) {
      channel = IOWebSocketChannel.connect(
        Uri.parse(AppUrls.searchUrl),
        headers: {"Authorization": "Bearer $token"},
      );
      StreamSubscription<LocationData> locationSucbscription =
          location.onLocationChanged.listen((locationData) {
        channel?.sink.add(json.encode({
          "location": [locationData.latitude, locationData.longitude]
        }));
      });
      channel?.stream.listen((data) {
        if (data.toString().contains("room_id")) {
          var room = json.decode(data);
          Get.toNamed(AppRoutes.matchPage, arguments: room["room_id"]);
        } else if (data.toString().length > 50) {
          List listUser = json.decode(data);
          for (var user in listUser) {
            var exist = matchUsers.where(
              (data) => data["email"] == user["email"],
            );
            if (exist.isEmpty) {
              matchUsers.add({"email": user["email"], "ping": false.obs});
            }
          }
        } else {
          for (var user in matchUsers) {
            if (user["email"] == data) {
              user["ping"].value = true;
            }
          }
        }
      }, onDone: () {
        locationSucbscription.cancel();
      });
    });
  }

  @override
  void onClose() {
    super.onClose();
    channel?.sink.close();
  }

  void pingUser(int index) {
    var pingedUserEmail = matchUsers[index]["email"];
    channel?.sink.add(json.encode({"pingedUserEmail": pingedUserEmail}));
  }

  void matchUser(int index) {
    Get.defaultDialog(
      title: "Confirmation",
      titleStyle: const TextStyle(
        fontSize: 15,
        color: Color(AppColors.textColor),
      ),
      backgroundColor: const Color(AppColors.primary),
      middleText: "This one just pinged you",
      middleTextStyle: const TextStyle(
        fontSize: 20,
        color: Color(AppColors.textColor),
      ),
      radius: 16,
      textCancel: "Reject",
      cancelTextColor: const Color(AppColors.textColor),
      textConfirm: "Accept",
      confirmTextColor: const Color(AppColors.textColor),
      onCancel: () {
        channel?.sink.add({
          "matchEmail": matchUsers[index]["email"],
          "confirmation": false,
        });
        Get.back();
      },
      onConfirm: () {
        channel?.sink.add(json.encode({
          "matchEmail": matchUsers[index]["email"],
          "confirmation": true,
        }));
      },
      buttonColor: const Color(AppColors.purply),
    );
  }
}
