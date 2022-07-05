import 'package:dartz/dartz.dart';
import 'package:movie2/app/home/domain/entities/trailers.dart';

import '../../../core/shared/errors/failure.dart';
import '../../../core/shared/usecase/usecase_interface_sync.dart';
import '../repositories/home_repository.dart';

class GetTrailerMovieUseCase extends UsecaseSync<List<Trailer>, int> {
  final IHomeRepository repository;

  GetTrailerMovieUseCase(this.repository);

  @override
  Future<Either<Failure, List<Trailer>>> call(int idMovie) async {
    try {
      var result = await repository.getTrailerMovie(idMovie);
      return result;
    } catch (e) {
      rethrow;
    }
  }
}
