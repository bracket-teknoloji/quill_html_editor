// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter

part of 'user_json_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserJson _$UserJsonFromJson(Map<String, dynamic> json) => $checkedCreate(
      'UserJson',
      json,
      ($checkedConvert) {
        final val = UserJson();
        $checkedConvert('id', (v) => val.id = v as int?);
        $checkedConvert('KULADI', (v) => val.kullaniciAdi = v as String?);
        $checkedConvert('PAROLA', (v) => val.parola = v as String?);
        $checkedConvert('ADI', (v) => val.ad = v as String?);
        $checkedConvert('SOYADI', (v) => val.soyad = v as String?);
        $checkedConvert(
            'ERP_KULLANICI', (v) => val.erpKullanici = v as String?);
        $checkedConvert('ERP_PAROLA', (v) => val.erpParola = v as String?);
        $checkedConvert(
            'PICKER_YETKILI', (v) => val.pickerYetkili = v as String?);
        return val;
      },
      fieldKeyMap: const {
        'kullaniciAdi': 'KULADI',
        'parola': 'PAROLA',
        'ad': 'ADI',
        'soyad': 'SOYADI',
        'erpKullanici': 'ERP_KULLANICI',
        'erpParola': 'ERP_PAROLA',
        'pickerYetkili': 'PICKER_YETKILI'
      },
    );

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
