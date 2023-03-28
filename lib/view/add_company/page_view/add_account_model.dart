import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:picker/core/base/model/base_network_mixin.dart';

part 'add_account_model.g.dart';

@JsonSerializable(createToJson: true)
class AccountModel with NetworkManagerMixin {
  @JsonKey(name: "ADI")
  String? isim;
  @JsonKey(name: "ADMIN")
  String? admin;
  @JsonKey(name: "AKTIF_ISLETME_KODU")
  int? aktifIsletmeKodu;
  @JsonKey(name: "AKTIF_SUBE_KODU")
  int? aktifSubeKodu;
  @JsonKey(name: "AKTIF_VERITABANI")
  String? aktifVeritabani;
  //* TODO  Cihaz Sistem Versiyonu ?
  @JsonKey(name: "CIHAZ_SISTEM_VERSIYONU")
  String? cihazSistemVersiyonu;
  @JsonKey(name: "APK_DERLEME_TARIHI")
  DateTime? apkDerlemeTarihi;
  @JsonKey(name: "CIHAZ_DILI")
  String? cihazDili;
  @JsonKey(name: "G_CID")
  String? gCid;
  @JsonKey(name: "CIHAZ_MARKASI")
  String? cihazMarkasi;
  @JsonKey(name: "CIHAZ_MODELI")
  String? cihazModeli;
  @JsonKey(name: "G_DSN")
  String? gDsn;
  @JsonKey(name: "CIHAZ_TARIHI")
  String? cihazTarihi;
  @JsonKey(name: "CIHAZ_TARIHI_UTC")
  DateTime? cihazTarihiUtc;
  @JsonKey(name: "CIHAZ_TIME_ZONE_DAKIKA")
  int? cihazTimeZoneDakika;
  @JsonKey(name: "FCM_TOKEN")
  String? fcmToken;
  @JsonKey(name: "UYE_EMAIL")
  String? uyeEmail;
  @JsonKey(name: "KONUM_DATE")
  DateTime? konumDate;
  @JsonKey(name: "KONUM_TARIHI")
  String? konumTarihi;
  @JsonKey(name: "G_KA")
  String? gKa;
  @JsonKey(name: "G_BO")
  String? gBo;
  @JsonKey(name: "G_EN")
  String? gEn;
  @JsonKey(name: "KULLANICI_ADI")
  String? kullaniciAdi;
  @JsonKey(name: "KURULU_HESAPLAR")
  String? kuruluHesaplar;
  @JsonKey(name: "LOCAL_IP")
  String? localIp;
  // TODOözel cihaz kimliği ?
  @JsonKey(name: "OZEL_CIHAZ_KIMLIGI")
  String? ozelCihazKimligi;
  @JsonKey(name: "OFFLINE")
  String? offline;
  @JsonKey(name: "SIM_OPERATOR")
  String? simOperator;
  @JsonKey(name: "PAKET_ADI")
  String? paketAdi;
  @JsonKey(name: "PARAM_MAP")
  // TODO Bunu değiştirmeyi unutma. Bu Kısıma aşağıdaki ParamMapModel'i ekleyeceksin.
  String? paramMap;
  @JsonKey(name: "PLATFORM")
  String? platform;
  @JsonKey(name: "REQUEST_VERSION")
  int? requestVersion;
  @JsonKey(name: "SOYADI")
  String? soyadi;
  @JsonKey(name: "SERVICE_VERSION")
  String? serviceVersion;
  @JsonKey(name: "TZ_INFO")
  String? tzInfo;
  @JsonKey(name: "UYGULAMA_DILI")
  String? uygulamaDili;
  @JsonKey(name: "UYGULAMA_GUNCELLEME_TARIHI")
  String? uygulamaGuncellemeTarihi;
  @JsonKey(name: "UYGULAMA_SURUMU")
  String? uygulamaSurumu;
  @JsonKey(name: "UYGULAMA_SURUM_KODU")
  int? uygulamaSurumKodu;
  @JsonKey(name: "UZAK_ERISIM")
  String? uzakErisim;
  @JsonKey(name: "WIFIDEN_BAGLI")
  String? wifidenBagli;

  Future<void> init() async {
    NetworkInterface.list().then((value) {
      localIp = value.first.addresses.first.address;
    });
    cihazDili = Platform.localeName;
    cihazTimeZoneDakika = DateTime.now().timeZoneOffset.inMinutes;

    //* Uygulama Bilgileri
    final packageInfo = await PackageInfo.fromPlatform();
    paketAdi = packageInfo.packageName;
    uygulamaSurumu = packageInfo.version;
    uygulamaSurumKodu = int.parse(packageInfo.buildNumber);

    //* Cihaz ve Sim Bilgileri
    final deviceInfo = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      platform = Platform.operatingSystem;
      final androidInfo = await deviceInfo.androidInfo;
      cihazMarkasi = androidInfo.brand;
      cihazModeli = androidInfo.model;
      cihazSistemVersiyonu = androidInfo.version.release;
      ozelCihazKimligi = androidInfo.id;
    } else if (Platform.isIOS) {
      final iosInfo = await deviceInfo.iosInfo;
      cihazMarkasi = iosInfo.name;
      cihazModeli = iosInfo.model;
      cihazSistemVersiyonu = iosInfo.systemVersion;
      ozelCihazKimligi = iosInfo.identifierForVendor;
    }
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

class ParamMap {
  ParamMap();
}
