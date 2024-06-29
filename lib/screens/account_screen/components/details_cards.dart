import 'package:flutter/cupertino.dart';
import 'package:velocity_x/velocity_x.dart';

Widget detailsCards({width, String? count, String? title}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      count!.text.extraBold.gray700.size(16).make(),
      5.heightBox,
      title!.text.bold.gray700.size(12).make(),
    ],
  )
      .box
      .white
      .roundedSM
      .shadowSm
      .width(width)
      .height(70)
      .padding(const EdgeInsets.all(4))
      .make();
}
