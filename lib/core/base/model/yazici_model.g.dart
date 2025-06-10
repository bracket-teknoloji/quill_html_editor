// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'yazici_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class YaziciModelAdapter extends TypeAdapter<YaziciModel> {
  @override
  final typeId = 5;

  @override
  YaziciModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return YaziciModel(
      yaziciAdi: fields[0] as String?,
      macAdresi: fields[1] == null ? '' : fields[1] as String,
      yaziciTipi: fields[2] as YaziciTipi?,
      aciklama: fields[3] as String?,
      yazdirmaTipi: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, YaziciModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.yaziciAdi)
      ..writeByte(1)
      ..write(obj.macAdresi)
      ..writeByte(2)
      ..write(obj.yaziciTipi)
      ..writeByte(3)
      ..write(obj.aciklama)
      ..writeByte(4)
      ..write(obj.yazdirmaTipi);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is YaziciModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class YaziciTipiAdapter extends TypeAdapter<YaziciTipi> {
  @override
  final typeId = 6;

  @override
  YaziciTipi read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return YaziciTipi.sewooEtiket;
      case 1:
        return YaziciTipi.sewooFis;
      case 2:
        return YaziciTipi.tscEtiket;
      case 3:
        return YaziciTipi.tscFis;
      case 4:
        return YaziciTipi.genelBTYazici;
      case 5:
        return YaziciTipi.genelEscPosDestekliYazici;
      case 6:
        return YaziciTipi.genelCPCLDestekliYazici;
      case 7:
        return YaziciTipi.zebraFisYazici;
      default:
        return YaziciTipi.sewooEtiket;
    }
  }

  @override
  void write(BinaryWriter writer, YaziciTipi obj) {
    switch (obj) {
      case YaziciTipi.sewooEtiket:
        writer.writeByte(0);
      case YaziciTipi.sewooFis:
        writer.writeByte(1);
      case YaziciTipi.tscEtiket:
        writer.writeByte(2);
      case YaziciTipi.tscFis:
        writer.writeByte(3);
      case YaziciTipi.genelBTYazici:
        writer.writeByte(4);
      case YaziciTipi.genelEscPosDestekliYazici:
        writer.writeByte(5);
      case YaziciTipi.genelCPCLDestekliYazici:
        writer.writeByte(6);
      case YaziciTipi.zebraFisYazici:
        writer.writeByte(7);
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is YaziciTipiAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$YaziciModelImpl _$$YaziciModelImplFromJson(Map<String, dynamic> json) =>
    _$YaziciModelImpl(
      yaziciAdi: json['YAZICI_ADI'] as String?,
      macAdresi: json['MAC_ADRESI'] as String? ?? "",
      yaziciTipi: $enumDecodeNullable(_$YaziciTipiEnumMap, json['YAZICI_TIPI']),
      aciklama: json['ACIKLAMA'] as String?,
      yazdirmaTipi: json['YAZDIRMA_TIPI'] as String?,
    );

Map<String, dynamic> _$$YaziciModelImplToJson(_$YaziciModelImpl instance) =>
    <String, dynamic>{
      if (instance.yaziciAdi case final value?) 'YAZICI_ADI': value,
      'MAC_ADRESI': instance.macAdresi,
      if (_$YaziciTipiEnumMap[instance.yaziciTipi] case final value?)
        'YAZICI_TIPI': value,
      if (instance.aciklama case final value?) 'ACIKLAMA': value,
      if (instance.yazdirmaTipi case final value?) 'YAZDIRMA_TIPI': value,
    };

const _$YaziciTipiEnumMap = {
  YaziciTipi.sewooEtiket: 'sewooEtiket',
  YaziciTipi.sewooFis: 'sewooFis',
  YaziciTipi.tscEtiket: 'tscEtiket',
  YaziciTipi.tscFis: 'tscFis',
  YaziciTipi.genelBTYazici: 'genelBTYazici',
  YaziciTipi.genelEscPosDestekliYazici: 'genelEscPosDestekliYazici',
  YaziciTipi.genelCPCLDestekliYazici: 'genelCPCLDestekliYazici',
  YaziciTipi.zebraFisYazici: 'zebraFisYazici',
};
