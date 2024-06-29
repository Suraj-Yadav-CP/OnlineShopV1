import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:online_shop/screens/home_Screens/components/featured_button.dart';
import 'package:online_shop/utility/app_images.dart';
import 'package:online_shop/utility/app_strings.dart';
import 'package:online_shop/utility/list.dart';
import 'package:online_shop/widgets_common/home_Button.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      color: Vx.gray100,
      width: context.screenWidth,
      height: context.screenHeight,
      child: SafeArea(
          child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            height: 60,
            color: Vx.gray100,
            child: TextFormField(
              style: const TextStyle(
                fontSize: 14,
              ),
              decoration: const InputDecoration(
                border: InputBorder.none,
                filled: true,
                fillColor: Colors.white,
                hintText: searchAnything,
                hintStyle: TextStyle(color: Vx.gray400),
                suffixIcon: Icon(
                  Icons.search,
                  color: Vx.purple800,
                ),
              ),
            ),
          ),
          10.heightBox,
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  // Swiper Brands..
                  VxSwiper.builder(
                      aspectRatio: 16 / 9,
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 3),
                      enlargeCenterPage: true,
                      height: 150,
                      itemCount: sliderList.length,
                      itemBuilder: (context, index) {
                        return Image.asset(
                          sliderList[index],
                          fit: BoxFit.fill,
                        )
                            .box
                            .rounded
                            .clip(Clip.antiAlias)
                            .margin(const EdgeInsets.symmetric(horizontal: 9))
                            .make();
                      }),

                  20.heightBox,

                  //deals buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(
                        2,
                        (index) => homeButton(
                              height: context.screenHeight * 0.1,
                              width: context.screenWidth / 2.5,
                              icon: index == 0
                                  ? const Icon(
                                      Icons.today_outlined,
                                      color: Vx.yellow500,
                                    )
                                  : SvgPicture.asset(
                                      flash,
                                      colorFilter: const ColorFilter.mode(
                                          Vx.blue500, BlendMode.srcIn),
                                    ),
                              title: index == 0 ? todayDeal : flashSale,
                            )),
                  ),
                  20.heightBox,

                  // 2nd Swiper Brands..
                  VxSwiper.builder(
                      aspectRatio: 16 / 9,
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 3),
                      enlargeCenterPage: true,
                      height: 150,
                      itemCount: secondSliderList.length,
                      itemBuilder: (context, index) {
                        return Image.asset(
                          secondSliderList[index],
                          fit: BoxFit.fill,
                        )
                            .box
                            .rounded
                            .clip(Clip.antiAlias)
                            .margin(const EdgeInsets.symmetric(horizontal: 9))
                            .make();
                      }),

                  20.heightBox,

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(
                        3,
                        (index) => homeButton(
                            height: context.screenHeight * 0.1,
                            width: context.screenWidth / 3.5,
                            icon: index == 0
                                ? SvgPicture.asset(tCategory,
                                    height: 35,
                                    colorFilter: const ColorFilter.mode(
                                        Vx.orange500, BlendMode.srcIn))
                                : index == 1
                                    ? SvgPicture.asset(topBrand,
                                        height: 35,
                                        colorFilter: const ColorFilter.mode(
                                            Vx.cyan600, BlendMode.srcIn))
                                    : SvgPicture.asset(topSeller,
                                        height: 30,
                                        colorFilter: const ColorFilter.mode(
                                            Vx.yellow500, BlendMode.srcIn)),
                            title: index == 0
                                ? topCategory
                                : index == 1
                                    ? brand
                                    : topSellers)),
                  ),
                  20.heightBox,

                  // Feature Categories code
                  Align(
                      alignment: Alignment.centerLeft,
                      child:
                          featureCategory.text.black.extraBold.size(18).make()),

                  20.heightBox,
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    child: Row(
                      children: List.generate(
                          3,
                          (index) => Column(
                                children: [
                                  featuredButton(
                                      icon: featuredImages1[index],
                                      title: featuredTitles1[index]),
                                  10.heightBox,
                                  featuredButton(
                                      icon: featuredImages2[index],
                                      title: featuredTitles2[index]),
                                ],
                              )).toList(),
                    ),
                  ),

                  //Featured Products code
                  20.heightBox,
                  Container(
                    padding: const EdgeInsets.all(12),
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(backgroundImage),
                        fit: BoxFit.fill,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        featuredProducts.text.semiBold.black.size(18).make(),
                        10.heightBox,
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          child: Row(
                            children: List.generate(
                                6,
                                (index) => Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Image.asset(
                                          imgP5,
                                          width: 150,
                                          fit: BoxFit.cover,
                                        ),
                                        10.heightBox,
                                        "Combo Pack"
                                            .text
                                            .semiBold
                                            .gray600
                                            .make(),
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
                                        .margin(const EdgeInsets.symmetric(
                                            horizontal: 4))
                                        .make()),
                          ),
                        ),
                      ],
                    ),
                  ),
                  20.heightBox,

                  // third Swiper ..
                  VxSwiper.builder(
                      aspectRatio: 16 / 9,
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 3),
                      enlargeCenterPage: true,
                      height: 150,
                      itemCount: secondSliderList.length,
                      itemBuilder: (context, index) {
                        return Image.asset(
                          secondSliderList[index],
                          fit: BoxFit.fill,
                        )
                            .box
                            .rounded
                            .clip(Clip.antiAlias)
                            .margin(const EdgeInsets.symmetric(horizontal: 9))
                            .make();
                      }),
                  20.heightBox,
                  Align(
                      alignment: Alignment.centerLeft,
                      child: allProducts.text.black.extraBold.size(18).make()),
                  20.heightBox,

                  // all products code...using grid view
                  GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 6,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 8,
                              crossAxisSpacing: 8,
                              mainAxisExtent: 300),
                      itemBuilder: (context, index) {
                        return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                              Image.asset(
                                imgP3,
                                width: 200,
                                height: 200,
                                fit: BoxFit.cover,
                              ),
                              const Spacer(),
                              "Premium Fabric".text.semiBold.gray600.make(),
                              10.heightBox,
                              "\$ 700".text.extraBold.size(16).orange600.make(),
                            ])
                            .box
                            .white
                            .margin(const EdgeInsets.symmetric(horizontal: 4))
                            .padding(const EdgeInsets.all(12))
                            .roundedSM
                            .make();
                      })
                ],
              ),
            ),
          )
        ],
      )),
    );
  }
}
