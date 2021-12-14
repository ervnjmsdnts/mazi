import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mazi/const/app_colors.dart';
import 'package:mazi/const/app_font.dart';
import 'package:mazi/const/app_images.dart';
import 'package:mazi/const/app_routes.dart';
import 'package:mazi/views/widgets/custom_buttons.dart';
import 'package:mazi/views/widgets/custom_texts.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: <Widget>[
              const SizedBox(height: 82),
              const RegularText(
                text: "Welcome",
                fontSize: AppFontSizes.mainSize,
              ),
              const RegularText(
                text: "to",
                fontSize: AppFontSizes.mainSize,
              ),
              const Image(
                image: AssetImage(AppImages.logo),
              ),
              const RegularText(
                text: "M  A  Z  I",
                fontSize: 40,
                color: Color(AppColors.accentPinky),
              ),
              const SizedBox(height: 10),
              const RegularText(
                text: "The Future of",
                fontSize: AppFontSizes.mainSize,
              ),
              const RegularText(
                text: "Dating",
                fontSize: AppFontSizes.mainSize,
              ),
              const SizedBox(height: 137),
              Button(
                text: "Log in",
                color: AppColors.bluey,
                function: () => Get.toNamed(AppRoutes.loginPage),
                width: 250,
              ),
              const SizedBox(height: 14),
              Button(
                text: "Create Account",
                color: AppColors.purply,
                function: () => Get.toNamed(AppRoutes.registerPage),
                width: 250,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
