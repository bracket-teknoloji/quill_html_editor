import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:kartal/kartal.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../../core/base/model/base_network_mixin.dart';

part 'account_model.g.dart';

@HiveType(typeId: 73)
@JsonSerializable(createToJson: true)
class AccountModel with NetworkManagerMixin {
  AccountModel.getValue() {
    init();
  }
  static final AccountModel instance = AccountModel.getValue();

  AccountModel();
  @HiveField(0)
  @JsonKey(name: "ADI")
  String? isim;
  @HiveField(1)
  @JsonKey(name: "ADMIN")
  String? admin;
  @HiveField(2)
  @JsonKey(name: "AKTIF_ISLETME_KODU")
  int? aktifIsletmeKodu;
  @HiveField(3)
  @JsonKey(name: "AKTIF_SUBE_KODU")
  int? aktifSubeKodu;
  @HiveField(4)
  @JsonKey(name: "AKTIF_VERITABANI")
  String? aktifVeritabani;
  @HiveField(5)
  @JsonKey(name: "CIHAZ_SISTEM_VERSIYONU")
  String? cihazSistemVersiyonu;
  @HiveField(6)
  @JsonKey(name: "APK_DERLEME_TARIHI")
  DateTime? apkDerlemeTarihi;
  @HiveField(7)
  @JsonKey(name: "CIHAZ_DILI")
  String? cihazDili;
  @HiveField(8)
  @JsonKey(name: "G_CID")
  String? gCid;
  @HiveField(9)
  @JsonKey(name: "CIHAZ_MARKASI")
  String? cihazMarkasi;
  @HiveField(10)
  @JsonKey(name: "CIHAZ_KIMLIGI")
  String? cihazKimligi;
  @HiveField(11)
  @JsonKey(name: "CIHAZ_MODELI")
  String? cihazModeli;
  @HiveField(12)
  @JsonKey(name: "G_DSN")
  String? gDsn;
  @HiveField(13)
  @JsonKey(name: "CIHAZ_TARIHI")
  String? cihazTarihi;
  @HiveField(14)
  @JsonKey(name: "CIHAZ_TARIHI_UTC")
  DateTime? cihazTarihiUtc;
  @HiveField(15)
  @JsonKey(name: "CIHAZ_TIME_ZONE_DAKIKA")
  int? cihazTimeZoneDakika;
  @HiveField(16)
  @JsonKey(name: "FCM_TOKEN")
  String? fcmToken;
  @HiveField(17)
  @JsonKey(name: "UYE_EMAIL")
  String? uyeEmail;
  @HiveField(18)
  @JsonKey(name: "UYE_SIFRE")
  String? uyeSifre;
  @HiveField(19)
  @JsonKey(name: "KONUM_DATE")
  DateTime? konumDate;
  @HiveField(20)
  @JsonKey(name: "KONUM_TARIHI")
  String? konumTarihi;
  @HiveField(21)
  @JsonKey(name: "G_KA")
  String? gKa;
  @HiveField(22)
  @JsonKey(name: "G_BO")
  String? gBo;
  @HiveField(23)
  @JsonKey(name: "G_EN")
  String? gEn;
  @HiveField(24)
  @JsonKey(name: "KULLANICI_ADI")
  String? kullaniciAdi;
  @HiveField(25)
  @JsonKey(name: "KURULU_HESAPLAR")
  String? kuruluHesaplar;
  @HiveField(26)
  @JsonKey(name: "LOCAL_IP")
  String? localIp;

  /// TODO özel cihaz kimliği ?
  @HiveField(27)
  @JsonKey(name: "OZEL_CIHAZ_KIMLIGI")
  String? ozelCihazKimligi;
  @HiveField(28)
  @JsonKey(name: "OFFLINE")
  String? offline;
  @HiveField(29)
  @JsonKey(name: "SIM_OPERATOR")
  String? simOperator;
  @HiveField(30)
  @JsonKey(name: "PAKET_ADI")
  String? paketAdi;
  @HiveField(31)
  @JsonKey(name: "PARAM_MAP")
  String? paramMap;
  @HiveField(32)
  @JsonKey(name: "PLATFORM")
  String? platform;
  @HiveField(33)
  @JsonKey(name: "REQUEST_VERSION")
  int? requestVersion;
  @HiveField(34)
  @JsonKey(name: "SOYADI")
  String? soyadi;
  @HiveField(35)
  @JsonKey(name: "SERVICE_VERSION")
  String? serviceVersion;
  @HiveField(36)
  @JsonKey(name: "TZ_INFO")
  String? tzInfo;
  @HiveField(37)
  @JsonKey(name: "UYGULAMA_DILI")
  String? uygulamaDili;
  @HiveField(38)
  @JsonKey(name: "UYGULAMA_GUNCELLEME_TARIHI")
  String? uygulamaGuncellemeTarihi;
  @HiveField(39)
  @JsonKey(name: "UYGULAMA_SURUMU")
  String? uygulamaSurumu;
  @HiveField(40)
  @JsonKey(name: "UYGULAMA_SURUM_KODU")
  int? uygulamaSurumKodu;
  @HiveField(41)
  @JsonKey(name: "UZAK_ERISIM")
  String? uzakErisim;
  @HiveField(42)
  @JsonKey(name: "WIFIDEN_BAGLI")
  String? wifidenBagli;
  @HiveField(43)
  @JsonKey(name: "QR_DATA")
  String? qrData;

  Future<void> init() async {
    // aktifIsletmeKodu = CacheManager.getVeriTabani()["İşletme"];
    // aktifSubeKodu = CacheManager.getVeriTabani()["Şube"];
    // aktifVeritabani = CacheManager.getVeriTabani()["Şirket"];
    //* Network Bilgileri (Connectivity Plus)
    offline = "H";
    if (kIsWeb) {
      platform = "Web";

    } else {
      platform = Platform.operatingSystem;
      var list = await NetworkInterface.list(includeLoopback: true, type: InternetAddressType.IPv4);
      for (var interface in list) {
        for (var i = 0; i < interface.addresses.length; i++) {
          if (interface.addresses[i].address != "") {
            localIp = interface.addresses[i].address;
          }
        }
      }
    }
    konumDate = DateTime.now();
    konumTarihi = "${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day} ${DateTime.now().hour}:${DateTime.now().minute}:${DateTime.now().second}";

    uygulamaGuncellemeTarihi = "${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day}";
    if (await Connectivity().checkConnectivity() == ConnectivityResult.wifi) {
      wifidenBagli = "E";
    } else {
      wifidenBagli = "H";
    }
    if (kIsWeb) {
      wifidenBagli = "E";
    } else {
      // cihazDili = Platform.localeName;
    }
    cihazTimeZoneDakika = DateTime.now().timeZoneOffset.inMinutes;
    //* Cihaz ve Sim Bilgileri
    uygulamaDili = "tr";
    cihazDili = "tr";
    cihazTarihiUtc = DateTime.now().toUtc();
    final deviceInfo = DeviceInfoPlugin();
    //!WEB
    if (kIsWeb) {
      final webInfo = await deviceInfo.webBrowserInfo;
      cihazSistemVersiyonu = "20";
      cihazMarkasi = webInfo.vendor;
      cihazModeli = webInfo.userAgent;
      ozelCihazKimligi = webInfo.userAgent;
      cihazKimligi = base64Encode(utf8.encode("$cihazMarkasi:$cihazModeli:$ozelCihazKimligi:"));
    } //! ANDROID
    else if (Platform.isAndroid) {
      final androidInfo = await deviceInfo.androidInfo;
      cihazSistemVersiyonu = androidInfo.version.sdkInt.toString();
      cihazMarkasi = androidInfo.brand;
      cihazModeli = androidInfo.model;
      ozelCihazKimligi = androidInfo.id;
      if (ozelCihazKimligi.isNotNullOrNoEmpty) {
        cihazKimligi = base64Encode(utf8.encode(ozelCihazKimligi.toString()));
        log("ozelCihazKimligi: ${base64Encode(utf8.encode(ozelCihazKimligi!))}");
      } else {
        cihazKimligi = base64Encode(utf8.encode("$cihazMarkasi:$cihazModeli:${androidInfo.serialNumber}:"));
      }
      // androidInfo.serialNumber;
    }
    //! IOS
    else if (Platform.isIOS) {
      final iosInfo = await deviceInfo.iosInfo;
      cihazMarkasi = iosInfo.name;
      cihazModeli = iosInfo.model;
      cihazSistemVersiyonu = "20";
      ozelCihazKimligi = iosInfo.identifierForVendor;
      cihazKimligi = base64Encode(utf8.encode(ozelCihazKimligi.toString()));
    }
    //!DESKTOP
    else if (Platform.isWindows) {
      platform = Platform.operatingSystem;
      final desktopInfo = await deviceInfo.windowsInfo;
      cihazSistemVersiyonu = Platform.operatingSystemVersion;
      cihazMarkasi = desktopInfo.productName;
      cihazModeli = desktopInfo.productId;
      if (ozelCihazKimligi.isNotNullOrNoEmpty) {
        cihazKimligi = base64Encode(utf8.encode(ozelCihazKimligi.toString()));
        log("ozelCihazKimligi: ${base64Encode(utf8.encode(ozelCihazKimligi!))}");
      } else {
        //TODO Bunu guid gönereceğiz.
        //* Bilgisayar adını gönderiyoruz. Bilgisayar adı aynı olduğunda ağda problem olacağı için böyle yapıyoruz.
        ozelCihazKimligi = base64Encode(utf8.encode("win_${desktopInfo.computerName}"));
        cihazKimligi = ozelCihazKimligi;
      }
    }
    //* Uygulama Bilgileri
    uygulamaSurumu = "228";

    ///  [uygulamaSurumu = packageInfo.version;]
    ///* olarak değiştirilecek fakat API bu uygulamanın sürümünü kabul etmediği için manuel verdim.
    uygulamaSurumKodu = 228;
    requestVersion = 2;
    await PackageInfo.fromPlatform().then((value) => paketAdi = value.packageName);

    log(toJson().toString(), name: runtimeType.toString());
  }

  @override
  fromJson(Map<String, dynamic> json) {
    return _$AccountModelFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$AccountModelToJson(this);
  }
}

@JsonSerializable(createToJson: true)
class ParamMap with NetworkManagerMixin {
  ParamMap();

  @override
  fromJson(Map<String, dynamic> json) {
    return _$ParamMapFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$ParamMapToJson(this);
  }
}
