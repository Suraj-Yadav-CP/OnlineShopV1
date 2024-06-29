import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_shop/controllers/firebase_controller/auth_Controller/auth_controller.dart';

import 'package:online_shop/screens/account_screen/components/details_cards.dart';
import 'package:online_shop/screens/auth_screens/login_screen.dart';
import 'package:online_shop/utility/app_images.dart';
import 'package:online_shop/utility/app_strings.dart';
import 'package:online_shop/utility/list.dart';
import 'package:online_shop/widgets_common/background.dart';
import 'package:velocity_x/velocity_x.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return bgWidget(
      child: Scaffold(
        body: SafeArea(
          child: Container(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                // edit profile button
                const Align(
                        alignment: Alignment.topRight, child: Icon(Icons.edit))
                    .onTap(() {}),
                Row(
                  children: [
                    Image.asset(
                      profileImage,
                      width: 80,
                      fit: BoxFit.cover,
                    ).box.roundedFull.shadowSm.clip(Clip.antiAlias).make(),
                    15.widthBox,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          "User Name".text.extraBold.size(16).make(),
                          "k@gmail.com".text.semiBold.size(12).black.make()
                        ],
                      ),
                    ),
                    OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0)),
                          side: const BorderSide(
                            color: Vx.black,
                            width: 1.2,
                          ),
                        ),
                        onPressed: () async{
                          await Get.put(AuthController()).signOutMethod(context);
                          Get.offAll(()=> const LogInScreen());
                        },
                        child: logOut.text.semiBold.black.make()),
                  ],
                ),

                // box section
                20.heightBox,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    detailsCards(
                        count: "00",
                        title: "Cart Count",
                        width: context.screenWidth / 3.7),
                    detailsCards(
                        count: "34",
                        title: "Wishlist Count",
                        width: context.screenWidth / 3.7),
                    detailsCards(
                        count: "770",
                        title: "Order Count",
                        width: context.screenWidth / 3.7)
                  ],
                ),

                20.heightBox,
                // button Sections -
                ListView.separated(
                  shrinkWrap: true,
                  separatorBuilder: (context, index) {
                    return const Divider(
                      color: Vx.gray200,
                    );
                  },
                  itemCount: profileButtonList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      leading: profileButtonIconList[index],
                      title: profileButtonList[index]
                          .text
                          .semiBold
                          .size(15)
                          .gray700
                          .make(),
                    );
                  },
                )
                    .box
                    .white
                    .roundedSM
                    .shadowSm
                    .padding(const EdgeInsets.symmetric(horizontal: 16))
                    .make(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
