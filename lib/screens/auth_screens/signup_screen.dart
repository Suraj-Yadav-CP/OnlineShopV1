import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_shop/controllers/firebase_controller/auth_Controller/auth_controller.dart';
import 'package:online_shop/screens/home_Screens/home.dart';
import 'package:online_shop/utility/db_constants/firebase_const.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../utility/app_colour.dart';
import '../../utility/app_strings.dart';
import '../../widgets_common/app_logo.dart';
import '../../widgets_common/background.dart';
import '../../widgets_common/custom_text_field.dart';
import '../../widgets_common/ic_button.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool? isCheck = false;
  var controller = Get.put(AuthController());

  //Text Controllers..
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return bgWidget(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          children: [
            (context.screenHeight * 0.07).heightBox,
            appLogoWidget(),
            10.heightBox,
            createAcc.text.bold.black.size(18).make(),
            10.heightBox,
            // white Box
            Column(
              children: [
                customTextField(
                    title: name,
                    hint: nameHint,
                    icon: const Icon(Icons.person),
                    controller: nameController,
                isPass: false),
                customTextField(
                    title: "Email",
                    hint: "k@gmail.com",
                    icon: const Icon(Icons.email),
                    controller: emailController,
                isPass: false),
                customTextField(
                    title: password,
                    hint: passwordHint,
                    icon: const Icon(Icons.lock),
                    controller: passwordController,
                isPass: true),
                customTextField(
                    title: confirmPassword,
                    hint: passwordHint,
                    icon: const Icon(Icons.lock),
                    controller: confirmPasswordController,
                isPass: true),
                Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                        onPressed: () {},
                        child: forgotPass.text.color(Colors.red).make())),
                5.heightBox,
                Row(
                  children: [
                    Checkbox(
                        activeColor: primaryColor,
                        checkColor: Colors.white,
                        value: isCheck,
                        onChanged: (newValue) {
                          setState(() {
                            isCheck = newValue;
                          });
                        }),
                    5.widthBox,
                    Expanded(
                      child: RichText(
                          text: const TextSpan(children: [
                        TextSpan(
                            text: "I Agree to the ",
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            )),
                        TextSpan(
                            text: termsAndCond,
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.red,
                            )),
                        TextSpan(
                            text: " & ",
                            style: TextStyle(
                              color: Colors.red,
                            )),
                        TextSpan(
                            text: privacyPolicy,
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.red,
                            )),
                      ])),
                    )
                  ],
                ),
                button(
                  color: isCheck == true ? lightGold : lightBgColor,
                  title: signUp,
                  textColor: blackColor,
                  onPress: () async {
                    if (isCheck != false) {
                      try {
                        await controller
                            .signupMethod(
                                context: context,
                                email: emailController.text,
                                password: passwordController.text)
                            .then((value) {
                          return controller.storeUserData(
                              email: emailController.text,
                              password: passwordController.text,
                              name: nameController.text);
                        }).then((value) {
                          VxToast.show(context, msg: "Logged In Successfully");
                          Get.offAll(() => const Home());
                        });
                      } catch (e) {
                        auth.signOut();
                        VxToast.show(context, msg: e.toString());
                      }
                    }
                  },
                ).box.width(context.screenWidth - 40).make(),
                10.heightBox,
                // wrapping into gesture detector of velocity X
                RichText(
                    text: const TextSpan(children: [
                  TextSpan(
                      text: alreadyHaveAcc,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        color: Colors.grey,
                      )),
                  TextSpan(
                      text: login,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        color: Colors.red,
                      )),
                ])).onTap(() {
                  Get.back();
                }),
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
