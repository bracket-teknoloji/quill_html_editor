import "package:hive_flutter/hive_flutter.dart";
import "package:json_annotation/json_annotation.dart";

import "../lang_model.dart";
import "kullanici_yetki_model.dart";
import "profil_yetki_model.dart";

part "user_model.g.dart";

@JsonSerializable(createFactory: true)
@HiveType(typeId: 101)
class UserModel {
  UserModel();
  @HiveField(0)
  int? id;
  @HiveField(1)
  String? kuladi;
  @HiveField(2)
  String? parola;
  @HiveField(3)
  String? adi;
  @HiveField(4)
  String? soyadi;
  @HiveField(5)
  String? erpKullanici;
  @HiveField(6)
  String? erpParola;
  @HiveField(7)
  int? profilKodu;
  @HiveField(8)
  String? profilAdi;
  // @HiveField(9)
  ProfilYetkiModel? profilYetki;
  // @HiveField(10)
  KullaniciYetkiModel? kullaniciYetki;
  @HiveField(11)
  String? pickerYetkili;
  @HiveField(12)
  String? yetkiliSubelerJson;
  @HiveField(13)
  double? konumEnlem;
  @HiveField(14)
  double? konumBoylam;
  @HiveField(15)
  LangModel? langModel;
  @HiveField(16)
  String? adSoyad;
  @HiveField(17)
  String? admin;
  @HiveField(18)
  bool? adminMi;

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  @override
  String toString() => toJson().toString();
}
