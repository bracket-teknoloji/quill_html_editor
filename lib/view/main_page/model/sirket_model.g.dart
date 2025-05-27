// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sirket_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SirketModelAdapter extends TypeAdapter<SirketModel> {
  @override
  final int typeId = 102;

  @override
  SirketModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SirketModel()
      ..sirket = fields[0] as String?
      ..devsirket = fields[1] as String?
      ..yil = fields[2] as int?
      ..isDevredilmis = fields[3] as bool?;
  }

  @override
  void write(BinaryWriter writer, SirketModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.sirket)
      ..writeByte(1)
      ..write(obj.devsirket)
      ..writeByte(2)
      ..write(obj.yil)
      ..writeByte(3)
      ..write(obj.isDevredilmis);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SirketModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SirketModel _$SirketModelFromJson(Map<String, dynamic> json) => SirketModel()
  ..sirket = json['SIRKET'] as String?
  ..devsirket = json['DEVSIRKET'] as String?
  ..yil = (json['YIL'] as num?)?.toInt()
  ..isDevredilmis = json['isDevredilmis'] as bool?;

Map<String, dynamic> _$SirketModelToJson(SirketModel instance) =>
    <String, dynamic>{
      if (instance.sirket case final value?) 'SIRKET': value,
      if (instance.devsirket case final value?) 'DEVSIRKET': value,
      if (instance.yil case final value?) 'YIL': value,
      if (instance.isDevredilmis case final value?) 'isDevredilmis': value,
    };
