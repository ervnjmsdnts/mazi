import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mazi/const/app_colors.dart';
import 'package:mazi/const/app_images.dart';
import 'package:mazi/controllers/login_controller.dart';
import 'package:mazi/views/widgets/custom_buttons.dart';
import 'package:mazi/views/widgets/custom_textfield.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(32),
          child: Column(
            children: <Widget>[
              const Image(
                image: AssetImage(AppImages.logo),
                width: 75,
              ),
              const SizedBox(height: 40),
              Form(
                key: loginController.loginFormKey,
                child: Center(
                  child: Column(
                    children: <Widget>[
                      CustomFormField(
                        label: "Email Address",
                        controller: loginController.emailTextController,
                      ),
                      const SizedBox(height: 20),
                      CustomFormField(
                        label: "Password",
                        password: true,
                        controller: loginController.passwordTextController,
                      ),
                      const SizedBox(height: 195),
                      Button(
                        text: "Log in",
                        color: AppColors.pinky,
                        function: () => loginController.loginUser(),
                        width: 100,
                      )
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
