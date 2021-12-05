import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mazi/const/app_colors.dart';
import 'package:mazi/controllers/interest_controller.dart';
import 'package:mazi/models/interest_model.dart';
import 'package:mazi/views/widgets/custom_buttons.dart';
import 'package:mazi/views/widgets/custom_texts.dart';

class InterestPage extends StatelessWidget {
  final InterestController interestController =
      Get.put<InterestController>(InterestController());
  InterestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 75, 30, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const <Widget>[
                  RegularText(text: "Your interests", fontSize: 20),
                  SizedBox(height: 10),
                  LightText(text: "Pick the things you love.", fontSize: 15),
                  SizedBox(height: 30),
                ],
              ),
            ),
            Expanded(
              child: Obx(
                () => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: interestController.interestList.length,
                    itemBuilder: (_, index) => InterestContainer(
                      interestController.interestList[index],
                    ),
                  ),
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Button(
                text: "Submit",
                color: AppColors.pinky,
                function: () => interestController.createUserInterests(),
                width: double.infinity,
              ),
              height: 75,
              decoration: const BoxDecoration(
                color: Color(
                  AppColors.primary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class InterestContainer extends StatelessWidget {
  final InterestController interestController = Get.find<InterestController>();
  final Interest interest;
  InterestContainer(this.interest, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        RegularText(
          text: interest.category,
          fontSize: 20,
        ),
        Wrap(
          spacing: 10,
          children: List.generate(
            interest.interests.length,
            (index) => Obx(
              () => ChipTheme(
                data: ChipTheme.of(context).copyWith(
                  backgroundColor: const Color(AppColors.primary),
                ),
                child: InputChip(
                  selectedColor: const Color(AppColors.pinky),
                  showCheckmark: false,
                  side: const BorderSide(color: Color(AppColors.purply)),
                  selected: interestController.selectedList
                      .contains(interest.interests[index].name),
                  label: RegularText(
                    fontSize: 15,
                    text: interest.interests[index].name,
                  ),
                  onPressed: () => interestController.setInterests(
                    index,
                    interest,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
