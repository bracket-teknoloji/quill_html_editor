// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_tipi_enum.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class EditTipiEnumAdapter extends TypeAdapter<EditTipiEnum> {
  @override
  final int typeId = 79;

  @override
  EditTipiEnum read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return EditTipiEnum.musteri;
      case 1:
        return EditTipiEnum.satici;
      case 2:
        return EditTipiEnum.satisFatura;
      case 3:
        return EditTipiEnum.satisIrsaliye;
      case 4:
        return EditTipiEnum.alisFatura;
      case 5:
        return EditTipiEnum.alisIrsaliye;
      case 6:
        return EditTipiEnum.satisTeklifi;
      case 7:
        return EditTipiEnum.alisTalebi;
      case 8:
        return EditTipiEnum.satisTalebi;
      case 9:
        return EditTipiEnum.depoTransferi;
      case 10:
        return EditTipiEnum.ambarGirisi;
      case 11:
        return EditTipiEnum.ambarCikisi;
      case 12:
        return EditTipiEnum.cari;
      default:
        return EditTipiEnum.musteri;
    }
  }

  @override
  void write(BinaryWriter writer, EditTipiEnum obj) {
    switch (obj) {
      case EditTipiEnum.musteri:
        writer.writeByte(0);
        break;
      case EditTipiEnum.satici:
        writer.writeByte(1);
        break;
      case EditTipiEnum.satisFatura:
        writer.writeByte(2);
        break;
      case EditTipiEnum.satisIrsaliye:
        writer.writeByte(3);
        break;
      case EditTipiEnum.alisFatura:
        writer.writeByte(4);
        break;
      case EditTipiEnum.alisIrsaliye:
        writer.writeByte(5);
        break;
      case EditTipiEnum.satisTeklifi:
        writer.writeByte(6);
        break;
      case EditTipiEnum.alisTalebi:
        writer.writeByte(7);
        break;
      case EditTipiEnum.satisTalebi:
        writer.writeByte(8);
        break;
      case EditTipiEnum.depoTransferi:
        writer.writeByte(9);
        break;
      case EditTipiEnum.ambarGirisi:
        writer.writeByte(10);
        break;
      case EditTipiEnum.ambarCikisi:
        writer.writeByte(11);
        break;
      case EditTipiEnum.cari:
        writer.writeByte(12);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EditTipiEnumAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
