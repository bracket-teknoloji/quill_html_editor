import "package:hive_flutter/hive_flutter.dart";
import "package:json_annotation/json_annotation.dart";
import "package:picker/view/main_page/model/user_model/ek_rehberler_model.dart";

import "kullanici_yetki_model.dart";
import "profil_yetki_model.dart";

part "user_model.g.dart";

@JsonSerializable()
@HiveType(typeId: 101)
final class UserModel {
  UserModel();

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
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
  @JsonKey(name: "KULLANICI_YETKI", fromJson: KullaniciYetkiModel.fromJson)
  KullaniciYetkiModel? kullaniciYetki;
  @HiveField(11)
  @JsonKey(name: "PICKER_YETKILI", includeFromJson: true, includeToJson: true)
  String? _pickerYetkili;
  @HiveField(12)
  String? yetkiliSubelerJson;
  @HiveField(13)
  double? konumEnlem;
  @HiveField(14)
  double? konumBoylam;
  @HiveField(16)
  String? adSoyad;
  @HiveField(17)
  @JsonKey(name: "ADMIN", includeFromJson: true, includeToJson: true)
  String? _admin;
  @HiveField(18)
  bool? adminMi;
  @HiveField(19)
  String? plasiyerTanimi;
  @HiveField(20)
  String? plasiyerKodu;
  @JsonKey(name: "EKREHBERLER")
  List<EkRehberlerModel>? ekRehberler;
  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  String get adiSoyadi => "$adi $soyadi";

  bool get pickerYetkili => _pickerYetkili == "E";

  bool get admin => _admin == "E";

  @override
  String toString() => toJson().toString();
}
