import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sneakers_list/core/constants/app_icons.dart';
import 'package:sneakers_list/core/constants/app_strings.dart';
import 'package:sneakers_list/presentation/controllers/search_controller.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WgtSearchField extends GetView<SearchShoeController> {
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final screenWidth = MediaQuery.of(context).size.width;
    final searchWidth = screenWidth * 0.5;

    return Container(
      height: 34,
      width: searchWidth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: colorScheme.onPrimary,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: TextField(
              controller: controller.searchController,
              style: textTheme.bodyMedium?.copyWith(
                color: colorScheme.onSurface,
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                fillColor: Colors.transparent,
                alignLabelWithHint: true,
                hintText: AppStrings.search,
                hintStyle: textTheme.bodyMedium?.copyWith(
                  color: colorScheme.onSurface.withOpacity(0.6),
                ),
                contentPadding:
                    const EdgeInsets.only(top: 10, bottom: 10, left: 15),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: SvgPicture.asset(
              AppIcons.search,
              colorFilter: ColorFilter.mode(
                colorScheme.onSurface, // Theme-aware icon color
                BlendMode.srcIn,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
