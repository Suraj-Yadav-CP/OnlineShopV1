import 'package:flutter/cupertino.dart';
import 'package:velocity_x/velocity_x.dart';

Widget homeButton({width, height, icon, String? title, onPress}) {
  return Expanded(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        10.heightBox,
        icon,
        10.heightBox,
        title!.text.semiBold.size(12).gray700.make(),
        10.heightBox
      ],
    ),
  ).box.rounded.white.size(width, height).make();
}
