// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserModelAdapter extends TypeAdapter<UserModel> {
  @override
  final typeId = 101;

  @override
  UserModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserModel()
      ..id = (fields[0] as num?)?.toInt()
      ..kuladi = fields[1] as String?
      ..parola = fields[2] as String?
      ..adi = fields[3] as String?
      ..soyadi = fields[4] as String?
      ..erpKullanici = fields[5] as String?
      ..erpParola = fields[6] as String?
      ..profilKodu = (fields[7] as num?)?.toInt()
      ..profilAdi = fields[8] as String?
      .._pickerYetkili = fields[11] as String?
      ..yetkiliSubelerJson = fields[12] as String?
      ..konumEnlem = (fields[13] as num?)?.toDouble()
      ..konumBoylam = (fields[14] as num?)?.toDouble()
      ..adSoyad = fields[16] as String?
      .._admin = fields[17] as String?
      ..adminMi = fields[18] as bool?
      ..plasiyerTanimi = fields[19] as String?
      ..plasiyerKodu = fields[20] as String?;
  }

  @override
  void write(BinaryWriter writer, UserModel obj) {
    writer
      ..writeByte(18)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.kuladi)
      ..writeByte(2)
      ..write(obj.parola)
      ..writeByte(3)
      ..write(obj.adi)
      ..writeByte(4)
      ..write(obj.soyadi)
      ..writeByte(5)
      ..write(obj.erpKullanici)
      ..writeByte(6)
      ..write(obj.erpParola)
      ..writeByte(7)
      ..write(obj.profilKodu)
      ..writeByte(8)
      ..write(obj.profilAdi)
      ..writeByte(11)
      ..write(obj._pickerYetkili)
      ..writeByte(12)
      ..write(obj.yetkiliSubelerJson)
      ..writeByte(13)
      ..write(obj.konumEnlem)
      ..writeByte(14)
      ..write(obj.konumBoylam)
      ..writeByte(16)
      ..write(obj.adSoyad)
      ..writeByte(17)
      ..write(obj._admin)
      ..writeByte(18)
      ..write(obj.adminMi)
      ..writeByte(19)
      ..write(obj.plasiyerTanimi)
      ..writeByte(20)
      ..write(obj.plasiyerKodu);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is UserModelAdapter && runtimeType == other.runtimeType && typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel()
  ..id = (json['ID'] as num?)?.toInt()
  ..kuladi = json['KULADI'] as String?
  ..parola = json['PAROLA'] as String?
  ..adi = json['ADI'] as String?
  ..soyadi = json['SOYADI'] as String?
  ..erpKullanici = json['ERP_KULLANICI'] as String?
  ..erpParola = json['ERP_PAROLA'] as String?
  ..profilKodu = (json['PROFIL_KODU'] as num?)?.toInt()
  ..profilAdi = json['PROFIL_ADI'] as String?
  ..profilYetki = json['PROFIL_YETKI'] == null ? null : ProfilYetkiModel.fromJson(json['PROFIL_YETKI'] as String)
  ..kullaniciYetki = KullaniciYetkiModel.fromJson(
    json['KULLANICI_YETKI'] as String?,
  )
  .._pickerYetkili = json['PICKER_YETKILI'] as String?
  ..yetkiliSubelerJson = json['YETKILI_SUBELER_JSON'] as String?
  ..konumEnlem = (json['KONUM_ENLEM'] as num?)?.toDouble()
  ..konumBoylam = (json['KONUM_BOYLAM'] as num?)?.toDouble()
  ..adSoyad = json['AD_SOYAD'] as String?
  .._admin = json['ADMIN'] as String?
  ..adminMi = json['ADMIN_MI'] as bool?
  ..plasiyerTanimi = json['PLASIYER_TANIMI'] as String?
  ..plasiyerKodu = json['PLASIYER_KODU'] as String?
  ..ekRehberler = (json['EKREHBERLER'] as List<dynamic>?)
      ?.map((e) => EkRehberlerModel.fromJson(e as Map<String, dynamic>))
      .toList();

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
  if (instance.id case final value?) 'ID': value,
  if (instance.kuladi case final value?) 'KULADI': value,
  if (instance.parola case final value?) 'PAROLA': value,
  if (instance.adi case final value?) 'ADI': value,
  if (instance.soyadi case final value?) 'SOYADI': value,
  if (instance.erpKullanici case final value?) 'ERP_KULLANICI': value,
  if (instance.erpParola case final value?) 'ERP_PAROLA': value,
  if (instance.profilKodu case final value?) 'PROFIL_KODU': value,
  if (instance.profilAdi case final value?) 'PROFIL_ADI': value,
  if (instance.profilYetki?.toJson() case final value?) 'PROFIL_YETKI': value,
  if (instance.kullaniciYetki?.toJson() case final value?) 'KULLANICI_YETKI': value,
  if (instance._pickerYetkili case final value?) 'PICKER_YETKILI': value,
  if (instance.yetkiliSubelerJson case final value?) 'YETKILI_SUBELER_JSON': value,
  if (instance.konumEnlem case final value?) 'KONUM_ENLEM': value,
  if (instance.konumBoylam case final value?) 'KONUM_BOYLAM': value,
  if (instance.adSoyad case final value?) 'AD_SOYAD': value,
  if (instance._admin case final value?) 'ADMIN': value,
  if (instance.adminMi case final value?) 'ADMIN_MI': value,
  if (instance.plasiyerTanimi case final value?) 'PLASIYER_TANIMI': value,
  if (instance.plasiyerKodu case final value?) 'PLASIYER_KODU': value,
  if (instance.ekRehberler?.map((e) => e.toJson()).toList() case final value?) 'EKREHBERLER': value,
};
