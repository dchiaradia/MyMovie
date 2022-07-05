import 'package:get/get.dart';
import 'package:movie2/app/home/home_routes.dart';

import 'splash/splash_routes.dart';

List<GetPage<dynamic>>? appRoutes = [
  ...splash_routes!,
  ...home_routes!,
];
