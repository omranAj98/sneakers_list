import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sneakers_list/core/constants/app_icons.dart';
import 'package:sneakers_list/core/constants/app_strings.dart';
import 'package:sneakers_list/presentation/controllers/main_controller.dart';
import 'package:sneakers_list/presentation/pages/cart_page.dart';
import 'package:sneakers_list/presentation/pages/favorite_page.dart';
import 'package:sneakers_list/presentation/pages/home_page.dart';
import 'package:sneakers_list/presentation/pages/account_page.dart';
import 'package:sneakers_list/presentation/widgets/bottom_navigation_bar.dart';

class MainView extends GetView<MainController> {
  final List<Widget> pages = [
    HomePage(),
    FavoritePage(),
    CartPage(),
    AccountPage(),
  ];

  MainView({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: WgtBottomNavigationBar(
          items: [
            BottomNavItem(icon: AppIcons.home, label: AppStrings.home),
            BottomNavItem(icon: AppIcons.favorite, label: AppStrings.favorite),
            BottomNavItem(icon: AppIcons.cart, label: AppStrings.cart),
            BottomNavItem(icon: AppIcons.account, label: AppStrings.account),
          ],
          backgroundColor: colorScheme.onPrimary, 
          activeColor: colorScheme.primary, 
          inactiveColor: colorScheme.onSurface,
        ),
        body: Obx(() => pages[controller.selectedIndex.value]),
      ),
    );
  }
}
