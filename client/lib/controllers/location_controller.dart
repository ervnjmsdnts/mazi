import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';
import 'package:mazi/const/app_routes.dart';
import 'package:mazi/controllers/socket_controller.dart';
import 'package:mazi/controllers/user_controller.dart';
import 'package:mazi/models/location_model.dart';

class LocationController extends GetxController {
  final UserController _user = Get.put<UserController>(UserController());
  final SocketController socketController =
      Get.put<SocketController>(SocketController());
  var currentLocation = UserLocation().obs;
  Location location = Location();
  PermissionStatus? _permissionGranted;

  final StreamController<UserLocation> _locationController =
      StreamController<UserLocation>.broadcast();

  LocationController() {
    location.onLocationChanged.listen((locationData) {
      _locationController.add(UserLocation(
        latitude: locationData.latitude,
        longitude: locationData.longitude,
      ));
      socketController.channel!.sink.add(json.encode({
        "location": [locationData.latitude, locationData.latitude]
      }));
    });
  }

  Stream<UserLocation> get locationStream => _locationController.stream;

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

  Future<void> subscribeStream() async {
    currentLocation.bindStream(locationStream);
  }

  Future<void> unsubscribeStream() async {
    currentLocation.close();
  }

  Future<UserLocation> getUserLocation() async {
    try {
      LocationData userLocation = await location.getLocation();
      currentLocation.value = UserLocation(
        latitude: userLocation.latitude,
        longitude: userLocation.longitude,
      );
    } catch (e) {
      debugPrint("Something went wrong here is the error: $e");
    }

    return currentLocation.value;
  }
}
