import 'package:get/get.dart';
import 'package:sneakers_list/presentation/binding/cart_binding.dart';
import 'package:sneakers_list/presentation/binding/main_binding.dart';
import 'package:sneakers_list/presentation/pages/cart_page.dart';
import 'package:sneakers_list/presentation/views/main_view.dart';
import 'package:sneakers_list/presentation/views/product_detail_view.dart';
import 'package:sneakers_list/presentation/views/sneaker_list_view.dart';

class AppRoutes {
  static const String home = '/home';
  static const String sneakerList = '/sneaker_list';
  static const String sneakerDetail = '/sneaker_detail';
  static const String cart = '/cart';

  static List<GetPage> pages = [
    GetPage(
      name: home,
      page: () => MainView(),
      binding: MainBinding(),
    ),
    GetPage(
      name: sneakerList,
      page: () => SneakerListView(),
      binding: MainBinding(),
    ),
    GetPage(
      name: sneakerDetail,
      page: () => ProductDetailView(),
      binding: MainBinding(),
    ),
    GetPage(
      name: AppRoutes.cart,
      page: () => CartPage(),
      binding: CartBinding(),
    ),
  ];
}
