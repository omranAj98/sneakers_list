import 'package:get/get.dart';
import '../../domain/entities/sneaker.dart';
import '../../domain/repositories/sneaker_repository.dart';

class SneakerController extends GetxController {
  final SneakerRepository repository;

  SneakerController({required this.repository});

  var sneakers = <Sneaker>[].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    fetchSneakers();
    super.onInit();
  }

  void fetchSneakers() async {
    try {
      isLoading(true);
      final data = await repository.fetchSneakers();
      sneakers.value = data;
    } catch (e) {
      SnackbarController(GetSnackBar(
        message: "$e",
      ));
    } finally {
      isLoading(false);
    }
  }
}
