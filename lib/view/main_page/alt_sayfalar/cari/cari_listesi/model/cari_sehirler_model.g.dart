// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cari_sehirler_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CariSehirlerModelAdapter extends TypeAdapter<CariSehirlerModel> {
  @override
  final typeId = 7;

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
    CariSehirlerModel()..sehirAdi = json['SEHIR_ADI'] as String?;

Map<String, dynamic> _$CariSehirlerModelToJson(CariSehirlerModel instance) =>
    <String, dynamic>{'SEHIR_ADI': ?instance.sehirAdi};
