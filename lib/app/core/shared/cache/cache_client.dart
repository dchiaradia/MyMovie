abstract class ICacheClient {
  Future<String> read(String key);
  Future<bool> write(String key, String value);
  Future<bool> eraseAll();
}
