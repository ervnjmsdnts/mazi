import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mazi/const/app_colors.dart';
import 'package:mazi/const/app_font.dart';
import 'package:mazi/const/app_routes.dart';
import 'package:mazi/views/pages/auth/intro_page.dart';
import 'package:mazi/views/pages/auth/login_page.dart';
import 'package:mazi/views/pages/auth/register_page.dart';
import 'package:mazi/views/pages/enable_location_page.dart';
import 'package:mazi/views/pages/home_page.dart';
import 'package:mazi/views/pages/interest_page.dart';
import 'package:mazi/views/pages/match_page.dart';
import 'package:mazi/views/pages/search_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

String? token;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences pref = await SharedPreferences.getInstance();
  token = pref.getString("token");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Mazi Application",
      debugShowCheckedModeBanner: false,
      initialRoute: token == null ? AppRoutes.introPage : AppRoutes.homePage,
      getPages: [
        GetPage(name: AppRoutes.introPage, page: () => const IntroPage()),
        GetPage(name: AppRoutes.loginPage, page: () => const LoginPage()),
        GetPage(name: AppRoutes.registerPage, page: () => const RegisterPage()),
        GetPage(
          name: AppRoutes.enableLocationPage,
          page: () => EnableLocationPage(),
        ),
        GetPage(name: AppRoutes.homePage, page: () => HomePage()),
        GetPage(name: AppRoutes.interestPage, page: () => InterestPage()),
        GetPage(name: AppRoutes.searchPage, page: () => const SearchPage()),
        GetPage(name: AppRoutes.matchPage, page: () => const MatchPage()),
      ],
      theme: ThemeData(
        fontFamily: AppFonts.light,
        scaffoldBackgroundColor: const Color(AppColors.primary),
      ),
    );
  }
}
