import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Import GetX package
import 'package:sneakers_list/core/constants/app_strings.dart';
import 'package:sneakers_list/presentation/widgets/product_card.dart';
import 'package:sneakers_list/presentation/controllers/sneaker_controller.dart'; // Import the controller

class ProductPage extends StatelessWidget {
  ProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final SneakerController sneakerController = Get.find<SneakerController>();

    return Obx(() {
      if (sneakerController.isLoading.value) {
        return Center(child: CircularProgressIndicator());
      }

      if (sneakerController.sneakers.isEmpty) {        
        return Center(child: Text('No products available.'));
      }

      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 30),
          Text(
            AppStrings.productList,
            style: textTheme.displaySmall?.copyWith(
              color: colorScheme.onSurface,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 5),
          Container(
            color: colorScheme.primary,
            height: 1,
            width: 90,
          ),
          SizedBox(height: 15),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, 
                  mainAxisSpacing: 10, 
                  crossAxisSpacing: 10, 
                  childAspectRatio: 0.7, 
                ),
                itemCount: sneakerController.sneakers.length,
                itemBuilder: (context, index) {
                  return WgtProductCard(
                    sneaker: sneakerController.sneakers[index],
                  );
                },
              ),
            ),
          ),
        ],
      );
    });
  }
}
