import 'package:dartz/dartz.dart';

import '../../../core/shared/errors/failure.dart';
import '../../../core/shared/usecase/usecase_interface_sync.dart';
import '../entities/movieModel.dart';
import '../repositories/home_repository.dart';

class GetMoviesUseCase extends UsecaseSyncNoParams<List<Movie>> {
  final IHomeRepository repository;

  GetMoviesUseCase(this.repository);

  @override
  Future<Either<Failure, List<Movie>>> call() async {
    try {
      var result = await repository.getMovies();
      return result;
    } catch (e) {
      rethrow;
    }
  }
}
