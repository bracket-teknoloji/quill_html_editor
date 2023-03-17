import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';

import '../../../../view/auth/model/login_model.dart';
import '../../cache/hive_cache.dart';
import 'api_urls.dart';

class LoginManager {
  static const String _grantType = "password";
  static final dio = Dio();
  static const String _contentType = "application/x-www-form-urlencoded";

  static Future<bool> login(
      {String company = "netfect",
      required String username,
      required String password}) async {
    dio.options.headers["Content-Type"] = _contentType;
    final response = await dio
        .get(ApiUrls.token,
            data: {
              "grant_type": _grantType,
              "username": username,
              "password": password
            },
            options: Options(headers: {
              "Platform": company,
            }, contentType: _contentType, responseType: ResponseType.json))
        .catchError((e) {
      Response response = e.response;
      return response;
    });
    if (HttpStatus.ok == response.statusCode) {
      LoginAuth loginAuth = LoginAuth.fromJson(response.data);
      CacheManager.saveUserData(loginAuth);
      log(loginAuth.userJson.toString());
      return true;
    } else {
      return false;
    }
  }
  
}
