import "dart:async";
import "dart:developer";

import "package:flutter/foundation.dart";
import "package:geolocator/geolocator.dart";
import "package:permission_handler/permission_handler.dart";
import "package:picker/core/base/model/base_empty_model.dart";
import "package:picker/core/constants/extensions/date_time_extensions.dart";
import "package:picker/core/init/dependency_injection/intectable_interface.dart";
import "package:picker/core/init/network/login/api_urls.dart";
import "package:picker/core/init/network/network_manager.dart";
import "package:picker/view/add_company/model/account_model.dart";

final class LocationManager implements InjectableInterface {
  // Singleton yapısı
  LocationManager({this.distanceFilterMeters = 200, this.timeFilter = const Duration(minutes: 5)});

  // Sınıf değişkenleri
  Position? _lastPosition;
  DateTime? _lastPositionTime;
  DateTime? _lastSentTime;
  StreamSubscription<Position>? _positionStreamSubscription;
  Timer? _locationRetryTimer;
  bool _isRetrying = false;

  late final int distanceFilterMeters;
  late final Duration timeFilter;

  // Getters
  bool get isTracking => _positionStreamSubscription != null;
  Position? get lastPosition => _lastPosition;
  DateTime? get lastUpdateTime => _lastPositionTime;

  // Konum takibini başlatma
  Future<bool> startTracking() async {
    if (isTracking) {
      log("Konum takibi zaten aktif.", name: "LocationManager");
      return true;
    }

    final bool hasPermission = await _requestLocationPermission();
    if (!hasPermission) {
      log("Konum izni verilmedi.", name: "LocationManager");
      return false;
    }

    return await _startLocationUpdates();
  }

  // Konum güncellemelerini başlatma
  Future<bool> _startLocationUpdates() async {
    try {
      if (!await Geolocator.isLocationServiceEnabled()) {
        log("Konum servisi kapalı. Lütfen GPS'i açın.", name: "LocationManager");
        return false;
      }

      final locationSettings = _getLocationSettings();

      // İlk konumu al
      try {
        _lastPosition = await Geolocator.getCurrentPosition();
        _lastPositionTime = DateTime.now();
        await _sendLocationData(); // İlk veriyi gönder
        _lastSentTime = DateTime.now();
      } catch (e) {
        log("İlk konum alınamadı: $e", name: "LocationManager");
      }

      // Konum stream'ini başlat
      _positionStreamSubscription = Geolocator.getPositionStream(locationSettings: locationSettings).listen(
        _onPositionUpdate,
        onError: _handleLocationError,
        cancelOnError: false,
        onDone: () {
          log("Konum stream'i sonlandı.", name: "LocationManager");
          _scheduleRetry();
        },
      );

      return true;
    } catch (e) {
      log("Konum takibi başlatılamadı: $e", name: "LocationManager");
      _scheduleRetry();
      return false;
    }
  }

  // Konum hatalarını yönetme
  void _handleLocationError(dynamic error) {
    log("Konum hatası: $error", name: "LocationManager");
    if (error is TimeoutException) {
      _scheduleRetry();
    }
  }

  // Yeniden deneme zamanlaması
  void _scheduleRetry() {
    if (_isRetrying) {
      log("Zaten yeniden deneme yapılıyor.", name: "LocationManager");
      return;
    }

    _isRetrying = true;
    _locationRetryTimer?.cancel();

    _locationRetryTimer = Timer(const Duration(seconds: 30), () async {
      log("Konum servisi yeniden başlatılıyor...", name: "LocationManager");
      _isRetrying = false;

      await stopTracking();
      await _startLocationUpdates();
    });
  }

  // Platform'a göre konum ayarlarını alma
  LocationSettings _getLocationSettings() => switch (AccountModel.instance.platform) {
    "ios" || "macos" => AppleSettings(
      showBackgroundLocationIndicator: true,
      distanceFilter: distanceFilterMeters,
      timeLimit: timeFilter,
    ),
    "android" => AndroidSettings(
      foregroundNotificationConfig: const ForegroundNotificationConfig(
        notificationText: "Uygulama arka planda konumunuzu takip ediyor",
        notificationTitle: "Konum Takibi Aktif",
        enableWakeLock: true,
        notificationIcon: AndroidResource(name: "mipmap-xxxhdpi/ic_launcher"),
      ),
      distanceFilter: distanceFilterMeters,
      timeLimit: timeFilter,
    ),
    "web" => WebSettings(distanceFilter: distanceFilterMeters, timeLimit: timeFilter),
    _ => throw UnsupportedError("Platform desteklenmiyor: ${AccountModel.instance.platform}"),
  };

  // Yeni konum güncellemelerini işleme
  void _onPositionUpdate(Position newPosition) {
    _isRetrying = false;

    if (_lastPosition == null) {
      _updatePosition(newPosition);
      log("İlk konum güncellendi: ${newPosition.latitude}, ${newPosition.longitude}", name: "LocationManager");
      return;
    }

    final double distanceInMeters = Geolocator.distanceBetween(
      _lastPosition!.latitude,
      _lastPosition!.longitude,
      newPosition.latitude,
      newPosition.longitude,
    );

    final Duration timeDifference = DateTime.now().difference(_lastSentTime ?? DateTime.now());

    if (distanceInMeters >= distanceFilterMeters || timeDifference >= timeFilter) {
      _updatePosition(newPosition);
    }
  }

  // Konum güncelleme
  void _updatePosition(Position position) {
    _lastPosition = position;
    _lastPositionTime = DateTime.now();

    log("Yeni konum güncellendi: ${position.latitude}, ${position.longitude}", name: "LocationManager");

    _sendLocationData().then((_) {
      _lastSentTime = DateTime.now();
    });
  }

  // Konum takibini durdurma
  Future<void> stopTracking() async {
    await _positionStreamSubscription?.cancel();
    _positionStreamSubscription = null;
    _locationRetryTimer?.cancel();
    _locationRetryTimer = null;
    _isRetrying = false;
    _lastSentTime = null;
    log("Konum takibi durduruldu.", name: "LocationManager");
  }

  // Konum verilerini sunucuya gönderme
  Future<void> _sendLocationData() async {
    if (_lastPosition == null) {
      log("Gönderilecek konum verisi yok.", name: "LocationManager");
      return;
    }

    try {
      await NetworkManager().dioPost(
        path: ApiUrls.saveKonum,
        bodyModel: BaseEmptyModel(),
        showError: false,
        data: {
          "KONUM_BOYLAM": _lastPosition?.longitude,
          "KONUM_ENLEM": _lastPosition?.latitude,
          "KONUM_TARIHI": "${_lastPositionTime?.toDateString} ${_lastPositionTime?.getTime}",
          "KONUM_DATE": _lastPositionTime?.toIso8601String(),
          if ((_lastPosition?.speed ?? 0) != 0) "KONUM_HIZ": _lastPosition?.speed,
        },
      );
      log("Konum verisi başarıyla gönderildi.", name: "LocationManager");
      log("Konum verisi: ${_lastPosition?.latitude}, ${_lastPosition?.longitude}", name: "LocationManager");
      log("Konum tarihi: ${_lastPositionTime?.toDateString} ${_lastPositionTime?.getTime}", name: "LocationManager");
    } catch (e) {
      log("Konum verisi gönderilemedi: $e", name: "LocationManager");
    }
  }

  // İzin isteme
  Future<bool> _requestLocationPermission() async {
    if (kIsWeb) {
      await Permission.location.request();
      return await Permission.location.isGranted;
    }
    if (await Permission.locationAlways.status.isDenied) {
      await Permission.locationAlways.request();
    }
    return await Permission.locationAlways.isGranted;
  }

  @override
  Future<void> load() async {}
}
