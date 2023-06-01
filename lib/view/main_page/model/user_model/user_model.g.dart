// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter

part of 'user_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserModelAdapter extends TypeAdapter<UserModel> {
  @override
  final int typeId = 101;

  @override
  UserModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserModel()
      ..id = fields[0] as int?
      ..kuladi = fields[1] as String?
      ..parola = fields[2] as String?
      ..adi = fields[3] as String?
      ..soyadi = fields[4] as String?
      ..erpKullanici = fields[5] as String?
      ..erpParola = fields[6] as String?
      ..profilKodu = fields[7] as int?
      ..profilAdi = fields[8] as String?
      ..kullaniciYetki = fields[10] as String?
      ..pickerYetkili = fields[11] as String?
      ..yetkiliSubelerJson = fields[12] as String?
      ..konumEnlem = fields[13] as double?
      ..konumBoylam = fields[14] as double?
      ..langModel = fields[15] as LangModel?
      ..adSoyad = fields[16] as String?
      ..admin = fields[17] as String?
      ..adminMi = fields[18] as bool?;
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
      ..writeByte(10)
      ..write(obj.kullaniciYetki)
      ..writeByte(11)
      ..write(obj.pickerYetkili)
      ..writeByte(12)
      ..write(obj.yetkiliSubelerJson)
      ..writeByte(13)
      ..write(obj.konumEnlem)
      ..writeByte(14)
      ..write(obj.konumBoylam)
      ..writeByte(15)
      ..write(obj.langModel)
      ..writeByte(16)
      ..write(obj.adSoyad)
      ..writeByte(17)
      ..write(obj.admin)
      ..writeByte(18)
      ..write(obj.adminMi);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel()
  ..id = json['ID'] as int?
  ..kuladi = json['KULADI'] as String?
  ..parola = json['PAROLA'] as String?
  ..adi = json['ADI'] as String?
  ..soyadi = json['SOYADI'] as String?
  ..erpKullanici = json['ERP_KULLANICI'] as String?
  ..erpParola = json['ERP_PAROLA'] as String?
  ..profilKodu = json['PROFIL_KODU'] as int?
  ..profilAdi = json['PROFIL_ADI'] as String?
  ..profilYetki = json['PROFIL_YETKI'] == null
      ? null
      : ProfilYetkiModel.fromJson(json['PROFIL_YETKI'] as String)
  ..kullaniciYetki = json['KULLANICI_YETKI'] as String?
  ..pickerYetkili = json['PICKER_YETKILI'] as String?
  ..yetkiliSubelerJson = json['YETKILI_SUBE_JSON'] as String?
  ..konumEnlem = (json['KONUM_ENLEM'] as num?)?.toDouble()
  ..konumBoylam = (json['KONUM_BOYLAM'] as num?)?.toDouble()
  ..langModel = json['LANG_MODEL'] == null
      ? null
      : LangModel.fromJson(json['LANG_MODEL'] as Map<String, dynamic>)
  ..adSoyad = json['AD_SOYAD'] as String?
  ..admin = json['ADMIN'] as String?
  ..adminMi = json['ADMIN_MI'] as bool?;

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
      'PROFIL_YETKI': instance.profilYetki?.toJson(),
      'KULLANICI_YETKI': instance.kullaniciYetki,
      'PICKER_YETKILI': instance.pickerYetkili,
      'YETKILI_SUBE_JSON': instance.yetkiliSubelerJson,
      'KONUM_ENLEM': instance.konumEnlem,
      'KONUM_BOYLAM': instance.konumBoylam,
      'LANG_MODEL': instance.langModel?.toJson(),
      'AD_SOYAD': instance.adSoyad,
      'ADMIN': instance.admin,
      'ADMIN_MI': instance.adminMi,
    };
