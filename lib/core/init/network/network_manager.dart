import 'dart:io';

import 'package:dio/dio.dart';
import 'package:picker/core/base/model/base_network_model.dart';

class NetworkManager {
  static final Dio _dio = Dio(BaseOptions(
    baseUrl: "http://ofis.bracket.com.tr:7575/pickerBracket/",
  ));

  static Future<T> dioResponse<T extends NetworkManagerMixin>(
      {required String path,
      required T bodyModel,
      required String method,
      Map<String, dynamic>? headers,
      dynamic data,
      Map<String, dynamic>? queryParameters}) async {
      final response = await _dio.request(path,
          queryParameters: queryParameters,
          options: Options(
              headers: headers,
              method: method,
              responseType: ResponseType.json),
          data: data);
        return bodyModel.fromJson(response.data);

  }
}
