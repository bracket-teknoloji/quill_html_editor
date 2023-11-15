// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_json_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserJson _$UserJsonFromJson(Map<String, dynamic> json) => UserJson()
  ..profilModel = json['profilModel'] == null ? null : ProfilModel.fromJson(json['profilModel'] as Map<String, dynamic>)
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

Map<String, dynamic> _$UserJsonToJson(UserJson instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('profilModel', instance.profilModel?.toJson());
  writeNotNull('yetkiModel', instance.yetkiModel);
  writeNotNull('ID', instance.id);
  writeNotNull('KULADI', instance.kullaniciAdi);
  writeNotNull('PAROLA', instance.parola);
  writeNotNull('ADI', instance.ad);
  writeNotNull('SOYADI', instance.soyad);
  writeNotNull('ERP_KULLANICI', instance.erpKullanici);
  writeNotNull('ERP_PAROLA', instance.erpParola);
  writeNotNull('ADMIN', instance.admin);
  writeNotNull('ADMIN_MI', instance.adminMi);
  writeNotNull('PICKER_YETKILI', instance.pickerYetkili);
  return val;
}

ProfilModel _$ProfilModelFromJson(Map<String, dynamic> json) => ProfilModel()
  ..kullaniciYetkiModel = json['kullaniciYetkiModel'] as Map<String, dynamic>?
  ..sirketKalemKayitKontrolBelgeTipleri = json['sirket_KalemKayitKontrol_BelgeTipleri'] as List<dynamic>?
  ..sevkiyatSatisIrsEArsivMukellefineKesilmesin = json['sevkiyat_SatisIrs_EArsivMukellefineKesilmesin'] as String?
  ..sevkiyatSatisFatEFaturaMukellefineKesilmesin = json['sevkiyat_SatisFat_EFaturaMukellefineKesilmesin'] as String?;

Map<String, dynamic> _$ProfilModelToJson(ProfilModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('kullaniciYetkiModel', instance.kullaniciYetkiModel);
  writeNotNull('sirket_KalemKayitKontrol_BelgeTipleri', instance.sirketKalemKayitKontrolBelgeTipleri);
  writeNotNull('sevkiyat_SatisIrs_EArsivMukellefineKesilmesin', instance.sevkiyatSatisIrsEArsivMukellefineKesilmesin);
  writeNotNull('sevkiyat_SatisFat_EFaturaMukellefineKesilmesin', instance.sevkiyatSatisFatEFaturaMukellefineKesilmesin);
  return val;
}
