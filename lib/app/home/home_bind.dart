import 'package:get/get.dart';
import 'package:movie2/app/home/data/datasources/home_datasource_implementation.dart';
import 'package:movie2/app/home/data/datasources/home_datasource_interface.dart';
import 'package:movie2/app/home/data/repositories/home_repository.dart';
import 'package:movie2/app/home/domain/repositories/home_repository.dart';
import 'package:movie2/app/home/domain/usecases/get_elenco_movie_usecase.dart';
import 'package:movie2/app/home/domain/usecases/get_movies_usecase.dart';
import 'package:movie2/app/home/domain/usecases/get_trailer_movie_usecase.dart';
import 'package:movie2/app/home/domain/usecases/get_watchIn_movie_usecase.dart';
import 'package:movie2/app/home/presenter/controllers/home_controller.dart';
import 'package:movie2/app/home/presenter/controllers/movie_detail_controller.dart';

import '../core/shared/http_client/http_implementation.dart';

class HomeBind extends Bindings {
  @override
  void dependencies() {
    final IHomeDatasource homeDatasource =
        HomeDatasource(Get.find<HttpImplementation>());
    final IHomeRepository homeRepository = HomeRepository(homeDatasource);
    final GetMoviesUseCase getMoviesUseCase = GetMoviesUseCase(homeRepository);
    final GetElencoMovieUseCase getElencoMovieUseCase =
        GetElencoMovieUseCase(homeRepository);
    final GetWatchInMovieUseCase getWatchInMovieUseCase =
        GetWatchInMovieUseCase(homeRepository);
    final GetTrailerMovieUseCase getTrailerMovieUseCase =
        GetTrailerMovieUseCase(homeRepository);

    Get.lazyPut(() => HomeController(
          getMoviesUseCase,
        ));

    Get.lazyPut(() => MovieDetailController(
          getElencoMovieUseCase,
          getWatchInMovieUseCase,
          getTrailerMovieUseCase,
        ));
  }
}
