import 'package:dio/dio.dart';
import 'package:picker/core/init/network/login/api_urls.dart';

class LoginManager {
  
  static const String _grantType = "password";
  static const String _platform = "netfect";
  static final dio = Dio();

  static const String _contentType = "application/x-www-form-urlencoded";

  Future<void> login() async{
    dio.options.headers["Content-Type"] = _contentType;
    final response = await dio.get(ApiUrls.token, data: {
      
              "grant_type": _grantType,
              "username": "username",
              "password": "password"
    });

  }



}