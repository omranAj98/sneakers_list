import '../entities/sneaker.dart';
abstract class SneakerRepository {
  Future<List<Sneaker>> fetchSneakers();
}
