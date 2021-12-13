import 'dart:async';
import 'dart:convert';

import 'package:get/get.dart';
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
  RxList usersThatPinged = [].obs;

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
    // Get.toNamed(AppRoutes.matchPage, arguments: matchUsers[index]["email"]);
  }
}
