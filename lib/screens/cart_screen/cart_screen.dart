import 'package:flutter/material.dart';
import 'package:online_shop/utility/app_colour.dart';
import 'package:online_shop/utility/app_strings.dart';
import 'package:velocity_x/velocity_x.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: primaryColor,
        title: cart.text.bold.black.make(),
      ),
      body: Container(
        color: lightBgColor,
        child: "Cart is empty".text.bold.black.makeCentered(),
      ),
    );
  }
}
