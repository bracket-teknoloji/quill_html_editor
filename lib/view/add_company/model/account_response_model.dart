import "package:hive_flutter/hive_flutter.dart";
import "package:json_annotation/json_annotation.dart";

import "../../../core/base/model/base_network_mixin.dart";

part "account_response_model.g.dart";

@JsonSerializable(explicitToJson: true)
@HiveType(typeId: 123)
class AccountResponseModel with NetworkManagerMixin {
  AccountResponseModel();

  AccountResponseModel.demo({this.firma, this.email});
  @HiveField(0)
  String? firma;
  @HiveField(1)
  String? email;
  @HiveField(2)
  String? parola;
  @HiveField(3)
  String? pickerLisansiVar;
  @HiveField(4)
  String? wsLan;
  @HiveField(5)
  String? wsWan;
  @HiveField(6)
  String? webServis;
  @HiveField(7)
  dynamic lisansBitisTarihi;
  @HiveField(8)
  int? kullaniciSayisi;
  @HiveField(9)
  String? firmaKisaAdi;
  @HiveField(10)
  dynamic sozlesmeBitisTarihi;
  @HiveField(11)
  int? sozlesmeBitisKalanGun;
  @HiveField(12)
  String? karsilamaMesaji;
  @HiveField(13)
  String? karsilamaResimUrl;
  @HiveField(14)
  int? karsilamaSaniye;
  @HiveField(15)
  bool? guncellemeVarmi;
  @HiveField(16)
  int? maxApkVersion;
  @HiveField(17)
  String? maxWsVersion;
  @HiveField(18)
  dynamic demoBitisTarihi;
  @HiveField(19)
  @JsonKey(defaultValue: true)
  bool? uzaktanMi;
  @HiveField(20)
  bool? serviceDebug;
  @HiveField(21)
  dynamic bayiKodu;
  @HiveField(22)
  dynamic bayiEmail;
  @HiveField(23)
  dynamic bayiUnvan;
  @HiveField(24)
  bool? bracketCihazi;

  @override
  AccountResponseModel fromJson(Map<String, dynamic> json) => _$AccountResponseModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$AccountResponseModelToJson(this);
}
