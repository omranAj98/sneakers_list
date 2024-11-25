import 'package:get/get.dart';
import 'package:sneakers_list/data/repositories/sneaker_repository_impl.dart';
import 'package:sneakers_list/data/sources/sneaker_local_data_source.dart';
import 'package:sneakers_list/domain/usecases/fetch_sneakers.dart';
import 'package:sneakers_list/domain/repositories/sneaker_repository.dart';
import 'package:sneakers_list/presentation/controllers/cart_controller.dart';
import 'package:sneakers_list/presentation/controllers/main_controller.dart';
import 'package:sneakers_list/presentation/controllers/search_controller.dart';
import 'package:sneakers_list/presentation/controllers/sneaker_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainController>(() => MainController());

    Get.lazyPut<SearchShoeController>(() => SearchShoeController());

    Get.lazyPut<SneakerLocalDataSource>(
      () => SneakerLocalDataSourceImpl(),
    );

    Get.lazyPut<CartController>(() => CartController());

    Get.lazyPut<SneakerRepository>(
      () => SneakerRepositoryImpl(
        localDataSource: Get.find<SneakerLocalDataSource>(),
      ),
    );

    Get.lazyPut<FetchSneakersUseCase>(
      () => FetchSneakersUseCase(Get.find<SneakerRepository>()),
    );

    Get.lazyPut<SneakerController>(
      () => SneakerController(
          fetchSneakersUseCase: Get.find<FetchSneakersUseCase>()),
    );

    // Get.find<SneakerController>().fetchSneakers();
  }
}
