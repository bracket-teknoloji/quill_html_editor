import "package:hive_flutter/hive_flutter.dart";
import "package:json_annotation/json_annotation.dart";

import "../lang_model.dart";
import "profil_yetki_model.dart";

part "user_model.g.dart";

@JsonSerializable(createFactory: true)
@HiveType(typeId: 101)
class UserModel {
  UserModel();
  @JsonKey(name: "ID")
  @HiveField(0)
  int? id;
  @JsonKey(name: "KULADI")
  @HiveField(1)
  String? kuladi;
  @JsonKey(name: "PAROLA")
  @HiveField(2)
  String? parola;
  @JsonKey(name: "ADI")
  @HiveField(3)
  String? adi;
  @JsonKey(name: "SOYADI")
  @HiveField(4)
  String? soyadi;
  @JsonKey(name: "ERP_KULLANICI")
  @HiveField(5)
  String? erpKullanici;
  @JsonKey(name: "ERP_PAROLA")
  @HiveField(6)
  String? erpParola;
  @JsonKey(name: "PROFIL_KODU")
  @HiveField(7)
  int? profilKodu;
  @JsonKey(name: "PROFIL_ADI")
  @HiveField(8)
  String? profilAdi;
  @JsonKey(name: "PROFIL_YETKI")
  // @HiveField(9)
  ProfilYetkiModel? profilYetki;
  @JsonKey(name: "KULLANICI_YETKI")
  @HiveField(10)
  String? kullaniciYetki;
  @JsonKey(name: "PICKER_YETKILI")
  @HiveField(11)
  String? pickerYetkili;
  @JsonKey(name: "YETKILI_SUBE_JSON")
  @HiveField(12)
  String? yetkiliSubelerJson;
  @JsonKey(name: "KONUM_ENLEM")
  @HiveField(13)
  double? konumEnlem;
  @JsonKey(name: "KONUM_BOYLAM")
  @HiveField(14)
  double? konumBoylam;
  @JsonKey(name: "LANG_MODEL")
  @HiveField(15)
  LangModel? langModel;
  @JsonKey(name: "AD_SOYAD")
  @HiveField(16)
  String? adSoyad;
  @JsonKey(name: "ADMIN")
  @HiveField(17)
  String? admin;
  @JsonKey(name: "ADMIN_MI")
  @HiveField(18)
  bool? adminMi;

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return _$UserModelFromJson(json);
  }
  Map<String, dynamic> toJson() {
    return _$UserModelToJson(this);
  }

  @override
  String toString() {
    return toJson().toString();
  }
}
