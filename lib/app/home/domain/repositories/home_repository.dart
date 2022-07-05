import 'package:movie2/app/home/domain/entities/elencoModel.dart';
import 'package:movie2/app/home/domain/entities/movieModel.dart';
import 'package:dartz/dartz.dart';
import 'package:movie2/app/home/domain/entities/trailers.dart';

import '../../../core/shared/errors/failure.dart';
import '../entities/provider.dart';

abstract class IHomeRepository {
  Future<Either<Failure, List<Movie>>> getMovies();
  Future<Either<Failure, List<Elenco>>> getElencoMovie(idMovie);
  Future<Either<Failure, Provider>> getWatchIn(idMovie);
  Future<Either<Failure, List<Trailer>>> getTrailerMovie(idMovie);
}
