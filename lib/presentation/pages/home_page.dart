import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sneakers_list/presentation/controllers/home_controller.dart';
import 'package:sneakers_list/presentation/pages/products_list_page.dart';
import 'package:sneakers_list/presentation/widgets/new_arrival.dart';
import 'package:sneakers_list/presentation/widgets/popular_list.dart';
import 'package:sneakers_list/presentation/widgets/search_field.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30, top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            WgtSearchField(),
            SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    WgtNewArrival(),
                    SizedBox(height: 20),
                    WgtPopularList(),
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxHeight: MediaQuery.of(context).size.height * 0.6,
                      ),
                      child: ProductPage(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
