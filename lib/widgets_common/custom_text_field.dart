import 'package:flutter/material.dart';
import 'package:online_shop/utility/app_colour.dart';
import 'package:velocity_x/velocity_x.dart';

Widget customTextField({String? title, String? hint, Icon? icon, controller, isPass}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      title!.text.color(Colors.black).semiBold.make(),
      5.heightBox,
      TextFormField(
        obscureText: isPass,
        controller: controller,
        decoration: InputDecoration(
            hintStyle: const TextStyle(
              color: Colors.grey,
            ),
            hintText: hint,
            isDense: true,
            fillColor: Vx.gray100,
            filled: true,
            prefixIcon: icon,
            contentPadding: const EdgeInsets.all(15.0),
            border: InputBorder.none,
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: primaryColor))),
      ),
      5.heightBox
    ],
  );
}
