import 'package:get/get.dart';
import 'package:mazi/const/app_routes.dart';
import 'package:mazi/models/interest_model.dart';
import 'package:mazi/services/api_services.dart';

class InterestController extends GetxController {
  var interestList = <Interest>[].obs;
  var selectedList = [].obs;

  @override
  void onInit() {
    getInterests();
    super.onInit();
  }

  void getInterests() async {
    var interests = await APIServices.getInterestService();

    if (interests != null) {
      interestList.value = interests;
    }
  }

  void setInterests(int index, Interest interest) {
    if (selectedList.contains(interest.interests[index].name)) {
      selectedList.remove(interest.interests[index].name);
    } else {
      selectedList.add(interest.interests[index].name);
    }
  }

  void createUserInterests() async {
    Map<String, dynamic> data = {"interests": selectedList};
    var interests = await APIServices.createUserInterestService(data);

    if (interests) {
      Get.offAllNamed(AppRoutes.homePage);
    }
  }
}
