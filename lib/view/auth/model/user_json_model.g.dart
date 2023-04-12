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
        $checkedConvert(
            'profilModel',
            (v) => val.profilModel = v == null
                ? null
                : ProfilModel.fromJson(v as Map<String, dynamic>));
        $checkedConvert(
            'yetkiModel', (v) => val.yetkiModel = v as Map<String, dynamic>?);
        $checkedConvert('ID', (v) => val.id = v as int?);
        $checkedConvert('KULADI', (v) => val.kullaniciAdi = v as String?);
        $checkedConvert('PAROLA', (v) => val.parola = v as String?);
        $checkedConvert('ADI', (v) => val.ad = v as String?);
        $checkedConvert('SOYADI', (v) => val.soyad = v as String?);
        $checkedConvert(
            'ERP_KULLANICI', (v) => val.erpKullanici = v as String?);
        $checkedConvert('ERP_PAROLA', (v) => val.erpParola = v as String?);
        $checkedConvert('ADMIN', (v) => val.admin = v as String?);
        $checkedConvert('ADMIN_MI', (v) => val.adminMi = v as bool?);
        $checkedConvert(
            'PICKER_YETKILI', (v) => val.pickerYetkili = v as String?);
        return val;
      },
      fieldKeyMap: const {
        'id': 'ID',
        'kullaniciAdi': 'KULADI',
        'parola': 'PAROLA',
        'ad': 'ADI',
        'soyad': 'SOYADI',
        'erpKullanici': 'ERP_KULLANICI',
        'erpParola': 'ERP_PAROLA',
        'admin': 'ADMIN',
        'adminMi': 'ADMIN_MI',
        'pickerYetkili': 'PICKER_YETKILI'
      },
    );

Map<String, dynamic> _$UserJsonToJson(UserJson instance) => <String, dynamic>{
      'profilModel': instance.profilModel?.toJson(),
      'yetkiModel': instance.yetkiModel,
      'ID': instance.id,
      'KULADI': instance.kullaniciAdi,
      'PAROLA': instance.parola,
      'ADI': instance.ad,
      'SOYADI': instance.soyad,
      'ERP_KULLANICI': instance.erpKullanici,
      'ERP_PAROLA': instance.erpParola,
      'ADMIN': instance.admin,
      'ADMIN_MI': instance.adminMi,
      'PICKER_YETKILI': instance.pickerYetkili,
    };

ProfilModel _$ProfilModelFromJson(Map<String, dynamic> json) => $checkedCreate(
      'ProfilModel',
      json,
      ($checkedConvert) {
        final val = ProfilModel();
        $checkedConvert('kullaniciYetkiModel',
            (v) => val.kullaniciYetkiModel = v as Map<String, dynamic>?);
        $checkedConvert(
            'sirket_KalemKayitKontrol_BelgeTipleri',
            (v) =>
                val.sirketKalemKayitKontrolBelgeTipleri = v as List<dynamic>?);
        $checkedConvert(
            'sevkiyat_SatisIrs_EArsivMukellefineKesilmesin',
            (v) =>
                val.sevkiyatSatisIrsEArsivMukellefineKesilmesin = v as String?);
        $checkedConvert(
            'sevkiyat_SatisFat_EFaturaMukellefineKesilmesin',
            (v) => val.sevkiyatSatisFatEFaturaMukellefineKesilmesin =
                v as String?);
        return val;
      },
      fieldKeyMap: const {
        'sirketKalemKayitKontrolBelgeTipleri':
            'sirket_KalemKayitKontrol_BelgeTipleri',
        'sevkiyatSatisIrsEArsivMukellefineKesilmesin':
            'sevkiyat_SatisIrs_EArsivMukellefineKesilmesin',
        'sevkiyatSatisFatEFaturaMukellefineKesilmesin':
            'sevkiyat_SatisFat_EFaturaMukellefineKesilmesin'
      },
    );

Map<String, dynamic> _$ProfilModelToJson(ProfilModel instance) =>
    <String, dynamic>{
      'kullaniciYetkiModel': instance.kullaniciYetkiModel,
      'sirket_KalemKayitKontrol_BelgeTipleri':
          instance.sirketKalemKayitKontrolBelgeTipleri,
      'sevkiyat_SatisIrs_EArsivMukellefineKesilmesin':
          instance.sevkiyatSatisIrsEArsivMukellefineKesilmesin,
      'sevkiyat_SatisFat_EFaturaMukellefineKesilmesin':
          instance.sevkiyatSatisFatEFaturaMukellefineKesilmesin,
    };
