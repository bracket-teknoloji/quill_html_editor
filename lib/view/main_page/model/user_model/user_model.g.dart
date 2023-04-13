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
        $checkedConvert(
            'PROFIL_YETKI',
            (v) => val.profilYetki =
                v == null ? null : ProfilYetkiModel.fromJson(v as String));
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
        $checkedConvert('ADMIN', (v) => val.admin = v as String?);
        $checkedConvert('ADMIN_MI', (v) => val.adminMi = v as bool?);
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
        'adSoyad': 'AD_SOYAD',
        'admin': 'ADMIN',
        'adminMi': 'ADMIN_MI'
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
