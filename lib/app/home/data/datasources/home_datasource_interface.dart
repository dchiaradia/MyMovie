import 'package:movie2/app/home/domain/entities/elencoModel.dart';
import 'package:movie2/app/home/domain/entities/movieModel.dart';
import 'package:movie2/app/home/domain/entities/trailers.dart';

import '../../domain/entities/provider.dart';

abstract class IHomeDatasource {
  Future<List<Movie>> getMovies();
  Future<List<Elenco>> getElencoMovie(int idMovie);
  Future<Provider> getWatchIn(int idMovie);
  Future<List<Trailer>> getTrailerMovie(int idMovie);
}
