import "dart:async";
import "dart:developer";

import "package:geolocator/geolocator.dart";
import "package:permission_handler/permission_handler.dart";
import "package:picker/core/base/model/base_empty_model.dart";
import "package:picker/core/constants/extensions/date_time_extensions.dart";
import "package:picker/core/init/dependency_injection/intectable_interface.dart";
import "package:picker/core/init/network/login/api_urls.dart";
import "package:picker/core/init/network/network_manager.dart";
import "package:picker/view/add_company/model/account_model.dart";

final class LocationManager implements InjectableInterface {
  LocationManager({this.distanceFilterMeters = 200, this.timeFilter = Duration.zero});
  Position? _lastPosition;
  DateTime? _lastPositionTime;
  StreamSubscription<Position>? _positionStreamSubscription;

  // Konum güncelleme koşulları
  final int distanceFilterMeters;
  final Duration timeFilter;

  Future<void> startTracking() async {
    final bool hasPermission = await _requestLocationPermission();
    if (!hasPermission) {
      log("Konum izni verilmedi.", name: "LocationManager");
      return;
    }
    late final LocationSettings locationSettings;
    // Geolocator ayarları (doğruluk, mesafe filtresi vb.)
    locationSettings = switch (AccountModel.instance.platform) {
      "ios" || "macos" => AppleSettings(
          showBackgroundLocationIndicator: true,
          distanceFilter: distanceFilterMeters,
          timeLimit: timeFilter,
          accuracy: LocationAccuracy.medium,
        ),
      "android" => AndroidSettings(
          accuracy: LocationAccuracy.medium,
          foregroundNotificationConfig: const ForegroundNotificationConfig(
            notificationText: "Uygulama konumunuzu kullanıyor",
            notificationTitle: "Konum Takibi",
            enableWakeLock: true,
            notificationIcon: AndroidResource(name: "mipmap-xxxhdpi/ic_launcher"),
          ),
          distanceFilter: distanceFilterMeters,
          timeLimit: timeFilter,
        ),
      "web" => WebSettings(
          distanceFilter: distanceFilterMeters,
          accuracy: LocationAccuracy.medium,
          timeLimit: timeFilter,
        ),
      _ => throw UnsupportedError("Unsupported platform: ${AccountModel.instance.platform}"),
    };
    _positionStreamSubscription = Geolocator.getPositionStream(locationSettings: locationSettings).listen(
      _processPositionUpdate,
      onError: (error) {
        log("Konum hatası: $error", name: "LocationManager");
        // Hata durumunda yapılacak işlemler (örn. kullanıcıya bildirim gösterme)
      },
    );
  }

  void _processPositionUpdate(Position newPosition) {
    if (_lastPosition == null) {
      // İlk konum alındı
      _lastPosition = newPosition;
      _lastPositionTime = DateTime.now();
      _handleNewLocation(newPosition);
      return;
    }

    // Mesafe kontrolü
    final double distanceInMeters = Geolocator.distanceBetween(
      _lastPosition!.latitude,
      _lastPosition!.longitude,
      newPosition.latitude,
      newPosition.longitude,
    );

    // Zaman kontrolü
    final Duration timeDifference = DateTime.now().difference(_lastPositionTime!);

    if (distanceInMeters >= distanceFilterMeters || timeDifference >= timeFilter) {
      // Konum güncelleme koşulları sağlandı
      _lastPosition = newPosition;
      _lastPositionTime = DateTime.now();
      _handleNewLocation(newPosition); // Yeni konumu işle
    }
  }

  void _handleNewLocation(Position position) {
    log("Yeni konum: ${position.latitude}, ${position.longitude}, Zaman: ${DateTime.now()}", name: "LocationManager");
    sendData();
  }

  Future<void> stopTracking() async {
    await _positionStreamSubscription?.cancel();
    _positionStreamSubscription = null;
  }

  @override
  Future<void> load() async => await sendData();

  Future<void> sendData() async {
    await NetworkManager().dioPost(
      path: ApiUrls.saveKonum,
      bodyModel: BaseEmptyModel(),
      showError: false,
      data: {
        "KONUM_BOYLAM": _lastPosition?.longitude,
        "KONUM_ENLEM": _lastPosition?.latitude,
        "KONUM_TARIHI": "${DateTime.now().toDateString} ${DateTime.now().getTime}",
        "KONUM_DATE": DateTime.now().toIso8601String(),
      },
    );
  }

  Future<bool> _requestLocationPermission() async {
    // Konum izni durumunu kontrol et
    if (await Permission.locationAlways.status.isPermanentlyDenied) {
      await Permission.locationAlways.request();
    }
    var status = await Permission.locationWhenInUse.status;

    if (status.isGranted) {
      // Zaten izin verilmiş
      return true;
    } else if (status.isDenied) {
      // İzin verilmemiş, kullanıcıdan iste
      status = await Permission.location.request();
      if (status.isGranted) {
        return true;
      } else if (status.isPermanentlyDenied) {
        // Kullanıcı izni kalıcı olarak reddetmiş, ayarları açmasını isteyebiliriz.
        openAppSettings(); //Kullanıcıyı uygulama ayarlarına yönlendir.
        return false;
      } else {
        // Kullanıcı reddetti
        return false;
      }
    } else if (status.isRestricted || status.isLimited) {
      // İzin durumu kısıtlı veya sınırlı (örn. ebeveyn kontrolü)
      return false;
    }
    return false;
  }
}
