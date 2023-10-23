// GENERATED CODE - DO NOT MODIFY BY HAND

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
  bool operator ==(Object other) => identical(this, other) || other is IsletmeModelAdapter && runtimeType == other.runtimeType && typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IsletmeModel _$IsletmeModelFromJson(Map<String, dynamic> json) => IsletmeModel(
      sirket: json['SIRKET'] as String?,
      isletmeKodu: json['ISLETME_KODU'] as int?,
      subeKodu: json['SUBE_KODU'] as int?,
      subeAdi: json['SUBE_ADI'] as String?,
      isletmeAdi: json['ISLETME_ADI'] as String?,
      lokalDepoAktif: json['LOKAL_DEPO_AKTIF'] as bool?,
      merkezmi: json['MERKEZMI'] as String?,
      adres: json['ADRES'] as String?,
      telefon: json['TELEFON'] as String?,
      faks: json['FAKS'] as String?,
      email: json['EMAIL'] as String?,
      ilAdi: json['IL_ADI'] as String?,
      ilce: json['ILCE'] as String?,
      vergiNumarasi: json['VERGI_NUMARASI'] as String?,
      vergiDairesi: json['VERGI_DAIRESI'] as String?,
    );

Map<String, dynamic> _$IsletmeModelToJson(IsletmeModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('SIRKET', instance.sirket);
  writeNotNull('ISLETME_KODU', instance.isletmeKodu);
  writeNotNull('SUBE_KODU', instance.subeKodu);
  writeNotNull('SUBE_ADI', instance.subeAdi);
  writeNotNull('ISLETME_ADI', instance.isletmeAdi);
  writeNotNull('LOKAL_DEPO_AKTIF', instance.lokalDepoAktif);
  writeNotNull('MERKEZMI', instance.merkezmi);
  writeNotNull('ADRES', instance.adres);
  writeNotNull('TELEFON', instance.telefon);
  writeNotNull('FAKS', instance.faks);
  writeNotNull('EMAIL', instance.email);
  writeNotNull('IL_ADI', instance.ilAdi);
  writeNotNull('ILCE', instance.ilce);
  writeNotNull('VERGI_NUMARASI', instance.vergiNumarasi);
  writeNotNull('VERGI_DAIRESI', instance.vergiDairesi);
  return val;
}
