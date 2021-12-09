import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mazi/const/app_urls.dart';
import 'package:mazi/utils/auth_utils.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class MatchController extends GetxController {
  WebSocketChannel? channel;

  @override
  void onInit() {
    super.onInit();
    AuthUtil().getToken().then((token) {
      channel = IOWebSocketChannel.connect(
        Uri.parse(AppUrls.matchUrl),
        headers: {"Authorization": "Bearer $token"},
      );
      channel!.sink.add(Get.arguments);
    });
  }

  @override
  void onClose() {
    super.onClose();
    channel!.sink.close();
    debugPrint("Connection closed");
  }
}
