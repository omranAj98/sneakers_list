import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sneakers_list/core/constants/app_strings.dart';

class WgtNewArrival extends StatelessWidget {
  const WgtNewArrival({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    final screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.newArrivals,
            style: textTheme.headlineMedium?.copyWith(
              color: colorScheme.onSurface,
            ),
          ),
          const SizedBox(height: 15),
          FutureBuilder(
            future: precacheImage(
              NetworkImage("https://i.ibb.co/3pQbR8P/Nike-Cover-HD.png"),
              context,
            ),
            builder: (context, snapshot) {
              // Image Widget
              Widget imageWidget;
              if (snapshot.connectionState == ConnectionState.done) {
                // Image has fully loaded
                imageWidget = ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child: SizedBox(
                    height: 200,
                    width: screenWidth,
                    child: ShaderMask(
                      shaderCallback: (bounds) => LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withOpacity(1),
                        ],
                      ).createShader(bounds),
                      blendMode: BlendMode.dstIn,
                      child: Image.network(
                        "https://i.ibb.co/3pQbR8P/Nike-Cover-HD.png",
                        fit: BoxFit.cover,
                        width: screenWidth,
                      ),
                    ),
                  ),
                );
              } else {
                // Show a blurred placeholder while loading
                imageWidget = ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child: Stack(
                    children: [
                      Container(
                        color: colorScheme.surface,
                        width: screenWidth,
                        height: 200,
                      ),
                      BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                        child: Container(
                          color: Colors.transparent,
                        ),
                      ),
                    ],
                  ),
                );
              }

              // Overlay content
              Widget overlayContent;
              if (snapshot.connectionState == ConnectionState.done) {
                overlayContent = Positioned(
                  bottom: 15,
                  left: 0,
                  right: 0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Starting From",
                        style: textTheme.bodySmall?.copyWith(
                          color: colorScheme.onSurface,
                        ),
                      ),
                      Text(
                        "AED 249",
                        style: textTheme.bodySmall?.copyWith(
                          color: colorScheme.onSurface,
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                overlayContent = Center(
                  child: CircularProgressIndicator(),
                );
              }

              return Stack(
                children: [
                  imageWidget,
                  overlayContent,
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
