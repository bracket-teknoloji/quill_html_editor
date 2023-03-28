// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:picker/core/base/model/base_network_mixin.dart';
import 'package:picker/core/base/model/generic_response_model.dart';
import 'package:picker/core/constants/enum/dio_enum.dart';
import 'package:picker/view/auth/model/login_model.dart';

class NetworkManager {
  static final Dio _dio = Dio(BaseOptions(
    baseUrl: "http://ofis.bracket.com.tr:7575/pickerBracket/",
  ));

  NetworkManager() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          return handler.next(options);
        },
        onError: (e, handler) {
          return handler.next(e);
        },
      ),
    );
  }

  static Future<TokenModel> getToken(
      {required String path,
      required TokenModel bodyModel,
      Map<String, dynamic>? headers,
      dynamic data,
      Map<String, dynamic>? queryParameters}) async {
    final response = await _dio
        .request(path,
            queryParameters: queryParameters,
            options: Options(headers: {
              "Platform": "netfect",
              "Content-Type": "application/x-www-form-urlencoded",
            }, method: HttpTypes.GET, responseType: ResponseType.json),
            data: data)
        .then((value) => value.data);
    return bodyModel.fromJson(response);
  }

  Future<GenericResponseModel> dioGet<T extends NetworkManagerMixin>(
      {required String path,
      required bodyModel,
      Map<String, String>? headers,
      dynamic data,
      Map<String, String>? queryParameters,
      bool addQuery = true,
      bool addTokenKey = true}) async {
    Map<String, String> head = getStandardHeader(addTokenKey);
    if (headers != null) head.addEntries(headers.entries);
    Map<String, String> queries = getStandardQueryParameters();
    if (queryParameters != null) queries.addEntries(queryParameters.entries);
    final response = await _dio.get(
      path,
      queryParameters: queries,
      options: Options(headers: head, responseType: ResponseType.json),
    );
    GenericResponseModel<T> responseModel =
        GenericResponseModel<T>.fromJson(response.data, bodyModel);
    return responseModel;
  }

  Future<GenericResponseModel> dioPost<T extends NetworkManagerMixin>(
      {required String path,
      required bodyModel,
      Map<String, String>? headers,
      dynamic data,
      Map<String, String>? queryParameters,
      bool addQuery = true,
      bool addTokenKey = true}) async {
    Map<String, String> head = getStandardHeader(addTokenKey);
    if (headers != null) head.addEntries(headers.entries);
    Map<String, String> queries = getStandardQueryParameters();
    if (queryParameters != null) queries.addEntries(queryParameters.entries);
    final response = await _dio.post(
      path,
      queryParameters: queries,
      options: Options(headers: head, responseType: ResponseType.json),
      data: data,
    );
    GenericResponseModel<T> responseModel =
        GenericResponseModel<T>.fromJson(response.data, bodyModel);
    return responseModel;
  }

  Map<String, String> getStandardHeader(bool addTokenKey) {
    Map<String, String> header = {};
    if (addTokenKey) {
      String token = Hive.box("token").get("token");
      header.addAll({"Authorization": "Bearer $token"});
    }
    return header;
  }

  Map<String, String> getStandardQueryParameters() {
    Map<String, String> query = {};
    return query;
  }
}
