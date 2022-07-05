import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:movie2/app/home/domain/entities/movieModel.dart';
import 'package:movie2/app/home/domain/usecases/get_movies_usecase.dart';

import '../../../core/shared/errors/exceptions.dart';
import '../../../core/widgets/myGetSnackBar/my_get_snackbar_widget.dart';

class HomeController extends GetxController {
  /*####### VARIAVEIS DE CONTROLE DE ESTADO DE TELA ######*/
  final RxBool loading = true.obs;
  final RxBool onError = false.obs;

  Rx<Movie> movieData = Movie().obs;

  /*####### USECASES DA TELA ######*/
  final GetMoviesUseCase getMoviesUseCase;

  /*####### OUTRAS VARIAVEIS ######*/
  List<Movie> lstMovies = []; //variavel para armazenar lista de todos os filmes

  HomeController(
    this.getMoviesUseCase,
  );

  @override
  void onInit() async {
    print('onInit');
    initializeDateFormatting("pt_BR");
    setInitialState();
    await getMovies();
    super.onInit();
  }

  /// ESTADO INICIAL DA TELA
  setInitialState() {
    setLoading(true);
    movieData.value = Movie();
    lstMovies = [];
    setLoading(false);
  }

  /// ALTERA O ESTADO DA TELA
  updateScreen() {
    movieData.refresh();
  }

  /// ALTERA A TELA PARA LOADING
  setLoading(bool status) {
    loading.value = status;
  }

  /// SETA UM ERRO NA TELA
  setError(bool status,
      {String title = '', String description = '', double width = 300}) {
    if (status == true) {
      MyGetSnackBar(title: title, description: description).error();
    }
  }

  // LISTA TODOS OS FILMES
  getMovies() async {
    try {
      setLoading(true);
      var result = await getMoviesUseCase();

      result.fold((error) {
        lstMovies = [];
        setLoading(false);
      }, (success) async {
        print('[SUCCESS] getMovies ()');
        lstMovies = success;
        setLoading(false);
        setError(false);
        updateScreen();
      });
    } on DefaultException catch (_, e) {
      print('[ERROR] getMovies ($e) ==> $_');
      lstMovies = [];
      setLoading(false);
      setError(true, description: _.description, title: _.title);
    }
  }
}
