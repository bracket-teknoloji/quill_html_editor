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
  Timer? _sendDataTimer;

  final int distanceFilterMeters;
  final Duration timeFilter;

  Future<void> startTracking() async {
    final bool hasPermission = await _requestLocationPermission();
    if (!hasPermission) {
      log("Konum izni verilmedi.", name: "LocationManager");
      return;
    }

    late final LocationSettings locationSettings;
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
          forceLocationManager: true,
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
      },
    );

    sendData(); // İlk istek hemen gönderilsin
  }

  void _processPositionUpdate(Position newPosition) {
    if (_lastPosition == null) {
      _lastPosition = newPosition;
      _lastPositionTime = DateTime.now();
      return;
    }

    final double distanceInMeters = Geolocator.distanceBetween(
      _lastPosition!.latitude,
      _lastPosition!.longitude,
      newPosition.latitude,
      newPosition.longitude,
    );

    final Duration timeDifference = DateTime.now().difference(_lastPositionTime!);

    if (distanceInMeters >= distanceFilterMeters || timeDifference >= timeFilter) {
      _lastPosition = newPosition;
      _lastPositionTime = DateTime.now();
      _handleNewLocation(newPosition);
    }
  }

  void _handleNewLocation(Position position) {
    log("Yeni konum: ${position.latitude}, ${position.longitude}, Zaman: ${DateTime.now()}", name: "LocationManager");

    _sendDataTimer?.cancel();
    _sendDataTimer = Timer(timeFilter, sendData);
  }

  Future<void> stopTracking() async {
    await _positionStreamSubscription?.cancel();
    _positionStreamSubscription = null;
    _sendDataTimer?.cancel();
  }

  @override
  Future<void> load() async => await sendData();

  Future<void> sendData() async {
    if (_lastPosition == null) return;

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
    if (await Permission.locationAlways.status.isPermanentlyDenied) {
      await Permission.locationAlways.request();
    }
    var status = await Permission.locationWhenInUse.status;

    if (status.isGranted) {
      return true;
    } else if (status.isDenied) {
      status = await Permission.location.request();
      if (status.isGranted) {
        return true;
      } else if (status.isPermanentlyDenied) {
        openAppSettings();
        return false;
      } else {
        return false;
      }
    } else if (status.isRestricted || status.isLimited) {
      return false;
    }
    return false;
  }
}