import "dart:developer";

import "package:flutter/foundation.dart";
import "package:get_it/get_it.dart";
import "package:picker/core/init/bluetooth/bluetooth_manager.dart";
import "package:picker/core/init/cache/cache_manager.dart";
import "package:picker/core/init/dependency_injection/intectable_interface.dart";
import "package:picker/core/init/location/location_manager.dart";
import "package:picker/main.dart";

abstract final class DIManager {
  static final _getIt = GetIt.I;
  static Future<void> init() async {
    await lazyRegisterer<LocationManager>(
      LocationManager(
        distanceFilterMeters: CacheManager.getAnaVeri?.paramModel?.genelKonumTakibiMetre ?? 100,
        timeFilter: Duration(minutes: CacheManager.getAnaVeri?.paramModel?.genelKonumTakibiDakika ?? 2),
      ),
    );
    await lazyRegisterer(BluetoothManager());
    if (kDebugMode) await lazyRegisterer(SewooPrinter());
  }

  static Future<void> lazyRegisterer<T extends InjectableInterface>(T object) async {
    try {
      if (_getIt.isRegistered<T>()) {
        reset<T>();
        // _getIt.unregister<T>();
        // lazyRegisterer<T>(object);
        return;
      }
      _getIt.registerLazySingleton<T>(() => object);
      await read<T>().load();
    } on Exception catch (e) {
      log(e.toString(), name: "DIManager");
    }
  }

  static bool isRegistered<T extends InjectableInterface>() => _getIt.isRegistered<T>();

  static T read<T extends InjectableInterface>() => _getIt<T>();

  static Future<void> reset<T extends InjectableInterface>() async {
    await _getIt.resetLazySingleton<T>(instance: _getIt<T>());
  }

  static Future<void> delete<T extends InjectableInterface>() async {
    await _getIt.unregister<T>();
  }
}
