import 'package:flutter/material.dart';
import 'package:online_shop/utility/app_colour.dart';
import 'package:online_shop/utility/app_images.dart';
import 'package:online_shop/utility/app_strings.dart';
import 'package:online_shop/utility/list.dart';
import 'package:online_shop/widgets_common/ic_button.dart';
import 'package:velocity_x/velocity_x.dart';

class ItemDetails extends StatelessWidget {
  final String? title;
  const ItemDetails({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBgColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: title!.text.bold.black.make(),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.share_outlined,
              )),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.favorite_outline,
              )),
        ],
      ),
      body: Column(
        children: [
          Expanded(
              child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //swiper selection
                VxSwiper.builder(
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 3),
                    height: 350,
                    aspectRatio: 16 / 9,
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return Image.asset(
                        imgP1,
                        width: double.infinity,
                        fit: BoxFit.fill,
                      );
                    }),
                20.heightBox,
                // title and details section
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: title!.text.bold.black.size(16).make(),
                ),
                10.heightBox,
                // rating
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: VxRating(
                    onRatingUpdate: (value) {},
                    normalColor: Vx.gray600,
                    selectionColor: Vx.yellow500,
                    count: 5,
                    size: 25,
                    stepInt: true,
                  ),
                ),
                10.heightBox,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: "\$ 1000".text.extraBold.size(18).orange600.make(),
                ),
                10.heightBox,
                Padding(
                  padding: const EdgeInsets.all(0),
                  child: Row(
                    children: [
                      Expanded(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          "Seller".text.black.bold.size(16).make(),
                          1.heightBox,
                          "In house brands".text.bold.gray500.size(14).make(),
                        ],
                      )),
                      CircleAvatar(
                        backgroundColor: Vx.white,
                        child:
                            Icon(Icons.message_outlined, color: primaryColor),
                      ),
                    ],
                  )
                      .box
                      .height(65)
                      .padding(const EdgeInsets.symmetric(horizontal: 16))
                      .gray200
                      .make(),
                ),
                20.heightBox,
                // color section
                Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 100,
                          child: "Color".text.gray600.size(14).bold.make(),
                        ),
                        Row(
                            children: List.generate(
                                3,
                                (index) => VxBox()
                                    .size(30, 30)
                                    .margin(const EdgeInsets.symmetric(
                                        horizontal: 4))
                                    .roundedFull
                                    .color(Vx.randomPrimaryColor)
                                    .make()))
                      ],
                    ).box.padding(const EdgeInsets.all(8)).make(),

                    // quantity Row
                    Row(
                      children: [
                        SizedBox(
                          width: 100,
                          child: "Quantity".text.gray600.size(14).bold.make(),
                        ),
                        Row(children: [
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.remove,
                                color: Vx.black,
                              )),
                          "0".text.semiBold.size(14).black.make(),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.add,
                                color: Vx.black,
                              )),
                          10.heightBox,
                          "(0 Available)".text.semiBold.size(14).black.make()
                        ])
                      ],
                    ).box.padding(const EdgeInsets.all(8)).make(),
                    // total
                    Row(
                      children: [
                        SizedBox(
                          width: 100,
                          child: "Total".text.gray600.size(14).bold.make(),
                        ),
                        "\$ 0.00".text.extraBold.orange600.size(14).make()
                      ],
                    ).box.padding(const EdgeInsets.all(8)).make(),
                  ],
                ).box.white.padding(const EdgeInsets.all(10)).make(),
                10.heightBox,
                //Description
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: "Description".text.semiBold.gray600.size(16).make(),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: "This is Dummy Item and Dummy Description"
                      .text
                      .semiBold
                      .size(14)
                      .black
                      .make(),
                ),
                10.heightBox,
                //Button Selection
                ListView(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: List.generate(
                      itemDetailsButtonList.length,
                      (index) => ListTile(
                            title: itemDetailsButtonList[index]
                                .text
                                .semiBold
                                .gray600
                                .make(),
                            trailing: const Icon(Icons.arrow_forward),
                          )),
                ),
                15.heightBox,
                //product you may also like
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:
                      productYouAlsoLike.text.semiBold.size(16).gray600.make(),
                ),
                10.heightBox,
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  child: Row(
                    children: List.generate(
                        6,
                        (index) => Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(
                                  imgP5,
                                  width: 150,
                                  fit: BoxFit.cover,
                                ),
                                10.heightBox,
                                "Combo Pack".text.semiBold.gray600.make(),
                                10.heightBox,
                                "\$ 500"
                                    .text
                                    .extraBold
                                    .size(16)
                                    .orange600
                                    .make(),
                              ],
                            )
                                .box
                                .white
                                .roundedSM
                                .padding(const EdgeInsets.all(8))
                                .margin(
                                    const EdgeInsets.symmetric(horizontal: 4))
                                .make()),
                  ),
                ),
              ],
            ),
          )),
          SizedBox(
            width: double.infinity,
            height: 60,
            child: button(
                color: Vx.red700,
                onPress: () {},
                textColor: Vx.white,
                title: "Add to Cart"),
          )
        ],
      ),
    );
  }
}
