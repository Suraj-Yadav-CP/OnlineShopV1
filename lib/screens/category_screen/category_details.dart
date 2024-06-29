import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:online_shop/screens/category_screen/item_details.dart';
import 'package:online_shop/utility/app_colour.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../utility/app_images.dart';

class CategoryDetails extends StatelessWidget {
  final String? title;
  const CategoryDetails({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBgColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: title!.text.bold.black.make(),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Column(
          children: [
            SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                child: Row(
                  children: List.generate(
                      6,
                      (index) => 'Baby Clothing'
                          .text
                          .size(14)
                          .semiBold
                          .black
                          .makeCentered()
                          .box
                          .color(primaryColor)
                          .rounded
                          .size(120, 60)
                          .outerShadowSm
                          .margin(const EdgeInsets.symmetric(horizontal: 4))
                          .make()),
                )),
            20.heightBox,
            // Items Container
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: GridView.builder(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 6,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisExtent: 250,
                            crossAxisSpacing: 8,
                            mainAxisSpacing: 8),
                    itemBuilder: (context, index) {
                      return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                            Image.asset(
                              imgP3,
                              width: 200,
                              height: 150,
                              fit: BoxFit.cover,
                            ),
                            "Premium Fabric".text.semiBold.gray600.make(),
                            10.heightBox,
                            "\$ 700".text.extraBold.size(16).orange600.make(),
                          ])
                          .box
                          .white
                          .margin(const EdgeInsets.symmetric(horizontal: 4))
                          .padding(const EdgeInsets.all(12))
                          .outerShadowSm
                          .roundedSM
                          .make()
                          .onTap(() {
                        Get.to(() => const ItemDetails(title: "Dummy Title"));
                      });
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
