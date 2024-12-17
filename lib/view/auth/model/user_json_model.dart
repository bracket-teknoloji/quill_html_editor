import "dart:convert";
import "dart:developer";

import "package:json_annotation/json_annotation.dart";

part "user_json_model.g.dart";

@JsonSerializable()
class UserJson {
  UserJson();

  factory UserJson.fromJson(String? json) {
    if (json == null) {
      return UserJson();
    }
    log(json);
    // final encoded = base64.encode("ÜĞŞİÖÇ".codeUnits);
    // log(utf8.decode(encoded.codeUnits));
    return _$UserJsonFromJson(
      jsonDecode(utf8.decode(base64Decode(json), allowMalformed: true)),
    );
  }
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

  Map<String, dynamic> toJson() => _$UserJsonToJson(this);

  @override
  String toString() => toJson().toString();
}

@JsonSerializable()
class ProfilModel {
  ProfilModel();

  factory ProfilModel.fromJson(Map<String, dynamic> json) => _$ProfilModelFromJson(json);
  @JsonKey(name: "kullaniciYetkiModel")
  Map? kullaniciYetkiModel;
  @JsonKey(name: "sirket_KalemKayitKontrol_BelgeTipleri")
  List? sirketKalemKayitKontrolBelgeTipleri;
  @JsonKey(name: "sevkiyat_SatisIrs_EArsivMukellefineKesilmesin")
  String? sevkiyatSatisIrsEArsivMukellefineKesilmesin;
  @JsonKey(name: "sevkiyat_SatisFat_EFaturaMukellefineKesilmesin")
  String? sevkiyatSatisFatEFaturaMukellefineKesilmesin;

  Map<String, dynamic> toJson() => _$ProfilModelToJson(this);
}
