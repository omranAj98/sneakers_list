import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sneakers_list/core/constants/app_strings.dart';
import 'package:sneakers_list/core/routes/routes.dart';
import 'package:sneakers_list/presentation/controllers/cart_controller.dart';
import 'package:sneakers_list/presentation/controllers/sneaker_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sneakers_list/presentation/widgets/add_to_cart_button.dart';

class WgtPopularList extends StatefulWidget {
  const WgtPopularList({Key? key}) : super(key: key);

  @override
  _WgtPopularListState createState() => _WgtPopularListState();
}

class _WgtPopularListState extends State<WgtPopularList> {
  final SneakerController sneakerController = Get.find<SneakerController>();
  final CartController cartController = Get.find<CartController>();

  @override
  void initState() {
    super.initState();
    sneakerController.fetchSneakers();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: EdgeInsets.only(top: 15),
      child: Obx(() {
        if (sneakerController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }

        if (sneakerController.sneakers.isEmpty) {
          return Center(child: Text(AppStrings.noSneakerFound));
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppStrings.popular,
              style: textTheme.headlineMedium?.copyWith(
                color: colorScheme.onSurface,
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 15),
              height: screenHeight * 0.15,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                // padding: EdgeInsets.only(left: 30),
                itemCount: sneakerController.sneakers.length,
                itemBuilder: (context, index) {
                  final sneaker = sneakerController.sneakers[index];
                  return GestureDetector(
                    onTap: () => Get.toNamed(
                      AppRoutes.sneakerDetail,
                      arguments: sneaker,
                    ),
                    child: Container(
                      width: screenWidth * 0.8,
                      margin: EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                        color: colorScheme.onPrimary,
                        borderRadius: BorderRadius.circular(23),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: screenHeight * 0.11,
                            margin: EdgeInsets.all(screenHeight * 0.01),
                            decoration: BoxDecoration(
                              color: Colors.grey[100],
                              borderRadius: BorderRadius.circular(23),
                            ),
                            child: Center(
                              child: Image.network(
                                sneaker.images[0],
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        sneaker.name,
                                        overflow: TextOverflow.ellipsis,
                                        style: textTheme.displayLarge?.copyWith(
                                          color: colorScheme.onSurface,
                                        ),
                                      ),
                                      SizedBox(height: 4.h),
                                      Text(
                                        sneaker.brand,
                                        overflow: TextOverflow.ellipsis,
                                        style: textTheme.bodyLarge?.copyWith(
                                          color: colorScheme.onSecondary,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        '\$${sneaker.price.toStringAsFixed(2)}',
                                        style: textTheme.bodyLarge?.copyWith(
                                          fontWeight: FontWeight.w600,
                                          color: colorScheme.primary,
                                        ),
                                      ),
                                      Spacer(),
                                      WgtAddToCartButton(
                                        onPressed: () {
                                          cartController.addToCart(sneaker);
                                          Get.snackbar(
                                            AppStrings.success,
                                            '${sneaker.name} ${AppStrings.hasBeenAddedToCart}.',
                                            snackPosition: SnackPosition.BOTTOM,
                                          );
                                        },
                                        buttonText: AppStrings.addToCart,
                                        backgroundColor: colorScheme.primary,
                                        textColor: colorScheme.onPrimary,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        );
      }),
    );
  }
}
