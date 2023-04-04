// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => $checkedCreate(
      'UserModel',
      json,
      ($checkedConvert) {
        final val = UserModel();
        $checkedConvert('ID', (v) => val.id = v as int?);
        $checkedConvert('KULADI', (v) => val.kuladi = v as String?);
        $checkedConvert('PAROLA', (v) => val.parola = v as String?);
        $checkedConvert('ADI', (v) => val.adi = v as String?);
        $checkedConvert('SOYADI', (v) => val.soyadi = v as String?);
        $checkedConvert(
            'ERP_KULLANICI', (v) => val.erpKullanici = v as String?);
        $checkedConvert('ERP_PAROLA', (v) => val.erpParola = v as String?);
        $checkedConvert('PROFIL_KODU', (v) => val.profilKodu = v as int?);
        $checkedConvert('PROFIL_ADI', (v) => val.profilAdi = v as String?);
        $checkedConvert('PROFIL_YETKI', (v) => val.profilYetki = v as String?);
        $checkedConvert(
            'KULLANICI_YETKI', (v) => val.kullaniciYetki = v as String?);
        $checkedConvert(
            'PICKER_YETKILI', (v) => val.pickerYetkili = v as String?);
        $checkedConvert(
            'YETKILI_SUBE_JSON', (v) => val.yetkiliSubelerJson = v as String?);
        $checkedConvert(
            'KONUM_ENLEM', (v) => val.konumEnlem = (v as num?)?.toDouble());
        $checkedConvert(
            'KONUM_BOYLAM', (v) => val.konumBoylam = (v as num?)?.toDouble());
        $checkedConvert(
            'LANG_MODEL',
            (v) => val.langModel = v == null
                ? null
                : LangModel.fromJson(v as Map<String, dynamic>));
        $checkedConvert('AD_SOYAD', (v) => val.adSoyad = v as String?);
        return val;
      },
      fieldKeyMap: const {
        'id': 'ID',
        'kuladi': 'KULADI',
        'parola': 'PAROLA',
        'adi': 'ADI',
        'soyadi': 'SOYADI',
        'erpKullanici': 'ERP_KULLANICI',
        'erpParola': 'ERP_PAROLA',
        'profilKodu': 'PROFIL_KODU',
        'profilAdi': 'PROFIL_ADI',
        'profilYetki': 'PROFIL_YETKI',
        'kullaniciYetki': 'KULLANICI_YETKI',
        'pickerYetkili': 'PICKER_YETKILI',
        'yetkiliSubelerJson': 'YETKILI_SUBE_JSON',
        'konumEnlem': 'KONUM_ENLEM',
        'konumBoylam': 'KONUM_BOYLAM',
        'langModel': 'LANG_MODEL',
        'adSoyad': 'AD_SOYAD'
      },
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'ID': instance.id,
      'KULADI': instance.kuladi,
      'PAROLA': instance.parola,
      'ADI': instance.adi,
      'SOYADI': instance.soyadi,
      'ERP_KULLANICI': instance.erpKullanici,
      'ERP_PAROLA': instance.erpParola,
      'PROFIL_KODU': instance.profilKodu,
      'PROFIL_ADI': instance.profilAdi,
      'PROFIL_YETKI': instance.profilYetki,
      'KULLANICI_YETKI': instance.kullaniciYetki,
      'PICKER_YETKILI': instance.pickerYetkili,
      'YETKILI_SUBE_JSON': instance.yetkiliSubelerJson,
      'KONUM_ENLEM': instance.konumEnlem,
      'KONUM_BOYLAM': instance.konumBoylam,
      'LANG_MODEL': instance.langModel?.toJson(),
      'AD_SOYAD': instance.adSoyad,
    };
