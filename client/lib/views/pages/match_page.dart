import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mazi/const/app_colors.dart';
import 'package:mazi/const/app_images.dart';
import 'package:mazi/controllers/match_controller.dart';
import 'package:mazi/views/widgets/custom_texts.dart';

class MatchPage extends StatelessWidget {
  final MatchController matchController =
      Get.put<MatchController>(MatchController());
  MatchPage({Key? key}) : super(key: key);

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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const <Widget>[
                      CircleAvatar(
                        radius: 48,
                        backgroundColor: Color(AppColors.accentPinky),
                        child: Icon(
                          Icons.person,
                          size: 48,
                        ),
                      ),
                      CustomDivider(),
                      SizedBox(height: 5),
                      CustomDivider(),
                      SizedBox(height: 5),
                      CustomDivider(),
                      SizedBox(height: 5),
                      CustomDivider(),
                      SizedBox(height: 5),
                      CustomDivider(),
                      SizedBox(height: 5),
                      CustomDivider(),
                      SizedBox(height: 5),
                      CustomDivider(),
                      SizedBox(height: 5),
                      CustomDivider(),
                      SizedBox(height: 5),
                      CustomDivider(),
                      CircleAvatar(
                        radius: 48,
                        backgroundColor: Color(AppColors.bluey),
                        child: Icon(
                          Icons.person,
                          size: 48,
                        ),
                      ),
                      SizedBox(height: 20),
                      RegularText(text: "Match Found", fontSize: 15),
                    ],
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

class CustomDivider extends StatelessWidget {
  const CustomDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 2,
      height: 10,
      color: Colors.white,
    );
  }
}
