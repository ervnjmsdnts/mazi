import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mazi/const/app_colors.dart';
import 'package:mazi/const/app_images.dart';
import 'package:mazi/controllers/register_controller.dart';
import 'package:mazi/views/widgets/custom_buttons.dart';
import 'package:mazi/views/widgets/custom_textfield.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final RegisterController registerController = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              const Image(
                width: 75,
                image: AssetImage(AppImages.logo),
              ),
              Form(
                key: registerController.registerFormKey,
                child: Center(
                  child: Column(
                    children: <Widget>[
                      CustomFormField(
                        label: "First Name",
                        controller: registerController.firstNameTextController,
                      ),
                      const SizedBox(height: 20),
                      CustomFormField(
                        label: "Last Name",
                        controller: registerController.lastNameTextController,
                      ),
                      const SizedBox(height: 20),
                      CustomFormField(
                        label: "Email Address",
                        controller: registerController.emailTextController,
                      ),
                      const SizedBox(height: 20),
                      CustomFormField(
                        label: "Password",
                        password: true,
                        controller: registerController.passwordTextController,
                      ),
                      const SizedBox(height: 20),
                      CustomFormField(
                        label: "Confirm Password",
                        password: true,
                        controller:
                            registerController.confirmPasswordTextController,
                      ),
                      const SizedBox(height: 50),
                      Obx(
                        () => registerController.isLoading.value
                            ? const CircularProgressIndicator()
                            : Button(
                                text: "Create Account",
                                color: AppColors.pinky,
                                function: () =>
                                    registerController.registerUser(),
                                width: 150,
                              ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
