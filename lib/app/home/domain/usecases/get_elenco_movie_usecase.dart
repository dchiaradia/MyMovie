import 'package:dartz/dartz.dart';
import 'package:movie2/app/home/domain/entities/elencoModel.dart';

import '../../../core/shared/errors/failure.dart';
import '../../../core/shared/usecase/usecase_interface_sync.dart';
import '../repositories/home_repository.dart';

class GetElencoMovieUseCase extends UsecaseSync<List<Elenco>, int> {
  final IHomeRepository repository;

  GetElencoMovieUseCase(this.repository);

  @override
  Future<Either<Failure, List<Elenco>>> call(int idMovie) async {
    try {
      var result = await repository.getElencoMovie(idMovie);
      return result;
    } catch (e) {
      rethrow;
    }
  }
}
