import '../../domain/entities/sneaker.dart';
import '../../domain/repositories/sneaker_repository.dart';
import '../sources/sneaker_local_data_source.dart';

class SneakerRepositoryImpl implements SneakerRepository {
  final SneakerLocalDataSource localDataSource;

  SneakerRepositoryImpl({required this.localDataSource});

  @override
  Future<List<Sneaker>> fetchSneakers() async {
    final sneakerModels = await localDataSource.fetchSneakers();
    
    return sneakerModels.map((model) => model.toEntity()).toList();
  }
}
