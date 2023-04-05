import 'dart:developer';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../../core/base/model/base_network_mixin.dart';

part 'account_model.g.dart';

@JsonSerializable(createToJson: true)
class AccountModel with NetworkManagerMixin {
  AccountModel.getValue() {
    init();
  }
  static final AccountModel instance = AccountModel.getValue();

  AccountModel();
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
  @JsonKey(name: "CIHAZ_KIMLIGI")
  String? cihazKimligi;
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
  @JsonKey(name: "UYE_SIFRE")
  String? uyeSifre;
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

  /// TODO özel cihaz kimliği ?
  @JsonKey(name: "OZEL_CIHAZ_KIMLIGI")
  String? ozelCihazKimligi;
  @JsonKey(name: "OFFLINE")
  String? offline;
  @JsonKey(name: "SIM_OPERATOR")
  String? simOperator;
  @JsonKey(name: "PAKET_ADI")
  String? paketAdi;
  @JsonKey(name: "PARAM_MAP")
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
  @JsonKey(name: "QR_DATA")
  String? qrData;

  void init() async {
    cihazDili = Platform.localeName;
    cihazTimeZoneDakika = DateTime.now().timeZoneOffset.inMinutes;

    //* Cihaz ve Sim Bilgileri
    final deviceInfo = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      platform = Platform.operatingSystem;
      final androidInfo = await deviceInfo.androidInfo;
      cihazSistemVersiyonu = androidInfo.version.sdkInt.toString();
      cihazMarkasi = androidInfo.brand;
      // ozelCihazKimligi = androidInfo.;
      cihazModeli = androidInfo.model;
      ozelCihazKimligi = androidInfo.id;
    } else if (Platform.isIOS) {
      final iosInfo = await deviceInfo.iosInfo;
      cihazMarkasi = iosInfo.name;
      cihazModeli = iosInfo.model;
      cihazSistemVersiyonu = iosInfo.systemVersion;
      ozelCihazKimligi = iosInfo.identifierForVendor;
    }

    //* Uygulama Bilgileri
    uygulamaSurumu = "225";
    ///  [uygulamaSurumu = packageInfo.version;]
    ///* olarak değiştirilecek fakat API bu uygulamanın sürümünü kabul etmediği için manuel verdim.
    uygulamaSurumKodu = 225;
    requestVersion = 2;
    await PackageInfo.fromPlatform().then((value) => paketAdi = value.packageName);

    // TODO Network Bilgileri (Connectivity Plus)

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
