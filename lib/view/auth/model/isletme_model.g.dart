// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'isletme_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class IsletmeModelAdapter extends TypeAdapter<IsletmeModel> {
  @override
  final typeId = 107;

  @override
  IsletmeModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return IsletmeModel(
      sirket: fields[0] as String?,
      isletmeKodu: (fields[1] as num?)?.toInt(),
      subeKodu: (fields[2] as num?)?.toInt(),
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
      other is IsletmeModelAdapter && runtimeType == other.runtimeType && typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IsletmeModel _$IsletmeModelFromJson(Map<String, dynamic> json) => IsletmeModel(
  sirket: json['SIRKET'] as String?,
  isletmeKodu: (json['ISLETME_KODU'] as num?)?.toInt(),
  subeKodu: (json['SUBE_KODU'] as num?)?.toInt(),
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

Map<String, dynamic> _$IsletmeModelToJson(IsletmeModel instance) => <String, dynamic>{
  if (instance.sirket case final value?) 'SIRKET': value,
  if (instance.isletmeKodu case final value?) 'ISLETME_KODU': value,
  if (instance.subeKodu case final value?) 'SUBE_KODU': value,
  if (instance.subeAdi case final value?) 'SUBE_ADI': value,
  if (instance.isletmeAdi case final value?) 'ISLETME_ADI': value,
  if (instance.lokalDepoAktif case final value?) 'LOKAL_DEPO_AKTIF': value,
  if (instance.merkezmi case final value?) 'MERKEZMI': value,
  if (instance.adres case final value?) 'ADRES': value,
  if (instance.telefon case final value?) 'TELEFON': value,
  if (instance.faks case final value?) 'FAKS': value,
  if (instance.email case final value?) 'EMAIL': value,
  if (instance.ilAdi case final value?) 'IL_ADI': value,
  if (instance.ilce case final value?) 'ILCE': value,
  if (instance.vergiNumarasi case final value?) 'VERGI_NUMARASI': value,
  if (instance.vergiDairesi case final value?) 'VERGI_DAIRESI': value,
};
