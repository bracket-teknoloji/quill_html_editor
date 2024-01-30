import "dart:convert";
import "dart:developer";
import "dart:io";

import "package:android_id/android_id.dart";
import "package:app_tracking_transparency/app_tracking_transparency.dart";
import "package:connectivity_plus/connectivity_plus.dart";
import "package:device_info_plus/device_info_plus.dart";
import "package:flutter/foundation.dart";
import "package:get/get.dart";
import "package:hive_flutter/hive_flutter.dart";
import "package:json_annotation/json_annotation.dart";
import "package:kartal/kartal.dart";
import "package:location/location.dart";
import "package:package_info_plus/package_info_plus.dart";

import "../../../core/base/model/base_network_mixin.dart";
import "../../../core/init/app_info/app_info.dart";
import "../../../core/init/cache/cache_manager.dart";
import "account_response_model.dart";

part "account_model.g.dart";

@HiveType(typeId: 73)
@JsonSerializable()
class AccountModel with NetworkManagerMixin {
  AccountModel.getValue() {
    init();
    // uyeEmail = CacheManager.getHesapBilgileri?.uyeEmail;
    // uyeSifre = CacheManager.getHesapBilgileri?.uyeSifre;
  }
  static AccountModel instance = AccountModel.getValue();

  static Future<void> setFromAccountResponseModel(AccountResponseModel? model) async {
    instance.uyeEmail = model?.email;
    instance.uyeSifre = model?.parola;
  }

  //setter for instance
  static void setInstance(AccountModel value) => instance = value;

  AccountModel();
  @HiveField(0)
  String? isim;
  @HiveField(1)
  String? admin;
  @HiveField(2)
  int? aktifIsletmeKodu;
  @HiveField(3)
  int? aktifSubeKodu;
  @HiveField(4)
  String? aktifVeritabani;
  @HiveField(5)
  String? cihazSistemVersiyonu;
  @HiveField(6)
  DateTime? apkDerlemeTarihi;
  @HiveField(7)
  String? cihazDili;
  @HiveField(8)
  String? gCid;
  @HiveField(9)
  String? cihazMarkasi;
  @HiveField(10)
  String? cihazKimligi;
  @HiveField(11)
  String? cihazModeli;
  @HiveField(12)
  String? gDsn;
  @HiveField(13)
  String? cihazTarihi;
  @HiveField(14)
  DateTime? cihazTarihiUtc;
  @HiveField(15)
  int? cihazTimeZoneDakika;
  @HiveField(16)
  String? fcmToken;
  @HiveField(17)
  String? uyeEmail;
  @HiveField(18)
  String? uyeSifre;
  @HiveField(19)
  DateTime? konumDate;
  @HiveField(20)
  String? konumTarihi;
  @HiveField(21)
  String? gKa;
  @HiveField(22)
  String? gBo;
  @HiveField(23)
  String? gEn;
  @HiveField(24)
  String? kullaniciAdi;
  @HiveField(25)
  String? kuruluHesaplar;
  @HiveField(26)
  String? localIp;
  @HiveField(27)
  String? ozelCihazKimligi;
  @HiveField(28)
  String? offline;
  @HiveField(29)
  String? simOperator;
  @HiveField(30)
  String? paketAdi;
  @JsonKey(defaultValue: {})
  @HiveField(31)
  Map<String, dynamic>? paramMap;
  @HiveField(32)
  String? platform;
  @HiveField(33)
  int? requestVersion;
  @HiveField(34)
  String? soyadi;
  @HiveField(35)
  String? serviceVersion;
  @HiveField(36)
  String? tzInfo;
  @HiveField(37)
  String? uygulamaDili;
  @HiveField(38)
  String? uygulamaGuncellemeTarihi;
  @HiveField(39)
  String? uygulamaSurumu;
  @HiveField(40)
  int? uygulamaSurumKodu;
  @HiveField(41)
  String? uzakErisim;
  @HiveField(42)
  String? wifidenBagli;
  @HiveField(43)
  String? qrData;
  @HiveField(44)
  bool? debugMu;
  @HiveField(45)
  String? adi;
  @HiveField(46)
  String? wifiAdi;
  @HiveField(47)
  String? debug;
  @HiveField(48)
  DateTime? girisTarihi;
  @HiveField(49)
  DateTime? sonKullanimTarihi;
  @HiveField(50)
  String? onayli;
  @HiveField(51)
  String? konumEnlem;
  @HiveField(52)
  String? konumBoylam;

  Future<void> init() async {
    if (isDebug) {
      debugMu = isDebug;
    } else {
      debugMu = null;
    }
    debugMu = null;

    final AccountResponseModel? account = CacheManager.getAccounts(uyeEmail ?? "");
    uzakErisim = CacheManager.getUzaktanMi(account?.firmaKisaAdi) ? "E" : "H";

    //* Uygulama Bilgileri
    ///  [uygulamaSurumu = packageInfo.version;]
    //* olarak değiştirilecek fakat API bu uygulamanın sürümünü kabul etmediği için manuel verdim.
    uygulamaSurumKodu = 229;
    uygulamaSurumu = AppInfoModel.instance.version;
    requestVersion = 1;
    await PackageInfo.fromPlatform().then((value) => paketAdi = value.packageName);

    log(toJson().toString(), name: runtimeType.toString());
    //* Network Bilgileri (Connectivity Plus)
    offline = "H";
    if (kIsWeb) {
      platform = "web";
    } else {
      platform = Platform.operatingSystem;
      final list = await NetworkInterface.list(
        includeLoopback: true,
        type: InternetAddressType.IPv4,
      );
      for (var interface in list) {
        for (var i = 0; i < interface.addresses.length; i++) {
          if (interface.addresses[i].address != "") {
            localIp = interface.addresses[i].address;
          }
        }
      }
    }
    konumDate = DateTime.now();
    konumTarihi = getKonumTarihi;

    uygulamaGuncellemeTarihi = "${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day}";
    if (kIsWeb) {
      wifidenBagli = "E";
    } else if (await Connectivity().checkConnectivity() == ConnectivityResult.wifi) {
      wifidenBagli = "E";
    } else {
      wifidenBagli = "H";
    }

    cihazTimeZoneDakika = DateTime.now().timeZoneOffset.inMinutes;
    //* Cihaz ve Sim Bilgileri
    uygulamaDili = "tr";
    cihazDili = Get.locale?.languageCode ?? "tr";
    cihazSistemVersiyonu = "20";
    cihazTarihi = getKonumTarihi;
    cihazTarihiUtc = DateTime.now().toUtc();
    final deviceInfo = DeviceInfoPlugin();
    //!WEB
    if (kIsWeb) {
      platform = "web";
      // final webInfo = await deviceInfo.webBrowserInfo;
    } //! ANDROID
    else if (Platform.isAndroid) {
      final androidInfo = await deviceInfo.androidInfo;
      cihazSistemVersiyonu = androidInfo.version.sdkInt.toString();
      cihazMarkasi = androidInfo.brand;
      cihazModeli = androidInfo.model;
      //? Cihaz kimliği için android_id kullanıyoruz. Tarih: 28/09/2023 1.1.7 Sürümünde değiştirildi.
      //* eski hali --------> ozelCihazKimligi = androidInfo.id;
      const androidIdPlugin = AndroidId();
      final String? androidId = await androidIdPlugin.getId();
      ozelCihazKimligi = androidId;
      if (ozelCihazKimligi.ext.isNotNullOrNoEmpty) {
        cihazKimligi = base64Encode(utf8.encode(ozelCihazKimligi.toString()));
        log("ozelCihazKimligi: ${base64Encode(utf8.encode(ozelCihazKimligi!))}");
      } else {
        cihazKimligi = base64Encode(
          utf8.encode("$cihazMarkasi:$cihazModeli:${androidInfo.serialNumber}:"),
        );
      }
      // androidInfo.serialNumber;
    }
    //! IOS
    else if (Platform.isIOS) {
      // while (await AppTrackingTransparency.trackingAuthorizationStatus != TrackingStatus.authorized) {
      final iosInfo = await deviceInfo.iosInfo;
      cihazSistemVersiyonu = iosInfo.systemVersion.split(".").first;
      cihazMarkasi = iosInfo.name;
      cihazModeli = iosInfo.utsname.machine;
      ozelCihazKimligi = iosInfo.identifierForVendor;
      cihazKimligi = base64Encode(utf8.encode(ozelCihazKimligi.toString()));
      await Future.delayed(const Duration(seconds: 1));
      await AppTrackingTransparency.requestTrackingAuthorization();
      // }
    }
    //!DESKTOP
    else if (Platform.isWindows) {
      platform = Platform.operatingSystem;
      final desktopInfo = await deviceInfo.windowsInfo;
      cihazSistemVersiyonu = Platform.operatingSystemVersion;
      cihazMarkasi = desktopInfo.productName;
      cihazModeli = desktopInfo.productId;
      if (ozelCihazKimligi.ext.isNotNullOrNoEmpty) {
        cihazKimligi = base64Encode(utf8.encode(ozelCihazKimligi.toString()));
        log("ozelCihazKimligi: ${base64Encode(utf8.encode(ozelCihazKimligi!))}");
      } else {
        //* Bilgisayar adını gönderiyoruz. Bilgisayar adı aynı olduğunda ağda problem olacağı için böyle yapıyoruz.
        ozelCihazKimligi = base64Encode(utf8.encode("win_${desktopInfo.computerName}"));
        cihazKimligi = ozelCihazKimligi;
      }
    } else if (Platform.isMacOS) {
      platform = Platform.operatingSystem;
      final desktopInfo = await deviceInfo.macOsInfo;
      cihazSistemVersiyonu = Platform.operatingSystemVersion;
      cihazMarkasi = desktopInfo.computerName;
      cihazModeli = desktopInfo.model;
      if (ozelCihazKimligi.ext.isNotNullOrNoEmpty) {
        cihazKimligi = base64Encode(utf8.encode(ozelCihazKimligi.toString()));
        log("ozelCihazKimligi: ${base64Encode(utf8.encode(ozelCihazKimligi!))}");
      }
    } else if (Platform.isLinux) {
      platform = Platform.operatingSystem;
      final desktopInfo = await deviceInfo.linuxInfo;
      cihazSistemVersiyonu = Platform.operatingSystemVersion;
      cihazMarkasi = desktopInfo.name;
      cihazModeli = desktopInfo.prettyName;
      if (ozelCihazKimligi.ext.isNotNullOrNoEmpty) {
        cihazKimligi = base64Encode(utf8.encode(ozelCihazKimligi.toString()));
        log("ozelCihazKimligi: ${base64Encode(utf8.encode(ozelCihazKimligi!))}");
      } else {
        ozelCihazKimligi = base64Encode(utf8.encode("linux_${desktopInfo.name}"));
        cihazKimligi = ozelCihazKimligi;
      }
    }
    kuruluHesaplar = CacheManager.accountsBox.values.map((e) => (e as AccountResponseModel).email).join(";");
  }

  String get getKonumTarihi => "${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day} ${DateTime.now().hour}:${DateTime.now().minute}:${DateTime.now().second}";

  bool get isDebug =>
      CacheManager.accountsBox.values.any(
        (element) => (element as AccountResponseModel?)?.email == "destek@netfect.com",
      ) ||
      kDebugMode;

  @override
  AccountModel fromJson(Map<String, dynamic> json) => _$AccountModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$AccountModelToJson(this);

  Future<void> getLocation() async {
    final Location location = Location();

    bool serviceEnabled;
    PermissionStatus permissionGranted;
    LocationData locationData;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    locationData = await location.getLocation();
    log(locationData.toString());
    // instance.gk
  }
}
