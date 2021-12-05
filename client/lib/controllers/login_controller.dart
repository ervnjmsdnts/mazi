import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mazi/const/app_routes.dart';
import 'package:mazi/services/api_services.dart';
import 'package:mazi/utils/snackbar_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  final loginFormKey = GlobalKey<FormState>();
  final TextEditingController emailTextController = TextEditingController();
  final TextEditingController passwordTextController = TextEditingController();

  @override
  void onClose() {
    emailTextController.dispose();
    passwordTextController.dispose();
    super.onClose();
  }

  void loginUser() async {
    Map<String, dynamic> data = {
      "username": emailTextController.text,
      "password": passwordTextController.text
    };

    String? token = await APIServices.loginUserService(data);
    if (token != null) {
      final SharedPreferences pref = await SharedPreferences.getInstance();
      await pref.setString("token", token);
      final tokenExist = pref.getString("token");

      if (tokenExist != null) {
        Get.offAllNamed(AppRoutes.enableLocationPage);
      } else {
        SnackBarUtil().failureSnackBar();
      }
    } else {
      SnackBarUtil().failureSnackBar();
    }
  }
}
