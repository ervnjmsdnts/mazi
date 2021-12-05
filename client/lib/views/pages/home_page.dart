import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mazi/const/app_colors.dart';
import 'package:mazi/const/app_routes.dart';
import 'package:mazi/controllers/drawer_controller.dart';
import 'package:mazi/controllers/user_controller.dart';
import 'package:mazi/utils/auth_utils.dart';
import 'package:mazi/views/widgets/custom_buttons.dart';
import 'package:mazi/views/widgets/custom_texts.dart';

class HomePage extends StatelessWidget {
  final UserController userController =
      Get.put<UserController>(UserController());
  final DrawerStateController drawerController =
      Get.put<DrawerStateController>(DrawerStateController());
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: drawerController.scaffoldKey,
      appBar: AppBar(
        leading: Container(),
        backgroundColor: const Color(AppColors.primary),
        actions: <Widget>[
          IconButton(
            onPressed: () => drawerController.openDrawer(),
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      drawer: const SettingsDrawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(AppRoutes.searchPage),
        backgroundColor: const Color(AppColors.bluey),
        child: const Icon(Icons.favorite),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: const <Widget>[
            UserDetails(),
            SizedBox(height: 25),
            UserInterests(),
          ],
        ),
      ),
    );
  }
}

class UserInterests extends StatelessWidget {
  const UserInterests({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const RegularText(
            text: "My Interests",
            fontSize: 20,
          ),
          const SizedBox(height: 10),
          GetX<UserController>(
            builder: (controller) => Wrap(
              spacing: 10,
              children: List.generate(
                controller.isLoading.value
                    ? 0
                    : controller.user!.value.interests.length,
                (index) => controller.isLoading.value
                    ? const CircularProgressIndicator()
                    : ChipTheme(
                        data: ChipTheme.of(context).copyWith(
                          backgroundColor: const Color(
                            AppColors.primary,
                          ),
                        ),
                        child: Chip(
                          side: const BorderSide(
                            color: Color(AppColors.purply),
                          ),
                          label: RegularText(
                            text: controller.user!.value.interests[index],
                            fontSize: 15,
                          ),
                        ),
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class UserDetails extends StatelessWidget {
  const UserDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: <Widget>[
          const CircleAvatar(
            backgroundColor: Color(AppColors.accentPinky),
            foregroundColor: Color(AppColors.textColor),
            child: Icon(
              Icons.person,
              size: 48,
            ),
            radius: 48,
          ),
          const SizedBox(height: 10),
          GetX<UserController>(
            builder: (controller) => controller.isLoading.value
                ? const CircularProgressIndicator()
                : Column(
                    children: <Widget>[
                      RegularText(
                        text:
                            "${controller.user!.value.firstName} ${controller.user!.value.lastName}",
                        fontSize: 20,
                      ),
                      LightText(
                        color: const Color(AppColors.purply),
                        text: controller.user!.value.email,
                        fontSize: 15,
                      ),
                    ],
                  ),
          )
        ],
      ),
    );
  }
}

class SettingsDrawer extends StatelessWidget {
  const SettingsDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 30,
      ),
      width: 300,
      color: const Color(AppColors.primary),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          const ListTile(
            title: RegularText(
              fontSize: 20,
              text: "Settings",
            ),
          ),
          Button(
            text: "Logout",
            color: AppColors.pinky,
            function: () => AuthUtil().logout(),
            width: 150,
          )
        ],
      ),
    );
  }
}
