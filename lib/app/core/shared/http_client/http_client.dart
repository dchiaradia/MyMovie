abstract class HttpClient {
  Future<HttpResponse> get(String url);
  Future<HttpResponse> postCustomNoBody(String url);
  Future<HttpResponse> post(String url, Map<String, dynamic> body);
  Future<HttpResponse> put(String url, Map<String, dynamic> body);
  Future<HttpResponse> postCustomHeaders(
      String url, Object body, Map<String, String>? headers);
  Future<HttpResponse> putCustomHeaders(
      String url, Object body, Map<String, String>? headers);

  Future<HttpResponse> delete(String url);
}

class HttpResponse {
  final dynamic data;
  final int? statusCode;

  HttpResponse({
    required this.data,
    required this.statusCode,
  });
}
