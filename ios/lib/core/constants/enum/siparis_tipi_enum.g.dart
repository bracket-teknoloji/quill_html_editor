// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'siparis_tipi_enum.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SiparisTipiEnumAdapter extends TypeAdapter<SiparisTipiEnum> {
  @override
  final int typeId = 79;

  @override
  SiparisTipiEnum read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return SiparisTipiEnum.musteri;
      case 1:
        return SiparisTipiEnum.satici;
      default:
        return SiparisTipiEnum.musteri;
    }
  }

  @override
  void write(BinaryWriter writer, SiparisTipiEnum obj) {
    switch (obj) {
      case SiparisTipiEnum.musteri:
        writer.writeByte(0);
        break;
      case SiparisTipiEnum.satici:
        writer.writeByte(1);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SiparisTipiEnumAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
