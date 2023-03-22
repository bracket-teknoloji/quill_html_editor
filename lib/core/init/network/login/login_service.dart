import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';

import '../../../../view/auth/model/login_model.dart';
import '../../cache/hive_cache.dart';
import 'api_urls.dart';

class LoginManager {
  static const String _grantType = "password";
  static final dio = Dio(
    BaseOptions(
        baseUrl: ApiUrls.token.url,
        headers: {"Platform": "netfect", "Content-Type": _contentType},
        responseType: ResponseType.json),
  );
  static const String _contentType = "application/x-www-form-urlencoded";

  static Future<bool> login(
      {String company = "netfect",
      required String username,
      required String password}) async {
    try {
      final response = await dio.get(ApiUrls.token.url, data: {
        "grant_type": _grantType,
        "username": username,
        "password": password
      });

      if (HttpStatus.ok == response.statusCode) {
        LoginAuth loginAuth = LoginAuth()..accessToken = response.data["access_token"];
        CacheManager.saveUserData(loginAuth);
        log(loginAuth.userJson.toString());
        return true;
      } else {
        return false;
      }
    } catch (e) {
      log(e.toString());
      return false;
    }
  }
}
