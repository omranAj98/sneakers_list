import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sneakers_list/presentation/controllers/main_controller.dart';

class WgtBottomNavigationBar extends GetView<MainController> {
  final List<BottomNavItem> items;
  final Color backgroundColor;
  final Color activeColor;
  final Color inactiveColor;

  WgtBottomNavigationBar({
    Key? key,
    required this.items,
    this.backgroundColor = Colors.white,
    this.activeColor = Colors.blue,
    this.inactiveColor = Colors.grey,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      color: backgroundColor,
      child: Obx(() => Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(items.length, (index) {
              final item = items[index];
              final isSelected = controller.selectedIndex.value == index;
              return GestureDetector(
                  onTap: () => controller.changeTab(index),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          decoration: BoxDecoration(
                            color: isSelected ? activeColor : backgroundColor,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          height: 30,
                          width: 30,
                          alignment: Alignment.center,
                          child: SvgPicture.asset(
                            item.icon,
                            colorFilter: ColorFilter.mode(
                              isSelected ? backgroundColor : inactiveColor,
                              BlendMode.srcIn,
                            ),
                            width: 24,
                            height: 24,
                          )),
                      SizedBox(height: 4),
                      isSelected
                          ? Text(
                              item.label,
                              style: TextStyle(
                                color: activeColor,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            )
                          : SizedBox.shrink()
                    ],
                  ));
            }),
          )),
    );
  }
}

class BottomNavItem {
  final String icon;
  final String label;

  BottomNavItem({
    required this.icon,
    required this.label,
  });
}
