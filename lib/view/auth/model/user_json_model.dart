import "dart:convert";

import "package:json_annotation/json_annotation.dart";

part "user_json_model.g.dart";

@JsonSerializable()
class UserJson {
  @JsonKey(name: "profilModel")
  ProfilModel? profilModel;
  @JsonKey(name: "yetkiModel")
  Map? yetkiModel;
  @JsonKey(name: "ID")
  int? id;
  @JsonKey(name: "KULADI")
  String? kullaniciAdi;
  @JsonKey(name: "PAROLA")
  String? parola;
  @JsonKey(name: "ADI")
  String? ad;
  @JsonKey(name: "SOYADI")
  String? soyad;
  @JsonKey(name: "ERP_KULLANICI")
  String? erpKullanici;
  @JsonKey(name: "ERP_PAROLA")
  String? erpParola;
  @JsonKey(name: "ADMIN")
  String? admin;
  @JsonKey(name: "ADMIN_MI")
  bool? adminMi;
  @JsonKey(name: "PICKER_YETKILI")
  String? pickerYetkili;
  @JsonKey(name: "AD_SOYAD")
  late final String? adSoyad = "$ad $soyad";
  UserJson();

  factory UserJson.fromJson(String? json) {
    if (json == null) {
      return UserJson();
    }
    return _$UserJsonFromJson(
        jsonDecode(utf8.decode(base64Decode(json), allowMalformed: true)));
  }

  Map<String, dynamic> toJson() => _$UserJsonToJson(this);

  @override
  toString() => "UserJson {\n id: $id,\n kullaniciAdi: $kullaniciAdi,\n parola: $parola,\n ad: $ad,\n soyad: $soyad,\n erpKullanici: $erpKullanici,\n erpParola: $erpParola,\n admin: $admin, \n admin mi: $adminMi,\n pickerYetkili: $pickerYetkili,\n adSoyad: $adSoyad \n}";
}

@JsonSerializable()
class ProfilModel {
  @JsonKey(name: "kullaniciYetkiModel")
  Map? kullaniciYetkiModel;
  @JsonKey(name: "sirket_KalemKayitKontrol_BelgeTipleri")
  List? sirketKalemKayitKontrolBelgeTipleri;
  @JsonKey(name: "sevkiyat_SatisIrs_EArsivMukellefineKesilmesin")
  String? sevkiyatSatisIrsEArsivMukellefineKesilmesin;
  @JsonKey(name: "sevkiyat_SatisFat_EFaturaMukellefineKesilmesin")
  String? sevkiyatSatisFatEFaturaMukellefineKesilmesin;
  ProfilModel();

  factory ProfilModel.fromJson(Map<String, dynamic> json) => _$ProfilModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProfilModelToJson(this);
}
