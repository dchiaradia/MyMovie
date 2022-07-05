import 'package:get/get.dart';
import 'package:movie2/app/home/home_bind.dart';
import 'package:movie2/app/home/presenter/pages/home_page.dart';
import 'package:movie2/app/home/presenter/pages/movie_detail_page.dart';

List<GetPage<dynamic>>? home_routes = [
  GetPage(
    name: '/home',
    page: () => HomePage(),
    binding: HomeBind(),
    middlewares: [],
  ),
  GetPage(
    name: '/movie_detail',
    page: () => MovieDetailPage(),
    binding: HomeBind(),
    middlewares: [],
  ),
];
