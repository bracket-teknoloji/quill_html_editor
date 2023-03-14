import 'package:dio/dio.dart';
import '../../cache/login_bearer_token.dart';
import 'api_urls.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../view/auth/model/login_model.dart';

class LoginManager {
  static const String _grantType = "password";
  static const String _platform = "netfect";
  static final dio = Dio();

  static const String _contentType = "application/x-www-form-urlencoded";

  static Future<bool> login(String username, String password) async {
    dio.options.headers["Content-Type"] = _contentType;
    final response = await dio
        .get(ApiUrls.token,
            data: {
              "grant_type": _grantType,
              "username": username,
              "password": password
            },
            options: Options(headers: {
              "Platform": _platform,
            }, contentType: _contentType, responseType: ResponseType.json))
        .catchError((e) {
      Response response = e.response;
      return response;
    });
    if (response.statusCode == 200) {
      LoginAuth loginAuth = LoginAuth.fromJson(response.data);
      CacheManager.saveToken(loginAuth.accessToken!);
      return true;
    } else {
      return false;
    }
  }
}
