import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

Widget button({onPress, color, textColor, String? title}) {
  return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: color,
          padding: const EdgeInsets.all(12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          )),
      onPressed: onPress,
      child: title!.text.color(textColor).bold.make());
}
