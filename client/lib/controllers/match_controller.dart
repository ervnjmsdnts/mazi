import 'dart:async';
import 'dart:convert';

import 'package:get/get.dart';
import 'package:location/location.dart';
import 'package:mazi/const/app_urls.dart';
import 'package:mazi/utils/auth_utils.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class MatchController extends GetxController {
  WebSocketChannel? channel;
  Location location = Location();
  RxDouble roomDistance = 0.0.obs;
  List? room;

  @override
  void onInit() {
    super.onInit();
    AuthUtil().getToken().then((token) {
      var roomId = Get.arguments;
      channel = IOWebSocketChannel.connect(
        Uri.parse(AppUrls.matchUrl + "/$roomId"),
        headers: {"Authorization": "Bearer $token"},
      );
      StreamSubscription<LocationData> locationSucbscription =
          location.onLocationChanged.listen((locationData) {
        channel?.sink.add(json.encode({
          "location": [locationData.latitude, locationData.longitude]
        }));
      });
      channel?.stream.listen(
        (data) {
          // var distance = json.decode(data);
          // roomDistance.value = distance["distance"];
          // print(roomDistance.value);
        },
        onDone: () => locationSucbscription.cancel(),
      );
    });
  }

  @override
  void onClose() {
    super.onClose();
    channel!.sink.close();
  }
}
