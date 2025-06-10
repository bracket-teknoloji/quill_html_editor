// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_json_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserJson _$UserJsonFromJson(Map<String, dynamic> json) => UserJson()
  ..profilModel = json['profilModel'] == null
      ? null
      : ProfilModel.fromJson(json['profilModel'] as Map<String, dynamic>)
  ..yetkiModel = json['yetkiModel'] as Map<String, dynamic>?
  ..id = (json['ID'] as num?)?.toInt()
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
  if (instance.profilModel?.toJson() case final value?) 'profilModel': value,
  if (instance.yetkiModel case final value?) 'yetkiModel': value,
  if (instance.id case final value?) 'ID': value,
  if (instance.kullaniciAdi case final value?) 'KULADI': value,
  if (instance.parola case final value?) 'PAROLA': value,
  if (instance.ad case final value?) 'ADI': value,
  if (instance.soyad case final value?) 'SOYADI': value,
  if (instance.erpKullanici case final value?) 'ERP_KULLANICI': value,
  if (instance.erpParola case final value?) 'ERP_PAROLA': value,
  if (instance.admin case final value?) 'ADMIN': value,
  if (instance.adminMi case final value?) 'ADMIN_MI': value,
  if (instance.pickerYetkili case final value?) 'PICKER_YETKILI': value,
};

ProfilModel _$ProfilModelFromJson(Map<String, dynamic> json) => ProfilModel()
  ..kullaniciYetkiModel = json['kullaniciYetkiModel'] as Map<String, dynamic>?
  ..sirketKalemKayitKontrolBelgeTipleri =
      json['sirket_KalemKayitKontrol_BelgeTipleri'] as List<dynamic>?
  ..sevkiyatSatisIrsEArsivMukellefineKesilmesin =
      json['sevkiyat_SatisIrs_EArsivMukellefineKesilmesin'] as String?
  ..sevkiyatSatisFatEFaturaMukellefineKesilmesin =
      json['sevkiyat_SatisFat_EFaturaMukellefineKesilmesin'] as String?;

Map<String, dynamic> _$ProfilModelToJson(
  ProfilModel instance,
) => <String, dynamic>{
  if (instance.kullaniciYetkiModel case final value?)
    'kullaniciYetkiModel': value,
  if (instance.sirketKalemKayitKontrolBelgeTipleri case final value?)
    'sirket_KalemKayitKontrol_BelgeTipleri': value,
  if (instance.sevkiyatSatisIrsEArsivMukellefineKesilmesin case final value?)
    'sevkiyat_SatisIrs_EArsivMukellefineKesilmesin': value,
  if (instance.sevkiyatSatisFatEFaturaMukellefineKesilmesin case final value?)
    'sevkiyat_SatisFat_EFaturaMukellefineKesilmesin': value,
};
