import 'package:get/get.dart';
import 'package:mazi/models/user_model.dart';
import 'package:mazi/services/api_services.dart';

class UserController extends GetxController {
  var isLoading = true.obs;
  Rx<User>? user;

  @override
  void onInit() async {
    user = await getUser();
    super.onInit();
  }

  Future<Rx<User>?> getUser() async {
    isLoading(true);
    User? currentUser = await APIServices.getUserService();

    if (currentUser != null) {
      isLoading(false);
      return currentUser.obs;
    }
  }
}
