// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter

part of 'user_json_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserJson _$UserJsonFromJson(Map<String, dynamic> json) => UserJson()
  ..profilModel = json['profilModel'] == null
      ? null
      : ProfilModel.fromJson(json['profilModel'] as Map<String, dynamic>)
  ..yetkiModel = json['yetkiModel'] as Map<String, dynamic>?
  ..id = json['ID'] as int?
  ..kullaniciAdi = json['KULADI'] as String?
  ..parola = json['PAROLA'] as String?
  ..ad = json['ADI'] as String?
  ..soyad = json['SOYADI'] as String?
  ..erpKullanici = json['ERP_KULLANICI'] as String?
  ..erpParola = json['ERP_PAROLA'] as String?
  ..admin = json['ADMIN'] as String?
  ..adminMi = json['ADMIN_MI'] as bool?
  ..pickerYetkili = json['PICKER_YETKILI'] as String?;

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

ProfilModel _$ProfilModelFromJson(Map<String, dynamic> json) => ProfilModel()
  ..kullaniciYetkiModel = json['kullaniciYetkiModel'] as Map<String, dynamic>?
  ..sirketKalemKayitKontrolBelgeTipleri =
      json['sirket_KalemKayitKontrol_BelgeTipleri'] as List<dynamic>?
  ..sevkiyatSatisIrsEArsivMukellefineKesilmesin =
      json['sevkiyat_SatisIrs_EArsivMukellefineKesilmesin'] as String?
  ..sevkiyatSatisFatEFaturaMukellefineKesilmesin =
      json['sevkiyat_SatisFat_EFaturaMukellefineKesilmesin'] as String?;

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
