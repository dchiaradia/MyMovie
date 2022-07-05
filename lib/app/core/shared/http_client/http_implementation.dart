import 'dart:convert';

import 'package:http/http.dart';
import '../cache/cache_client.dart';
import 'http_client.dart';

class HttpImplementation implements HttpClient {
  final Client client;
  final ICacheClient cacheClient;

  HttpImplementation(this.client, this.cacheClient);
  @override
  Future<HttpResponse> get(String url) async {
    try {
      var accessToken = await this.cacheClient.read('access_token');
      final response = await client
          .get(Uri.parse(url), headers: {'authorization': accessToken});
      print('Core>httpCliente>Http Implementation>Get ($url)>Status:' +
          response.statusCode.toString());

      if (response.statusCode != 200) {
        print('url: ' + url);
        print(
          'response: ' + response.body,
        );
      }
      return HttpResponse(data: response.body, statusCode: response.statusCode);
    } catch (e) {
      print(e);
      throw e;
    }
  }

  @override
  Future<HttpResponse> delete(String url) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<HttpResponse> post(String url, Map<String, dynamic> body) async {
    var accessToken = await this.cacheClient.read('access_token');

    try {
      final response = await client.post(Uri.parse(url),
          body: json.encode(body),
          headers: {
            'Content-Type': 'application/json',
            'authorization': accessToken
          });

      print('Core>httpCliente>Http Implementation>post ($url)>Status:' +
          response.statusCode.toString());

      return HttpResponse(data: response.body, statusCode: response.statusCode);
    } catch (e) {
      print(e);
      throw e;
    }
  }

  @override
  Future<HttpResponse> postCustomNoBody(String url) async {
    var accessToken = await this.cacheClient.read('access_token');

    try {
      final response = await client.post(Uri.parse(url), headers: {
        'Content-Type': 'application/json',
        'authorization': accessToken
      });

      print('Core>httpCliente>Http Implementation>post ($url)>Status:' +
          response.statusCode.toString());

      return HttpResponse(data: response.body, statusCode: response.statusCode);
    } catch (e) {
      print(e);
      throw e;
    }
  }

  @override
  Future<HttpResponse> postCustomHeaders(
      String url, Object body, Map<String, String>? headers) async {
    print(url);
    print(body);
    print(headers);
    var accessToken = await this.cacheClient.read('access_token');
    headers!["authorization"] = accessToken;

    try {
      final response =
          await client.post(Uri.parse(url), body: body, headers: headers);

      print(
          'Core>httpCliente>Http Implementation>postCustomHeaders ($url)>Status:' +
              response.statusCode.toString());

      return HttpResponse(data: response.body, statusCode: response.statusCode);
    } catch (e) {
      print(e);
      throw e;
    }
  }

  @override
  Future<HttpResponse> put(String url, Map<String, dynamic> body) async {
    try {
      var accessToken = await this.cacheClient.read('access_token');

      final response = await client.put(Uri.parse(url),
          body: json.encode(body),
          headers: {
            'Content-Type': 'application/json',
            'authorization': accessToken
          });

      print('Core>httpCliente>Http Implementation>put ($url)>Status:' +
          response.statusCode.toString());

      return HttpResponse(data: response.body, statusCode: response.statusCode);
    } catch (e) {
      print(e);
      throw e;
    }
  }

  @override
  Future<HttpResponse> putCustomHeaders(
      String url, Object body, Map<String, String>? headers) {
    // TODO: implement putCustomHeaders
    throw UnimplementedError();
  }
}
