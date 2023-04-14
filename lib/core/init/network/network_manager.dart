// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:picker/core/base/model/base_network_mixin.dart';
import 'package:picker/core/base/model/generic_response_model.dart';
import 'package:picker/core/init/cache/cache_manager.dart';
import 'package:picker/view/auth/model/login_model.dart';

import '../../constants/enum/dio_enum.dart';

class NetworkManager {
  static final Dio _dio = Dio(BaseOptions(
    baseUrl: "http://ofis.bracket.com.tr:7575/pickerBracket/",
    connectTimeout: const Duration(seconds: 20),

  ));

  NetworkManager() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          return handler.next(options);
        },
        onError: (e, handler) {
          // throw e;
          return handler.next(e);
        },
      ),
    );
  }

  static Future<TokenModel> getToken({required String path, Map<String, dynamic>? headers, dynamic data, Map<String, dynamic>? queryParameters}) async {
    final response = await _dio.request(path,
        queryParameters: queryParameters,
        cancelToken: CancelToken(),
        options: Options(headers: {
          "Platform": "netfect",
          "Content-Type": "application/x-www-form-urlencoded",
        }, method: HttpTypes.GET, responseType: ResponseType.json),
        data: data);
    var a = response.data;
    return TokenModel().fromJson(a);
  }

  Future<GenericResponseModel> dioGet<T extends NetworkManagerMixin>(
      {required String path,
      required T bodyModel,
      Map<String, String>? headers,
      dynamic data,
      Map<String, String>? queryParameters,
      bool addQuery = true,
      bool addTokenKey = true}) async {
    CancelToken cancelToken = CancelToken();
    Map<String, String> head = getStandardHeader(addTokenKey);
    if (headers != null) head.addEntries(headers.entries);
    Map<String, String> queries = getStandardQueryParameters();
    if (queryParameters != null) queries.addEntries(queryParameters.entries);
    final response = await _dio.get(path, queryParameters: queries, options: Options(headers: head), cancelToken: cancelToken);
    GenericResponseModel<T> responseModel = GenericResponseModel<T>.fromJson(response.data, bodyModel);
    return responseModel;
  }

  Future<GenericResponseModel> dioPost<T extends NetworkManagerMixin>(
      {required String path,
      required T bodyModel,
      Map<String, String>? headers,
      dynamic data,
      Map<String, String>? queryParameters,
      bool addQuery = true,
      bool addTokenKey = true}) async {
    Map<String, String> head = getStandardHeader(addTokenKey);
    if (headers != null) {
      head.addEntries(headers.entries);
    }
    Map<String, String> queries = getStandardQueryParameters();
    if (queryParameters != null) queries.addEntries(queryParameters.entries);
    final response = await _dio.post(path, queryParameters: queries, options: Options(headers: head, responseType: ResponseType.json), data: data);
    GenericResponseModel<T> responseModel = GenericResponseModel<T>.fromJson(response.data, bodyModel);
    return responseModel;
  }

  Map<String, String> getStandardHeader(bool addTokenKey) {
    Map<String, String> header = {};
    if (addTokenKey) {
      String token = CacheManager.getToken();
      header.addAll({"Authorization": "Bearer $token"});
    }
    return header;
  }

  Map<String, String> getStandardQueryParameters() {
    Map<String, String> query = {};
    return query;
  }
}
