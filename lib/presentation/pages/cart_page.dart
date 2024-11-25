import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sneakers_list/core/constants/app_strings.dart';
import '../../presentation/controllers/cart_controller.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CartController cartController = Get.find<CartController>();
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppStrings.cart,
          style:
              textTheme.headlineSmall?.copyWith(color: colorScheme.onPrimary),
        ),
        backgroundColor: colorScheme.primary,
        actions: [
          IconButton(
            icon: Icon(Icons.delete_outline),
            onPressed: () {
              Get.defaultDialog(
                buttonColor: colorScheme.primary,
                cancelTextColor: colorScheme.onSurface,
                title: AppStrings.clearCart,
                middleText: AppStrings.areYouSureWantToClearCart,
                textCancel: AppStrings.no,
                textConfirm: AppStrings.yes,
                confirmTextColor: colorScheme.onPrimary,
                onConfirm: () {
                  cartController.clearCart();
                  Get.back();
                },
              );
            },
          ),
        ],
      ),
      body: Obx(() {
        if (cartController.cartItems.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.shopping_cart_outlined,
                  size: 100,
                  color: colorScheme.onSurface.withOpacity(0.2),
                ),
                SizedBox(height: 20),
                Text(
                  AppStrings.cartIsEmpty,
                  style: textTheme.displayMedium?.copyWith(
                    color: colorScheme.onSurface.withOpacity(0.5),
                  ),
                ),
              ],
            ),
          );
        }
        return ListView.builder(
          padding: EdgeInsets.all(16),
          itemCount: cartController.cartItems.length,
          itemBuilder: (context, index) {
            final cartItem = cartController.cartItems[index];
            return Card(
              margin: EdgeInsets.symmetric(vertical: 8),
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: EdgeInsets.all(12),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        cartItem.sneaker.images.isNotEmpty
                            ? cartItem.sneaker.images[0]
                            : '',
                        fit: BoxFit.cover,
                        width: 80,
                        height: 80,
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            cartItem.sneaker.name,
                            style: textTheme.displayMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: colorScheme.onSurface,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            '\$${cartItem.sneaker.price.toStringAsFixed(2)}',
                            style: textTheme.bodyMedium?.copyWith(
                              color: colorScheme.primary,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Quantity Controls
                    Column(
                      children: [
                        IconButton(
                          icon: Icon(Icons.add_circle_outline),
                          color: colorScheme.primary,
                          onPressed: () {
                            cartController.updateQuantity(
                              cartItem.sneaker,
                              cartItem.quantity + 1,
                            );
                          },
                        ),
                        Text(
                          cartItem.quantity.toString(),
                          style: textTheme.bodyLarge?.copyWith(
                            color: colorScheme.onSurface,
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.remove_circle_outline),
                          color: colorScheme.primary,
                          onPressed: () {
                            cartController.updateQuantity(
                              cartItem.sneaker,
                              cartItem.quantity - 1,
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }),
      bottomNavigationBar: Obx(() {
        return Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: colorScheme.surface,
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                offset: Offset(0, -2),
                blurRadius: 6,
              ),
            ],
          ),
          child: SafeArea(
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    '${AppStrings.total}: \$${cartController.totalPrice.toStringAsFixed(2)}',
                    style: textTheme.displayMedium?.copyWith(
                      color: colorScheme.onSurface,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Get.snackbar(
                      AppStrings.checkout,
                      AppStrings.proceedingToCheckout,
                      snackPosition: SnackPosition.BOTTOM,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 12,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Text(
                    AppStrings.checkout,
                    style: textTheme.bodyLarge?.copyWith(
                      color: colorScheme.onSurface,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
