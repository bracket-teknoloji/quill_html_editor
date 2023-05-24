// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:picker/core/base/model/base_network_mixin.dart';
import 'package:picker/core/base/model/generic_response_model.dart';
import 'package:picker/core/constants/extensions/date_time_extensions.dart';
import 'package:picker/core/init/cache/cache_manager.dart';
import 'package:picker/view/auth/model/login_model.dart';

import '../../constants/enum/dio_enum.dart';

class NetworkManager {
  static final Dio _dio = Dio(BaseOptions(
    baseUrl: "http://ofis.bracket.com.tr:7575/pickerBracket/",
    // baseUrl: "http:localhost/picker/",
    connectTimeout: const Duration(seconds: 20),
  ));
  NetworkManager() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          return handler.next(options);
        },
        onError: (e, handler) {
          if (e.type == DioErrorType.connectionError) {
            return handler.next(DioError(requestOptions: RequestOptions(), message: "İnternet bağlantınızı kontrol ediniz. ${e.error}"));
          } else if (e.type == DioErrorType.connectionTimeout) {
            return handler.next(DioError(requestOptions: RequestOptions(), message: "Bağlantı zaman aşımına uğradı."));
          } else {
            return handler.next(e);
          }
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
      Map<String, dynamic>? queryParameters,
      bool addQuery = true,
      bool addSirketBilgileri = false,
      bool addCKey = false,
      bool addTokenKey = true}) async {
    CancelToken cancelToken = CancelToken();
    Map<String, String> head = getStandardHeader(addTokenKey, addSirketBilgileri, addCKey);
    if (headers != null) head.addEntries(headers.entries);
    Map<String, dynamic> queries = getStandardQueryParameters();
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
      bool addSirketBilgileri = false,
      bool addCKey = false,
      bool addTokenKey = true}) async {
    Map<String, String> head = getStandardHeader(addTokenKey, addSirketBilgileri, addCKey);
    if (headers != null) head.addEntries(headers.entries);
    Map<String, dynamic> queries = getStandardQueryParameters();
    if (queryParameters != null) queries.addEntries(queryParameters.entries);
    if (queryParameters != null) queries.addEntries(queryParameters.entries);
    final response = await _dio.post(path, queryParameters: queries, options: Options(headers: head, responseType: ResponseType.json), data: data);
    GenericResponseModel<T> responseModel = GenericResponseModel<T>.fromJson(response.data, bodyModel);
    return responseModel;
  }

  Future<MemoryImage> getImage(String path) async {
    Map<String, String> head = getStandardHeader(true, true, true);
    final response = await _dio.get(path, options: Options(headers: head, responseType: ResponseType.bytes));
    // convert response to bytes
    log(response.data.toString());
    // response is a png file
    return MemoryImage(response.data);
  }

  Map<String, String> getStandardHeader(bool addTokenKey, [bool headerSirketBilgileri = false, bool headerCKey = false]) {
    Map<String, String> header = {};
    if (addTokenKey) {
      String token = CacheManager.getToken();
      header.addAll({"Authorization": "Bearer $token"});
    }
    if (headerSirketBilgileri) {
      var veriTabani = CacheManager.getVeriTabani();
      Map<String, String> sirketBilgileri = {
        "VERITABANI": veriTabani["Şirket"].toString(),
        "ISLETME_KODU": veriTabani["İşletme"].toString(),
        "SUBE_KODU": veriTabani["Şube"].toString(),
      };
      header.addEntries(sirketBilgileri.entries);
    }
    if (headerCKey) {
      final timeZoneMinutes = DateTime.now().timeZoneOffset.inMinutes;
      String baseEncoded = base64Encode(utf8.encode('{"TZ_MINUTES" :$timeZoneMinutes,"ZAMAN": "${DateTime.now().toDateTimeString()}"}'));
      print(baseEncoded);
      header.addAll({"CKey": baseEncoded});
    }
    return header;
  }

  Map<String, dynamic> getStandardQueryParameters() {
    Map<String, dynamic> query = {};
    return query;
  }
}
