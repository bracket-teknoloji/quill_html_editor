// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter

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

SirketModel _$SirketModelFromJson(Map<String, dynamic> json) => $checkedCreate(
      'SirketModel',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const ['isDevredilmis'],
        );
        final val = SirketModel();
        $checkedConvert('SIRKET', (v) => val.sirket = v as String?);
        $checkedConvert('DEVSIRKET', (v) => val.devsirket = v as String?);
        $checkedConvert('YIL', (v) => val.yil = v as int?);
        $checkedConvert('isDevredilmis', (v) => val.isDevredilmis = v as bool?);
        return val;
      },
      fieldKeyMap: const {
        'sirket': 'SIRKET',
        'devsirket': 'DEVSIRKET',
        'yil': 'YIL'
      },
    );

Map<String, dynamic> _$SirketModelToJson(SirketModel instance) =>
    <String, dynamic>{
      'SIRKET': instance.sirket,
      'DEVSIRKET': instance.devsirket,
      'YIL': instance.yil,
      'isDevredilmis': instance.isDevredilmis,
    };
