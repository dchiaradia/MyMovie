import 'package:get/get.dart';

import '../../../core/shared/cache/cache_client.dart';
import '../../../core/shared/stored_data.dart';

class SplashControllerG extends GetxController {
  final ICacheClient cacheClient;

  SplashControllerG(this.cacheClient);

  init() async {
    try {
      //goToDestiny('/home');
    } catch (e) {
      print(e);
    }
  }

  goToDestiny(String route) {
    // Timer(Duration(seconds: 50), () {
    //   Get.offAndToNamed(route);
    // });
    Get.offAndToNamed(route);
  }

  @override
  void onInit() {
    var storedData = Get.find<StoredData>();
    print(storedData.data);

    super.onInit();

    init();
  }
}
