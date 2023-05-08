// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter

part of 'cari_sehirler_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CariSehirlerModelAdapter extends TypeAdapter<CariSehirlerModel> {
  @override
  final int typeId = 7;

  @override
  CariSehirlerModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CariSehirlerModel()..sehirAdi = fields[0] as String?;
  }

  @override
  void write(BinaryWriter writer, CariSehirlerModel obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.sehirAdi);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CariSehirlerModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CariSehirlerModel _$CariSehirlerModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'CariSehirlerModel',
      json,
      ($checkedConvert) {
        final val = CariSehirlerModel();
        $checkedConvert('SEHIR_ADI', (v) => val.sehirAdi = v as String?);
        return val;
      },
      fieldKeyMap: const {'sehirAdi': 'SEHIR_ADI'},
    );

Map<String, dynamic> _$CariSehirlerModelToJson(CariSehirlerModel instance) =>
    <String, dynamic>{
      'SEHIR_ADI': instance.sehirAdi,
    };
