import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:movie2/app/home/data/datasources/home_datasource_interface.dart';
import 'package:movie2/app/home/data/datasources/home_endpoints.dart';
import 'package:movie2/app/home/domain/entities/elencoModel.dart';
import 'package:movie2/app/home/domain/entities/movieModel.dart';
import 'package:movie2/app/home/domain/entities/trailers.dart';

import '../../../core/shared/errors/exceptions.dart';
import '../../../core/shared/http_client/http_client.dart';
import '../../domain/entities/provider.dart';

class HomeDatasource implements IHomeDatasource {
  final HttpClient client;

  HomeDatasource(this.client);

  @override
  Future<List<Movie>> getMovies() async {
    print('[HOME][DATASOURCE][getMovies] > STARTING');
    var apiKey = dotenv.env['MOVIEDB_API_KEY'];
    var apiLanguage = dotenv.env['MOVIEDB_API_LANGUAGE'];
    var url = urlGetMovie + '?api_key=$apiKey&language=$apiLanguage';
    print('INIT API LOCATION::::' + url);
    var response = await client.get(url);

    if (response.statusCode == 200) {
      try {
        print('[HOME][DATASOURCE][getMovies] > SUCCESS');
        List<dynamic> json = jsonDecode(response.data)['results'];
        var listReturnMovies = json.map((item) => Movie.fromMap(item)).toList();
        return listReturnMovies;
      } catch (e) {
        print('[ERROR] - [HOME][DATASOURCE][getMovies] > [ERROR]');
        print(e);
        throw DefaultException(
            title: 'Erro ao tentar listar os filmes.',
            description: 'Erro ao realizar leitura dos filmes pela API');
      }
    }
    if (response.statusCode == 400) {
      return [];
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<Elenco>> getElencoMovie(int idMovie) async {
    print('[HOME][DATASOURCE][getElencoMovie($idMovie)] > STARTING');
    var apiKey = dotenv.env['MOVIEDB_API_KEY'];
    var apiLanguage = dotenv.env['MOVIEDB_API_LANGUAGE'];
    var url =
        '$urlBase/3/movie/$idMovie/credits?api_key=$apiKey&language=$apiLanguage';
    print('INIT API LOCATION::::$url');
    var response = await client.get(url);

    if (response.statusCode == 200) {
      try {
        print('[HOME][DATASOURCE][getElencoMovie($idMovie)] > SUCCESS');
        List<dynamic> json = jsonDecode(response.data)['cast'];
        var lstElenco = json.map((item) => Elenco.fromMap(item)).toList();
        return lstElenco;
      } catch (e) {
        print('[ERROR][HOME][DATASOURCE][getElencoMovie($idMovie)] > ERROR');
        print(e);
        throw DefaultException(
            title: 'Erro ao tentar listar o elenco do filme.',
            description:
                'Erro ao realizar leitura do elenco do filme pela API');
      }
    }
    if (response.statusCode == 400) {
      return [];
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Provider> getWatchIn(int idMovie) async {
    print('[HOME][DATASOURCE][getWatchIn($idMovie)] > STARTING');
    var apiKey = dotenv.env['MOVIEDB_API_KEY'];
    var apiLanguage = dotenv.env['MOVIEDB_API_LANGUAGE'];
    var url =
        '$urlBase/3/movie/$idMovie/watch/providers?api_key=$apiKey&language=$apiLanguage';
    print('INIT API LOCATION::::$url');
    var response = await client.get(url);

    if (response.statusCode == 200) {
      try {
        print('[HOME][DATASOURCE][getWatchIn($idMovie)] > SUCCESS');
        var vJson = jsonDecode(response.data)['results']['BR'];

        if (vJson == null) {
          return Provider();
        }

        Provider lstProvider = Provider.fromJson(jsonEncode(vJson));
        return lstProvider;
      } catch (e) {
        print('[ERROR][HOME][DATASOURCE][getWatchIn($idMovie)] > ERROR');
        print(e);
        throw DefaultException(
            title: 'Erro ao tentar listar o watchIn do filme.',
            description:
                'Erro ao realizar leitura do watchIn do filme pela API');
      }
    }
    if (response.statusCode == 400) {
      return Provider();
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<Trailer>> getTrailerMovie(int idMovie) async {
    print('[HOME][DATASOURCE][getTrailerMovie($idMovie)] > STARTING');
    var apiKey = dotenv.env['MOVIEDB_API_KEY'];
    var apiLanguage = dotenv.env['MOVIEDB_API_LANGUAGE'];
    var url =
        '$urlBase/3/movie/$idMovie/videos?api_key=$apiKey&language=$apiLanguage';
    print('INIT API LOCATION::::$url');
    var response = await client.get(url);

    if (response.statusCode == 200) {
      try {
        print('[HOME][DATASOURCE][getTrailerMovie($idMovie)] > SUCCESS');
        List<dynamic> json = jsonDecode(response.data)['results'];
        var lstTrailer = json.map((item) => Trailer.fromMap(item)).toList();
        return lstTrailer;
      } catch (e) {
        print('[ERROR][HOME][DATASOURCE][getTrailerMovie($idMovie)] > ERROR');
        print(e);
        throw DefaultException(
            title: 'Erro ao tentar listar os trailers do filme.',
            description:
                'Erro ao realizar leitura dos treiler do filme pela API');
      }
    }
    if (response.statusCode == 400) {
      return [];
    } else {
      throw ServerException();
    }
  }
}
