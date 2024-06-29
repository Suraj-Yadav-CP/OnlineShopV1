import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:online_shop/controllers/firebase_controller/auth_Controller/auth_controller.dart';
import 'package:online_shop/screens/auth_screens/signup_screen.dart';
import 'package:online_shop/screens/home_Screens/home.dart';
import 'package:online_shop/utility/app_colour.dart';
import 'package:online_shop/utility/app_strings.dart';
import 'package:online_shop/utility/list.dart';
import 'package:online_shop/widgets_common/app_logo.dart';
import 'package:online_shop/widgets_common/background.dart';
import 'package:online_shop/widgets_common/custom_text_field.dart';
import 'package:online_shop/widgets_common/ic_button.dart';
import 'package:velocity_x/velocity_x.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AuthController());

    return bgWidget(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          children: [
            (context.screenHeight * 0.1).heightBox,
            appLogoWidget(),
            20.heightBox,
            "Welcome to $appName".text.bold.black.size(18).make(),
            25.heightBox,
            // white Box
            Column(
              children: [
                customTextField(
                    title: "Email",
                    hint: "k@gmail.com",
                    icon: const Icon(Icons.email),
                    isPass: false,
                    controller: controller.emailController),
                20.heightBox,
                customTextField(
                    title: "Password",
                    hint: "******",
                    icon: const Icon(Icons.lock),
                    isPass: true,
                    controller: controller.passwordController),
                Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                        onPressed: () async{
                          await controller.loginMethod(context).then((value){
                            if(value != null){
                              VxToast.show(context, msg: "Logged In Successfully");
                              Get.offAll(()=> const Home());
                            }
                          }
                          );
                        },
                        child: forgotPass.text.red500.make())),
                5.heightBox,
                // button().box.width(context.screenWidth - 40).make(),
                button(
                    color: primaryColor,
                    title: login,
                    textColor: blackColor,
                    onPress: () {
                      Get.to(() => const Home());
                    }).box.width(context.screenWidth - 40).make(),
                5.heightBox,
                createNewAcc.text.gray500.semiBold.make(),
                5.heightBox,
                button(
                    color: lightGold,
                    title: signUp,
                    textColor: blackColor,
                    onPress: () {
                      Get.to(() => const SignUpScreen());
                    }).box.width(context.screenWidth - 40).make(),
                10.heightBox,
                loginWith.text.semiBold.gray500.make(),
                15.heightBox,
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      3,
                      (index) => Padding(
                        padding: const EdgeInsets.all(9.0),
                        child: SvgPicture.asset(
                          socialIconList[index],
                          width: 30,
                          height: 30,
                        ),
                      ),
                    )),
              ],
            )
                .box
                .white
                .rounded
                .padding(const EdgeInsets.all(15))
                .width(context.screenWidth - 40)
                .shadowSm
                .make(),
          ],
        ),
      ),
    ));
  }
}
