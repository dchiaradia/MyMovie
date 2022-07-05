import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../core/shared/cache/cache_client.dart';
import '../core/shared/cache/get_cache_client.dart';
import 'presenter/controllers/splash_controller.dart';

class SplashBind extends Bindings {
  @override
  void dependencies() {
    final ICacheClient cacheClient = GetCacheClient(GetStorage());
    Get.lazyPut<SplashControllerG>(() => SplashControllerG(cacheClient));
  }
}
