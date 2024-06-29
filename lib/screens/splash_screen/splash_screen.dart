import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_shop/screens/auth_screens/login_screen.dart';
import 'package:online_shop/utility/app_colour.dart';
import 'package:online_shop/utility/app_images.dart';
import 'package:online_shop/utility/app_strings.dart';
import 'package:online_shop/widgets_common/app_logo.dart';
import 'package:velocity_x/velocity_x.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // Creating a method to change the screen
  changeScreen() {
    Future.delayed(const Duration(seconds: 3), () {
      //using getX
      Get.to(() => const LogInScreen());
    });
  }

  @override
  void initState() {
    changeScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBgColor,
      body: Center(
        child: Column(
          children: [
            Align(
                alignment: Alignment.topLeft,
                child: Image.asset(appLogoBg, width: 400)),
            12.heightBox,
            appLogoWidget(),
            10.heightBox,
            appName.text.bold.black.size(18).make(),
            4.heightBox,
            appVersion.text.black.size(10).make(),
            const Spacer(),
            credits.text.bold.black.make(),
            20.heightBox,
          ],
        ),
      ),
    );
  }
}
