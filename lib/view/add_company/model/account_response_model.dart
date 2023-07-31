import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../core/base/model/base_network_mixin.dart';

part 'account_response_model.g.dart';

@JsonSerializable(explicitToJson: true, createToJson: true, fieldRename: FieldRename.screamingSnake)
@HiveType(typeId: 123)
class AccountResponseModel with NetworkManagerMixin {
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
  dynamic karsilamaMesaji;
  @HiveField(13)
  dynamic karsilamaResimUrl;
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

  AccountResponseModel();

  AccountResponseModel.demo({this.firma, this.email});

  @override
  fromJson(Map<String, dynamic> json) => _$AccountResponseModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$AccountResponseModelToJson(this);
}
