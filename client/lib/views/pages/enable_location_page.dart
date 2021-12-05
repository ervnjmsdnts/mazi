import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mazi/const/app_colors.dart';
import 'package:mazi/const/app_images.dart';
import 'package:mazi/controllers/location_controller.dart';
import 'package:mazi/views/widgets/custom_buttons.dart';
import 'package:mazi/views/widgets/custom_texts.dart';

class EnableLocationPage extends StatelessWidget {
  final LocationController locationController =
      Get.put<LocationController>(LocationController());
  EnableLocationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(left: 50),
            alignment: Alignment.centerLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const <Widget>[
                Image(
                  image: AssetImage(AppImages.pin),
                ),
                RegularText(
                  text: "Enable Location",
                  fontSize: 20,
                ),
                RegularText(
                  text: "Services",
                  fontSize: 20,
                ),
                SizedBox(height: 10),
                LightText(text: "We use your location to show", fontSize: 15),
                LightText(text: "your possible matches in your", fontSize: 15),
                LightText(text: "area.", fontSize: 15),
              ],
            ),
          ),
          const SizedBox(height: 185),
          Container(
            alignment: Alignment.center,
            child: Column(
              children: <Widget>[
                Button(
                  text: "Next",
                  color: AppColors.pinky,
                  function: () => locationController.checkPermission(),
                  width: 150,
                ),
                const SizedBox(height: 10),
                const LightText(
                  text: "Your location service needs to be turned",
                  fontSize: 15,
                ),
                const LightText(
                  text: "on in order for the system to work.",
                  fontSize: 15,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
