import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:movie2/app/home/domain/entities/movieModel.dart';
import 'package:movie2/app/home/domain/entities/trailers.dart';
import 'package:movie2/app/home/domain/usecases/get_elenco_movie_usecase.dart';
import 'package:movie2/app/home/domain/usecases/get_trailer_movie_usecase.dart';
import 'package:movie2/app/home/domain/usecases/get_watchIn_movie_usecase.dart';

import '../../../core/shared/errors/exceptions.dart';
import '../../../core/widgets/myGetSnackBar/my_get_snackbar_widget.dart';
import '../../domain/entities/elencoModel.dart';
import '../../domain/entities/provider.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class MovieDetailController extends GetxController {
  /*####### VARIAVEIS DE CONTROLE DE ESTADO DE TELA ######*/
  final RxBool loading = true.obs;
  final RxBool onError = false.obs;
  List<Elenco> lstElenco = [];
  List<Trailer> lstTrailer = [];

  YoutubePlayerController? youtubeController;

  /*####### USECASES DA TELA ######*/
  final GetElencoMovieUseCase getElencoMovieUseCase;
  final GetWatchInMovieUseCase getWatchInMovieUseCase;
  final GetTrailerMovieUseCase getTrailerMovieUseCase;

  /*####### OUTRAS VARIAVEIS ######*/
  late Movie model = Get.arguments;

  Rx<Provider> provider = Provider().obs;

  /*####### CONSTRUTOR ######*/
  MovieDetailController(this.getElencoMovieUseCase, this.getWatchInMovieUseCase,
      this.getTrailerMovieUseCase);

  @override
  void onInit() async {
    setLoading(true);

    print('onInit');
    initializeDateFormatting("pt_BR");
    setInitialState();
    int idMovie = int.parse(this.model.id.toString());
    await getElenco(idMovie);
    await getWatchIn(idMovie);
    await getTrailer(idMovie);
    super.onInit();
    setLoading(false);
  }

  /// ESTADO INICIAL DA TELA
  setInitialState() {
    setLoading(true);
    setLoading(false);
  }

  /// ALTERA O ESTADO DA TELA
  updateScreen() {}

  /// ALTERA A TELA PARA LOADING
  setLoading(bool status) {
    loading.value = status;
  }

  //METODO PARA BUSCAR O ELENCO DO FILME
  getElenco(int idMovie) async {
    try {
      setLoading(true);
      var result = await getElencoMovieUseCase(idMovie);

      result.fold((error) {
        lstElenco = [];
        setLoading(false);
      }, (success) async {
        print('[SUCCESS] getElenco($idMovie)');
        lstElenco = success;
        setLoading(false);
        setError(false);
        updateScreen();
      });
    } on DefaultException catch (_, e) {
      print('[ERROR] getElenco($idMovie) ($e) ==> $_');
      lstElenco = [];
      setLoading(false);
      setError(true, description: _.description, title: _.title);
    }
  }

  //METODO PARA BUSCAR OS TRAILERS DO FILME
  getTrailer(int idMovie) async {
    try {
      setLoading(true);
      var result = await getTrailerMovieUseCase(idMovie);

      result.fold((error) {
        lstElenco = [];
        setLoading(false);
      }, (success) async {
        print('[SUCCESS] getTrailer($idMovie)');
        lstTrailer = success;
        List<String> playList = lstTrailer.map((e) {
          if (e.site.toString().toLowerCase() == 'youtube') {
            return e.key.toString();
          }
          return 'delete';
        }).toList();
        playList.removeWhere((element) => element == 'delete');
        youtubeController = YoutubePlayerController(
          initialVideoId: lstTrailer[0].key!,
          params: YoutubePlayerParams(
            playlist: playList, // Defining custom playlist
            startAt: Duration(seconds: 0),
            showControls: true,
            showFullscreenButton: true,
          ),
        );
        setLoading(false);
        setError(false);
        updateScreen();
      });
    } on DefaultException catch (_, e) {
      print('[ERROR] getTrailer($idMovie) ($e) ==> $_');
      lstTrailer = [];
      setLoading(false);
      setError(true, description: _.description, title: _.title);
    }
  }

  //METODO PARA BUSCAR O LOCAL ONDE PODE SER ASSISTIDO O FILME
  getWatchIn(int idMovie) async {
    try {
      var result = await getWatchInMovieUseCase(idMovie);
      result.fold((error) {
        return [];
      }, (success) async {
        print('[SUCCESS] getWatchIn($idMovie) ::>' + success.toString());
        provider.value = success;
        return success;
      });
    } on DefaultException catch (_, e) {
      print('[ERROR] getWatchIn($idMovie) ($e) ==> $_');
      setError(true, description: _.description, title: _.title);
      return [];
    }
  }

  /// SETA UM ERRO NA TELA
  setError(bool status,
      {String title = '', String description = '', double width = 300}) {
    if (status == true) {
      MyGetSnackBar(title: title, description: description).error();
    }
  }
}
