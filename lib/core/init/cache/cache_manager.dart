import 'package:hive_flutter/hive_flutter.dart';
import 'package:picker/view/auth/model/login_model.dart';

class CacheManager {
  static CacheManager? _instance;
  static CacheManager? get instance {
    _instance ??= CacheManager._init();
    return _instance;
  }

  CacheManager._init() {
    initHiveBoxes();
  }

  Future<void> initHiveBoxes() async {
    await Hive.openBox<TokenModel>("login");
    await Hive.openBox("preferences");
    await Hive.openBox("companies");
    await Hive.openBox("token");
    await Hive.openBox("account");
  }
}
