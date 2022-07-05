import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart';
import 'package:movie2/app/core/shared/stored_data.dart';
import 'shared/cache/get_cache_client.dart';
import 'shared/http_client/http_implementation.dart';

class CoreBind extends Bindings {
  @override
  void dependencies() {
    Get.put(StoredData(data: 'Injection Ready'));
    Get.put(HttpImplementation(Client(), GetCacheClient(GetStorage())));
    Get.put(() => GetStorage());
  }
}
