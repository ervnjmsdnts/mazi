import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mazi/views/widgets/custom_texts.dart';

class SnackBarUtil {
  String title;
  String message;

  SnackBarUtil({this.title = "", this.message = ""});
  void successSnackBar() {
    Get.snackbar(
      title,
      message,
      backgroundColor: Colors.green[600],
      titleText: RegularText(text: title, fontSize: 20),
      messageText: LightText(
        text: message,
        fontSize: 15,
      ),
    );
  }

  void failureSnackBar() {
    Get.snackbar(
      "Failure",
      "Something went wrong",
      backgroundColor: Colors.red[600],
      titleText: const RegularText(text: "Failure", fontSize: 20),
      messageText: const LightText(
        text: "Something went wrong.",
        fontSize: 15,
      ),
    );
  }
}
