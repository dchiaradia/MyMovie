import 'package:get_storage/get_storage.dart';

import 'cache_client.dart';

class GetCacheClient implements ICacheClient {
  final GetStorage client;

  GetCacheClient(this.client);

  @override
  Future<bool> eraseAll() {
    try {
      client.erase();
      return Future.value(true);
    } catch (e) {
      print(e);
      return Future.value(false);
    }
  }

  @override
  Future<String> read(String key) async {
    try {
      var result = await client.read(key);
      return result ?? '';
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  @override
  Future<bool> write(String key, String value) {
    try {
      client.write(key, value);
      return Future.value(true);
    } catch (e) {
      print(e);
      return Future.value(false);
    }
  }
}
