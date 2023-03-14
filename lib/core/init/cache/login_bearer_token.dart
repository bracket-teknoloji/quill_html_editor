

import 'package:shared_preferences/shared_preferences.dart';

class CacheManager{
  static void saveToken(String token) async{
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('token', token);
  }
}