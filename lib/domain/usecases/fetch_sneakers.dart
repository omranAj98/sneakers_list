import '../entities/sneaker.dart';
import '../repositories/sneaker_repository.dart';

class FetchSneakersUseCase {
  final SneakerRepository repository;

  FetchSneakersUseCase(this.repository);

  Future<List<Sneaker>> call() async {
    return await repository.fetchSneakers();
  }
}
