import "package:get/get.dart";
import 'package:mazi/const/app_urls.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class SocketController extends GetxController {
  WebSocketChannel? channel;
  bool isWebsocketRunning = false;
  int retryLimit = 3;

  void startStream() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    if (isWebsocketRunning) return;
    String? token = pref.getString("token");
    channel = IOWebSocketChannel.connect(
      Uri.parse(AppUrls.websocketUrl),
      headers: {"Authorization": "Bearer $token"},
    );

    channel!.stream.listen((data) {}, onDone: () {
      isWebsocketRunning = false;
    }, onError: (err) {
      isWebsocketRunning = false;

      if (retryLimit > 0) {
        retryLimit--;
        startStream();
      }
    });
  }

  void closeStream() {
    channel!.sink.close();
    isWebsocketRunning = false;
  }
}
