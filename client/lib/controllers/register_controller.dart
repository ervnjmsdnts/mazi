import 'package:get/get.dart';
import "package:flutter/material.dart";
import 'package:mazi/services/api_services.dart';
import 'package:mazi/utils/snackbar_utils.dart';

class RegisterController extends GetxController {
  final registerFormKey = GlobalKey<FormState>();
  final TextEditingController firstNameTextController = TextEditingController();
  final TextEditingController lastNameTextController = TextEditingController();
  final TextEditingController emailTextController = TextEditingController();
  final TextEditingController passwordTextController = TextEditingController();
  final TextEditingController confirmPasswordTextController =
      TextEditingController();
  var isLoading = false.obs;

  @override
  void onClose() {
    firstNameTextController.dispose();
    lastNameTextController.dispose();
    emailTextController.dispose();
    passwordTextController.dispose();
    confirmPasswordTextController.dispose();
    super.onClose();
  }

  void registerUser() async {
    Map<String, dynamic> data = {
      "firstName": firstNameTextController.text,
      "lastName": lastNameTextController.text,
      "email": emailTextController.text,
      "password": passwordTextController.text,
      "confirmationPassword": confirmPasswordTextController.text,
    };

    isLoading(true);

    bool isRegistered = await APIServices.registerUserService(data);

    isLoading(false);

    if (isRegistered) {
      SnackBarUtil(
        title: "Success",
        message: "A confirmation email has been sent to your account.",
      ).successSnackBar();
    } else {
      SnackBarUtil().failureSnackBar();
    }
  }
}
