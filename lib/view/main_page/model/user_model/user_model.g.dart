// GENERATED CODE - DO NOT MODIFY BY HAND

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
      ..pickerYetkili = fields[11] as String?
      ..yetkiliSubelerJson = fields[12] as String?
      ..konumEnlem = fields[13] as double?
      ..konumBoylam = fields[14] as double?
      ..adSoyad = fields[16] as String?
      ..admin = fields[17] as String?
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
      ..write(obj.pickerYetkili)
      ..writeByte(12)
      ..write(obj.yetkiliSubelerJson)
      ..writeByte(13)
      ..write(obj.konumEnlem)
      ..writeByte(14)
      ..write(obj.konumBoylam)
      ..writeByte(16)
      ..write(obj.adSoyad)
      ..writeByte(17)
      ..write(obj.admin)
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
      identical(this, other) ||
      other is UserModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
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
  ..profilYetki = json['PROFIL_YETKI'] == null
      ? null
      : ProfilYetkiModel.fromJson(json['PROFIL_YETKI'] as String)
  ..kullaniciYetki =
      KullaniciYetkiModel.fromJson(json['KULLANICI_YETKI'] as String?)
  ..pickerYetkili = json['PICKER_YETKILI'] as String?
  ..yetkiliSubelerJson = json['YETKILI_SUBELER_JSON'] as String?
  ..konumEnlem = (json['KONUM_ENLEM'] as num?)?.toDouble()
  ..konumBoylam = (json['KONUM_BOYLAM'] as num?)?.toDouble()
  ..adSoyad = json['AD_SOYAD'] as String?
  ..admin = json['ADMIN'] as String?
  ..adminMi = json['ADMIN_MI'] as bool?
  ..plasiyerTanimi = json['PLASIYER_TANIMI'] as String?
  ..plasiyerKodu = json['PLASIYER_KODU'] as String?;

Map<String, dynamic> _$UserModelToJson(UserModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ID', instance.id);
  writeNotNull('KULADI', instance.kuladi);
  writeNotNull('PAROLA', instance.parola);
  writeNotNull('ADI', instance.adi);
  writeNotNull('SOYADI', instance.soyadi);
  writeNotNull('ERP_KULLANICI', instance.erpKullanici);
  writeNotNull('ERP_PAROLA', instance.erpParola);
  writeNotNull('PROFIL_KODU', instance.profilKodu);
  writeNotNull('PROFIL_ADI', instance.profilAdi);
  writeNotNull('PROFIL_YETKI', instance.profilYetki?.toJson());
  writeNotNull('KULLANICI_YETKI', instance.kullaniciYetki?.toJson());
  writeNotNull('PICKER_YETKILI', instance.pickerYetkili);
  writeNotNull('YETKILI_SUBELER_JSON', instance.yetkiliSubelerJson);
  writeNotNull('KONUM_ENLEM', instance.konumEnlem);
  writeNotNull('KONUM_BOYLAM', instance.konumBoylam);
  writeNotNull('AD_SOYAD', instance.adSoyad);
  writeNotNull('ADMIN', instance.admin);
  writeNotNull('ADMIN_MI', instance.adminMi);
  writeNotNull('PLASIYER_TANIMI', instance.plasiyerTanimi);
  writeNotNull('PLASIYER_KODU', instance.plasiyerKodu);
  return val;
}
