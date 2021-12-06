import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';
import 'package:mazi/const/app_routes.dart';
import 'package:mazi/controllers/user_controller.dart';

class LocationController extends GetxController {
  final UserController _user = Get.put<UserController>(UserController());
  Location location = Location();
  PermissionStatus? _permissionGranted;

  Future<void> checkPermission() async {
    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied ||
        _permissionGranted == PermissionStatus.deniedForever) {
      _permissionGranted = await location.requestPermission();

      if (_permissionGranted != PermissionStatus.granted) {
        debugPrint("Permission not granted");
        return;
      }
    } else {
      if (_user.user!.value.interests.isNotEmpty) {
        Get.offAllNamed(AppRoutes.homePage);
      } else {
        Get.offAllNamed(AppRoutes.interestPage);
      }
    }
  }
}
