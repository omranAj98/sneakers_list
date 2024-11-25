// lib/presentation/controllers/sneaker_controller.dart
import 'package:get/get.dart';
import '../../domain/entities/sneaker.dart';
import '../../domain/usecases/fetch_sneakers.dart';

class SneakerController extends GetxController {
  final FetchSneakersUseCase fetchSneakersUseCase;

  SneakerController({required this.fetchSneakersUseCase});

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
      final data = await fetchSneakersUseCase();
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
