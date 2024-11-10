import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class SearchShoeController extends GetxController {
  TextEditingController searchController = TextEditingController();

  @override
  void onClose() {
    searchController.dispose(); // Dispose controller when not needed
    super.onClose();
  }
}
