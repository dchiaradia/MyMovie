import 'package:get/get.dart';

import 'presenter/pages/splash_page.dart';
import 'splash_bind.dart';

List<GetPage<dynamic>>? splash_routes = [
  GetPage(
    name: '/splash',
    page: () => SplashPage(),
    binding: SplashBind(),
  ),
];
