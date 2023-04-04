import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../core/base/model/base_network_mixin.dart';

part 'account_response_model.g.dart';

@JsonSerializable(explicitToJson: true, createToJson: true)
@HiveType(typeId: 123)
class AccountResponseModel with NetworkManagerMixin {
  @JsonKey(name: "FIRMA")
  @HiveField(0)
  String? firma;
  @JsonKey(name: "EMAIL")
  @HiveField(1)
  String? email;
  @JsonKey(name: "PAROLA")
  @HiveField(2)
  String? parola;
  @JsonKey(name: "PICKER_LISANSI_VAR")
  @HiveField(3)
  String? pickerLisansiVar;
  @JsonKey(name: "WS_LAN")
  @HiveField(4)
  String? wsLan;
  @JsonKey(name: "WS_WAN")
  @HiveField(5)
  String? wsWan;
  @JsonKey(name: "WEB_SERVIS")
  @HiveField(6)
  String? webServis;
  @JsonKey(name: "LISANS_BITIS_TARIHI")
  @HiveField(7)
  dynamic lisansBitisTarihi;
  @JsonKey(name: "KULLANICI_SAYISI")
  @HiveField(8)
  int? kullaniciSayisi;
  @JsonKey(name: "FIRMA_KISA_ADI")
  @HiveField(9)
  String? firmaKisaAdi;
  @JsonKey(name: "SOZLESME_BITIS_TARIHI")
  @HiveField(10)
  dynamic sozlesmeBitisTarihi;
  @JsonKey(name: "SOZLESME_BITIS_KALAN_GUN")
  @HiveField(11)
  int? sozlesmeBitisKalanGun;
  @JsonKey(name: "KARSILAMA_MESAJI")
  @HiveField(12)
  dynamic karsilamaMesaji;
  @JsonKey(name: "KARSILAMA_RESIM_URL")
  @HiveField(13)
  dynamic karsilamaResimUrl;
  @JsonKey(name: "KARSILAMA_SURESI")
  @HiveField(14)
  int? karsilamaSaniye;
  @JsonKey(name: "GUNCELLEME_VARMI")
  @HiveField(15)
  bool? guncellemeVarmi;
  @JsonKey(name: "MAX_APK_VERSION")
  @HiveField(16)
  int? maxApkVersion;
  @JsonKey(name: "MAX_WS_VERSION")
  @HiveField(17)
  String? maxWsVersion;
  @JsonKey(name: "DEMO_BITIS_TARIHI")
  @HiveField(18)
  dynamic demoBitisTarihi;

  AccountResponseModel();

  @override
  fromJson(Map<String, dynamic> json) {
    return _$AccountResponseModelFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$AccountResponseModelToJson(this);
  }

  @override
  String toString() {
    return "\nFIRMA: $firma,\nEMAIL: $email,\nPAROLA: $parola,\nPICKER_LISANSI_VAR: $pickerLisansiVar,\nWS_LAN: $wsLan,\nWS_WAN: $wsWan,\nWEB_SERVIS: $webServis,\nLISANS_BITIS_TARIHI: $lisansBitisTarihi,\nKULLANICI_SAYISI: $kullaniciSayisi,\nFIRMA_KISA_ADI: $firmaKisaAdi,\nSOZLESME_BITIS_TARIHI: $sozlesmeBitisTarihi,\nSOZLESME_BITIS_KALAN_GUN: $sozlesmeBitisKalanGun,\nKARSILAMA_MESAJI: $karsilamaMesaji,\nKARSILAMA_RESIM_URL: $karsilamaResimUrl,\nKARSILAMA_SURESI: $karsilamaSaniye,\nGUNCELLEME_VARMI: $guncellemeVarmi,\nMAX_APK_VERSION: $maxApkVersion,\nMAX_WS_VERSION: $maxWsVersion,\nDEMO_BITIS_TARIHI: $demoBitisTarihi,\n";
  }
}
