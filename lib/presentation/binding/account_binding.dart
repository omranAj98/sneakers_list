import 'package:get/get.dart';
import 'package:sneakers_list/presentation/controllers/account_controller.dart';

class AccountBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AccountController>(() => AccountController());

  }
}
