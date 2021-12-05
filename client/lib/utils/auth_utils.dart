import 'package:get/get.dart';
import 'package:mazi/const/app_routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthUtil {
  Future<void> logout() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.clear();
    Get.offAllNamed(AppRoutes.introPage);
  }
}
