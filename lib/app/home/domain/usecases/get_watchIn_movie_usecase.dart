import 'package:dartz/dartz.dart';

import '../../../core/shared/errors/failure.dart';
import '../../../core/shared/usecase/usecase_interface_sync.dart';
import '../entities/provider.dart';
import '../repositories/home_repository.dart';

class GetWatchInMovieUseCase extends UsecaseSync<Provider, int> {
  final IHomeRepository repository;

  GetWatchInMovieUseCase(this.repository);

  @override
  Future<Either<Failure, Provider>> call(int idMovie) async {
    try {
      var result = await repository.getWatchIn(idMovie);
      return result;
    } catch (e) {
      rethrow;
    }
  }
}
