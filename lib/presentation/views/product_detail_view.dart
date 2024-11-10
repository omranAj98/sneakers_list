import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sneakers_list/core/constants/app_strings.dart';
import 'package:sneakers_list/domain/entities/sneaker.dart';
import 'package:sneakers_list/presentation/controllers/cart_controller.dart';

class ProductDetailView extends StatelessWidget {
  const ProductDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CartController cartController = Get.find<CartController>();
    final Sneaker sneaker = Get.arguments as Sneaker;

    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(sneaker.name),
        backgroundColor: colorScheme.primary,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildImageCarousel(sneaker.images),
            SizedBox(height: 16),
            // Display sneaker name
            Text(
              sneaker.name,
              style: textTheme.headlineMedium?.copyWith(
                color: colorScheme.onSurface,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              sneaker.brand,
              style: textTheme.bodyLarge?.copyWith(
                color: colorScheme.onSecondary,
              ),
            ),
            SizedBox(height: 8),
            Text(
              '\$${sneaker.price.toStringAsFixed(2)}',
              style: textTheme.displayMedium?.copyWith(
                color: colorScheme.primary,
              ),
            ),
            SizedBox(height: 16),
            Text(
              AppStrings.description,
              style: textTheme.displayMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: colorScheme.onSurface,
              ),
            ),
            SizedBox(height: 8),
            Text(
              sneaker.description,
              style: textTheme.bodySmall?.copyWith(
                color: colorScheme.onSurface,
              ),
            ),
            SizedBox(height: 16),
            // Add to cart button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  cartController.addToCart(sneaker);
                  Get.snackbar(
                    AppStrings.success,
                    '${sneaker.name} ${AppStrings.hasBeenAddedToCart}.',
                    snackPosition: SnackPosition.BOTTOM,
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: colorScheme.surface,
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Text(
                  AppStrings.addToCart,
                  style: textTheme.bodyMedium?.copyWith(
                    color: colorScheme.primary,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImageCarousel(List<String> images) {
    return SizedBox(
      height: 300,
      child: PageView.builder(
        itemCount: images.length,
        itemBuilder: (context, index) {
          final imageUrl = images[index];
          return Image.network(
            imageUrl,
            fit: BoxFit.cover,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return Center(child: CircularProgressIndicator());
            },
            errorBuilder: (context, error, stackTrace) {
              return Center(child: Icon(Icons.broken_image));
            },
          );
        },
      ),
    );
  }
}
