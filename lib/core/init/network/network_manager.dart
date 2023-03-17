
import 'package:dio/dio.dart';

class NetworkManager {
  static late final NetworkManager _instance;
  static NetworkManager get instance {
    return _instance;
  }

  NetworkManager._init();

  final Dio _dio = Dio();

  Future<Response> get(String path, {required Map<String, dynamic> queryParameters}) async {
    final response = await _dio.get(path, queryParameters: queryParameters);
    return response;
  }

  Future<Response> post(String path, {required Map<String, dynamic> queryParameters, dynamic data}) async {
    final response = await _dio.post(path, queryParameters: queryParameters, data: data);
    return response;
  }
}