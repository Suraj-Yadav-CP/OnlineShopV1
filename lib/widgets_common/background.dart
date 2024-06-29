import 'package:flutter/cupertino.dart';
import 'package:online_shop/utility/app_images.dart';

Widget bgWidget({Widget? child}) {
  return Container(
    decoration: const BoxDecoration(
      image: DecorationImage(image: AssetImage(bg), fit: BoxFit.fill),
    ),
    child: child,
  );
}
