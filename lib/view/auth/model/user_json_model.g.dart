// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_json_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserJson _$UserJsonFromJson(Map<String, dynamic> json) => UserJson()
  ..id = json['id'] as int?
  ..kullaniciAdi = json['KULADI'] as String?
  ..parola = json['PAROLA'] as String?
  ..ad = json['ADI'] as String?
  ..soyad = json['SOYADI'] as String?
  ..erpKullanici = json['ERP_KULLANICI'] as String?
  ..erpParola = json['ERP_PAROLA'] as String?
  ..pickerYetkili = json['PICKER_YETKILI'] as String?;

Map<String, dynamic> _$UserJsonToJson(UserJson instance) => <String, dynamic>{
      'id': instance.id,
      'KULADI': instance.kullaniciAdi,
      'PAROLA': instance.parola,
      'ADI': instance.ad,
      'SOYADI': instance.soyad,
      'ERP_KULLANICI': instance.erpKullanici,
      'ERP_PAROLA': instance.erpParola,
      'PICKER_YETKILI': instance.pickerYetkili,
    };
