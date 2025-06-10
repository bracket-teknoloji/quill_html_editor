// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_tipi_enum.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class EditTipiEnumAdapter extends TypeAdapter<EditTipiEnum> {
  @override
  final typeId = 79;

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
      case 13:
        return EditTipiEnum.isEmri;
      case 14:
        return EditTipiEnum.altIsEmri;
      case 15:
        return EditTipiEnum.isEmriTakip;
      case 16:
        return EditTipiEnum.uretimSonuKaydi;
      case 17:
        return EditTipiEnum.olcumdenDepoTransferi;
      case 18:
        return EditTipiEnum.uretim;
      case 19:
        return EditTipiEnum.paket;
      case 20:
        return EditTipiEnum.belgesizIslem;
      default:
        return EditTipiEnum.musteri;
    }
  }

  @override
  void write(BinaryWriter writer, EditTipiEnum obj) {
    switch (obj) {
      case EditTipiEnum.musteri:
        writer.writeByte(0);
      case EditTipiEnum.satici:
        writer.writeByte(1);
      case EditTipiEnum.satisFatura:
        writer.writeByte(2);
      case EditTipiEnum.satisIrsaliye:
        writer.writeByte(3);
      case EditTipiEnum.alisFatura:
        writer.writeByte(4);
      case EditTipiEnum.alisIrsaliye:
        writer.writeByte(5);
      case EditTipiEnum.satisTeklifi:
        writer.writeByte(6);
      case EditTipiEnum.alisTalebi:
        writer.writeByte(7);
      case EditTipiEnum.satisTalebi:
        writer.writeByte(8);
      case EditTipiEnum.depoTransferi:
        writer.writeByte(9);
      case EditTipiEnum.ambarGirisi:
        writer.writeByte(10);
      case EditTipiEnum.ambarCikisi:
        writer.writeByte(11);
      case EditTipiEnum.cari:
        writer.writeByte(12);
      case EditTipiEnum.isEmri:
        writer.writeByte(13);
      case EditTipiEnum.altIsEmri:
        writer.writeByte(14);
      case EditTipiEnum.isEmriTakip:
        writer.writeByte(15);
      case EditTipiEnum.uretimSonuKaydi:
        writer.writeByte(16);
      case EditTipiEnum.olcumdenDepoTransferi:
        writer.writeByte(17);
      case EditTipiEnum.uretim:
        writer.writeByte(18);
      case EditTipiEnum.paket:
        writer.writeByte(19);
      case EditTipiEnum.belgesizIslem:
        writer.writeByte(20);
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
