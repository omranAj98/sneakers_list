import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sneakers_list/core/constants/app_icons.dart';
import 'package:sneakers_list/core/constants/app_strings.dart';
import 'package:sneakers_list/core/routes/routes.dart';
import 'package:sneakers_list/domain/entities/sneaker.dart';
import 'package:sneakers_list/presentation/controllers/cart_controller.dart';
import 'package:sneakers_list/presentation/views/product_detail_view.dart';

class WgtProductCard extends StatelessWidget {
  final Sneaker sneaker;

  WgtProductCard({
    Key? key,
    required this.sneaker,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CartController cartController = Get.find<CartController>();
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    final String mainImage = sneaker.images.isNotEmpty ? sneaker.images[0] : '';

    return GestureDetector(
      onTap: () => Get.toNamed(
        AppRoutes.sneakerDetail,
        arguments: sneaker,
      ),
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: colorScheme.onPrimary,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                constraints: BoxConstraints(
                  minHeight: 50, // Set your desired minimum height here
                ),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(15),
                ),
                clipBehavior: Clip.hardEdge,
                child: mainImage.isNotEmpty
                    ? Image.network(
                        mainImage,
                        fit: BoxFit.contain,
                        width: double.infinity,
                      )
                    : Container(),
              ),
            ),
            SizedBox(height: 10),
            Text(
              sneaker.name,
              style: textTheme.displaySmall?.copyWith(
                color: colorScheme.onSurface,
              ),
            ),
            SizedBox(height: 8),
            Row(
              children: [
                SizedBox(width: 4),
                Text(
                  '\$${sneaker.price.toStringAsFixed(2)}',
                  style: textTheme.bodyMedium?.copyWith(
                    color: colorScheme.onSecondary,
                  ),
                ),
                Spacer(),
                Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    color: colorScheme.surface,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: colorScheme.onSecondary,
                        blurRadius: 0.2,
                        offset: Offset(0, 0),
                      ),
                    ],
                  ),
                  child: IconButton(
                    icon: SvgPicture.asset(
                      AppIcons.favorite,
                      colorFilter: ColorFilter.mode(
                          colorScheme.onSecondary, BlendMode.srcIn),
                    ),
                    iconSize: 24,
                    onPressed: () {},
                  ),
                )
              ],
            ),
            SizedBox(height: 6),
            Center(
              child: TextButton(
                onPressed: () {
                  cartController.addToCart(sneaker);
                  Get.snackbar(
                    AppStrings.success,
                    '${sneaker.name} ${AppStrings.hasBeenAddedToCart}.',
                    snackPosition: SnackPosition.BOTTOM,
                  );
                },
                style: TextButton.styleFrom(
                  backgroundColor: colorScheme.onSecondary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  shadowColor: Colors.black12,
                  elevation: 2,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                ),
                child: Text(
                  AppStrings.addToCart,
                  style: textTheme.bodyMedium
                      ?.copyWith(color: colorScheme.onPrimary),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
