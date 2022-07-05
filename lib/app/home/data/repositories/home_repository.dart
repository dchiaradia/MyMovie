import 'package:dartz/dartz.dart';
import 'package:movie2/app/home/domain/entities/elencoModel.dart';
import 'package:movie2/app/home/domain/entities/movieModel.dart';
import 'package:movie2/app/home/domain/entities/trailers.dart';

import '../../../core/shared/errors/exceptions.dart';
import '../../../core/shared/errors/failure.dart';
import '../../domain/entities/provider.dart';
import '../../domain/repositories/home_repository.dart';
import '../datasources/home_datasource_interface.dart';

class HomeRepository implements IHomeRepository {
  final IHomeDatasource datasource;

  HomeRepository(this.datasource);

  @override
  Future<Either<Failure, List<Movie>>> getMovies() async {
    try {
      final result = await datasource.getMovies();
      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<Elenco>>> getElencoMovie(idMovie) async {
    try {
      final result = await datasource.getElencoMovie(idMovie);
      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Provider>> getWatchIn(idMovie) async {
    try {
      final result = await datasource.getWatchIn(idMovie);
      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<Trailer>>> getTrailerMovie(idMovie) async {
    try {
      final result = await datasource.getTrailerMovie(idMovie);
      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
