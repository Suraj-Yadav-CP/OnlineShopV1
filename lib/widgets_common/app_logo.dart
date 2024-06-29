import 'package:flutter/material.dart';
import 'package:online_shop/utility/app_images.dart';
import 'package:velocity_x/velocity_x.dart';

Widget appLogoWidget() {
  // using velocity x
  return Image.asset(appLogo).box.size(77, 77).roundedFull.make();
}
