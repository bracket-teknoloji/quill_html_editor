// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter

part of 'isletme_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class IsletmeModelAdapter extends TypeAdapter<IsletmeModel> {
  @override
  final int typeId = 107;

  @override
  IsletmeModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return IsletmeModel(
      sirket: fields[0] as String?,
      isletmeKodu: fields[1] as int?,
      subeKodu: fields[2] as int?,
      subeAdi: fields[3] as String?,
      isletmeAdi: fields[4] as String?,
      lokalDepoAktif: fields[5] as bool?,
      merkezmi: fields[6] as String?,
      adres: fields[7] as String?,
      telefon: fields[8] as String?,
      faks: fields[9] as String?,
      email: fields[10] as String?,
      ilAdi: fields[11] as String?,
      ilce: fields[12] as String?,
      vergiNumarasi: fields[13] as String?,
      vergiDairesi: fields[14] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, IsletmeModel obj) {
    writer
      ..writeByte(15)
      ..writeByte(0)
      ..write(obj.sirket)
      ..writeByte(1)
      ..write(obj.isletmeKodu)
      ..writeByte(2)
      ..write(obj.subeKodu)
      ..writeByte(3)
      ..write(obj.subeAdi)
      ..writeByte(4)
      ..write(obj.isletmeAdi)
      ..writeByte(5)
      ..write(obj.lokalDepoAktif)
      ..writeByte(6)
      ..write(obj.merkezmi)
      ..writeByte(7)
      ..write(obj.adres)
      ..writeByte(8)
      ..write(obj.telefon)
      ..writeByte(9)
      ..write(obj.faks)
      ..writeByte(10)
      ..write(obj.email)
      ..writeByte(11)
      ..write(obj.ilAdi)
      ..writeByte(12)
      ..write(obj.ilce)
      ..writeByte(13)
      ..write(obj.vergiNumarasi)
      ..writeByte(14)
      ..write(obj.vergiDairesi);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IsletmeModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IsletmeModel _$IsletmeModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'IsletmeModel',
      json,
      ($checkedConvert) {
        final val = IsletmeModel(
          sirket: $checkedConvert('SIRKET', (v) => v as String?),
          isletmeKodu: $checkedConvert('ISLETME_KODU', (v) => v as int?),
          subeKodu: $checkedConvert('SUBE_KODU', (v) => v as int?),
          subeAdi: $checkedConvert('SUBE_ADI', (v) => v as String?),
          isletmeAdi: $checkedConvert('ISLETME_ADI', (v) => v as String?),
          lokalDepoAktif:
              $checkedConvert('LOKAL_DEPO_AKTIF', (v) => v as bool?),
          merkezmi: $checkedConvert('MERKEZMI', (v) => v as String?),
          adres: $checkedConvert('ADRES', (v) => v as String?),
          telefon: $checkedConvert('TELEFON', (v) => v as String?),
          faks: $checkedConvert('FAKS', (v) => v as String?),
          email: $checkedConvert('EMAIL', (v) => v as String?),
          ilAdi: $checkedConvert('IL_ADI', (v) => v as String?),
          ilce: $checkedConvert('ILCE', (v) => v as String?),
          vergiNumarasi: $checkedConvert('VERGI_NUMARASI', (v) => v as String?),
          vergiDairesi: $checkedConvert('VERGI_DAIRESI', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {
        'sirket': 'SIRKET',
        'isletmeKodu': 'ISLETME_KODU',
        'subeKodu': 'SUBE_KODU',
        'subeAdi': 'SUBE_ADI',
        'isletmeAdi': 'ISLETME_ADI',
        'lokalDepoAktif': 'LOKAL_DEPO_AKTIF',
        'merkezmi': 'MERKEZMI',
        'adres': 'ADRES',
        'telefon': 'TELEFON',
        'faks': 'FAKS',
        'email': 'EMAIL',
        'ilAdi': 'IL_ADI',
        'ilce': 'ILCE',
        'vergiNumarasi': 'VERGI_NUMARASI',
        'vergiDairesi': 'VERGI_DAIRESI'
      },
    );

Map<String, dynamic> _$IsletmeModelToJson(IsletmeModel instance) =>
    <String, dynamic>{
      'SIRKET': instance.sirket,
      'ISLETME_KODU': instance.isletmeKodu,
      'SUBE_KODU': instance.subeKodu,
      'SUBE_ADI': instance.subeAdi,
      'ISLETME_ADI': instance.isletmeAdi,
      'LOKAL_DEPO_AKTIF': instance.lokalDepoAktif,
      'MERKEZMI': instance.merkezmi,
      'ADRES': instance.adres,
      'TELEFON': instance.telefon,
      'FAKS': instance.faks,
      'EMAIL': instance.email,
      'IL_ADI': instance.ilAdi,
      'ILCE': instance.ilce,
      'VERGI_NUMARASI': instance.vergiNumarasi,
      'VERGI_DAIRESI': instance.vergiDairesi,
    };
