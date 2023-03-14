import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheManager {
  static void saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
    debugPrint('token saved $token');
  }

  static Future<String> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    String result = await prefs.getString('token')!;
    return result;
  }
}
