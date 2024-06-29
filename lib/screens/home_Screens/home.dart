import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_shop/controllers/home_controller.dart';
import 'package:online_shop/screens/account_screen/account_screen.dart';
import 'package:online_shop/screens/cart_screen/cart_screen.dart';
import 'package:online_shop/screens/category_screen/category_screen.dart';
import 'package:online_shop/screens/home_Screens/home_screen.dart';
import 'package:online_shop/utility/app_strings.dart';
import 'package:velocity_x/velocity_x.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    //init home controller
    var controller = Get.put(HomeController());

    // list for bottom nav items
    var navBarItems = [
      const BottomNavigationBarItem(icon: Icon(Icons.home), label: home),
      const BottomNavigationBarItem(
          icon: Icon(Icons.category), label: categories),
      const BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart), label: cart),
      const BottomNavigationBarItem(icon: Icon(Icons.person), label: account)
    ];

    var navBody = [
      const HomeScreen(),
      const CategoryScreen(),
      const CartScreen(),
      const AccountScreen()
    ];

    return Scaffold(
      body: Column(children: [
        Obx(() => Expanded(
              child: navBody.elementAt(controller.currentNavIndex.value),
            ))
      ]),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: controller.currentNavIndex.value,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.green,
          unselectedIconTheme: const IconThemeData(size: 20, color: Vx.gray700),
          selectedIconTheme: const IconThemeData(size: 30, color: Colors.green),
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
          backgroundColor: Vx.white,
          items: navBarItems,
          onTap: (value) {
            controller.currentNavIndex.value = value;
          },
        ),
      ),
    );
  }
}
