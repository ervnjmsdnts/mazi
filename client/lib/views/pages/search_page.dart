import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mazi/const/app_colors.dart';
import 'package:mazi/const/app_images.dart';
import 'package:mazi/controllers/socket_controller.dart';
import 'package:mazi/views/widgets/custom_texts.dart';
import 'package:mazi/views/widgets/custom_wave.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final SocketController socketController =
      Get.put<SocketController>(SocketController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 50),
            child: Column(
              children: <Widget>[
                const Image(
                  width: 75,
                  image: AssetImage(AppImages.logo),
                ),
                Expanded(
                  child: Stack(
                    alignment: Alignment.center,
                    children: const <Widget>[
                      SizedBox(
                        width: 500,
                        height: 500,
                        child: WaterRipple(),
                      ),
                      CircleAvatar(
                        radius: 48,
                        backgroundColor: Color(AppColors.accentPinky),
                        child: Icon(
                          Icons.person,
                          size: 48,
                        ),
                      )
                    ],
                  ),
                ),
                const LightText(
                  text: "Searching . . .",
                  fontSize: 20,
                ),
                Obx(
                  () => Text(
                    "${socketController.matchUsers[0]["email"]}",
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
