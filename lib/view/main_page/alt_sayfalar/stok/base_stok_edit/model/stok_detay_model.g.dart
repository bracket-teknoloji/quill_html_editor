// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stok_detay_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SeriListImplAdapter extends TypeAdapter<_$SeriListImpl> {
  @override
  final int typeId = 196;

  @override
  _$SeriListImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$SeriListImpl(
      stokKodu: fields[0] as String?,
      depoKodu: fields[1] as int?,
      miktar: fields[2] as double?,
      seriNo: fields[3] as String?,
      inckeyno: fields[4] as int?,
      depoTanimi: fields[5] as String?,
      hareketId: fields[6] as int?,
      barkod: fields[7] as String?,
      gckod: fields[8] as String?,
      seri1: fields[9] as String?,
      requestVersion: fields[10] as int?,
      tempBarkod: fields[11] as String?,
      seri2: fields[12] as String?,
      seri3: fields[13] as String?,
      seri4: fields[14] as String?,
      acik1: fields[15] as String?,
      acik2: fields[16] as String?,
      acik3: fields[17] as String?,
      acik4: fields[18] as String?,
      sonKullanmaTarihi: fields[19] as DateTime?,
      stokAdi: fields[20] as String?,
      hucreKodu: fields[21] as String?,
      tarih: fields[22] as DateTime?,
      refId: fields[23] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, _$SeriListImpl obj) {
    writer
      ..writeByte(24)
      ..writeByte(0)
      ..write(obj.stokKodu)
      ..writeByte(1)
      ..write(obj.depoKodu)
      ..writeByte(2)
      ..write(obj.miktar)
      ..writeByte(3)
      ..write(obj.seriNo)
      ..writeByte(4)
      ..write(obj.inckeyno)
      ..writeByte(5)
      ..write(obj.depoTanimi)
      ..writeByte(6)
      ..write(obj.hareketId)
      ..writeByte(7)
      ..write(obj.barkod)
      ..writeByte(8)
      ..write(obj.gckod)
      ..writeByte(9)
      ..write(obj.seri1)
      ..writeByte(10)
      ..write(obj.requestVersion)
      ..writeByte(11)
      ..write(obj.tempBarkod)
      ..writeByte(12)
      ..write(obj.seri2)
      ..writeByte(13)
      ..write(obj.seri3)
      ..writeByte(14)
      ..write(obj.seri4)
      ..writeByte(15)
      ..write(obj.acik1)
      ..writeByte(16)
      ..write(obj.acik2)
      ..writeByte(17)
      ..write(obj.acik3)
      ..writeByte(18)
      ..write(obj.acik4)
      ..writeByte(19)
      ..write(obj.sonKullanmaTarihi)
      ..writeByte(20)
      ..write(obj.stokAdi)
      ..writeByte(21)
      ..write(obj.hucreKodu)
      ..writeByte(22)
      ..write(obj.tarih)
      ..writeByte(23)
      ..write(obj.refId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SeriListImplAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StokDetayModel _$StokDetayModelFromJson(Map<String, dynamic> json) =>
    StokDetayModel()
      ..stokKodu = json['STOK_KODU'] as String?
      ..stokAdi = json['STOK_ADI'] as String?
      ..seriList = (json['SeriList'] as List<dynamic>?)
          ?.map((e) => SeriList.fromJson(e as Map<String, dynamic>))
          .toList()
      ..yapList = json['YapList'] as List<dynamic>?
      ..stokList = (json['StokList'] as List<dynamic>?)
          ?.map((e) => StokList.fromJson(e as Map<String, dynamic>))
          .toList()
      ..fiyatList = (json['FiyatList'] as List<dynamic>?)
          ?.map((e) => FiyatList.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$StokDetayModelToJson(StokDetayModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('STOK_KODU', instance.stokKodu);
  writeNotNull('STOK_ADI', instance.stokAdi);
  writeNotNull('SeriList', instance.seriList?.map((e) => e.toJson()).toList());
  writeNotNull('YapList', instance.yapList);
  writeNotNull('StokList', instance.stokList?.map((e) => e.toJson()).toList());
  writeNotNull(
      'FiyatList', instance.fiyatList?.map((e) => e.toJson()).toList());
  return val;
}

FiyatList _$FiyatListFromJson(Map<String, dynamic> json) => FiyatList()
  ..aS = json['A_S'] as String?
  ..stokKodu = json['STOK_KODU'] as String?
  ..dovizTipi = (json['DOVIZ_TIPI'] as num?)?.toInt()
  ..dovizKodu = json['DOVIZ_KODU'] as String?
  ..bastar =
      json['BASTAR'] == null ? null : DateTime.parse(json['BASTAR'] as String)
  ..bittar =
      json['BITTAR'] == null ? null : DateTime.parse(json['BITTAR'] as String)
  ..gecerli = json['GECERLI'] as String?
  ..fiyat1 = (json['FIYAT1'] as num?)?.toDouble()
  ..fiyat2 = (json['FIYAT2'] as num?)?.toDouble()
  ..fiyat3 = (json['FIYAT3'] as num?)?.toDouble()
  ..fiyat4 = (json['FIYAT4'] as num?)?.toDouble();

Map<String, dynamic> _$FiyatListToJson(FiyatList instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('A_S', instance.aS);
  writeNotNull('STOK_KODU', instance.stokKodu);
  writeNotNull('DOVIZ_TIPI', instance.dovizTipi);
  writeNotNull('DOVIZ_KODU', instance.dovizKodu);
  writeNotNull('BASTAR', instance.bastar?.toIso8601String());
  writeNotNull('BITTAR', instance.bittar?.toIso8601String());
  writeNotNull('GECERLI', instance.gecerli);
  writeNotNull('FIYAT1', instance.fiyat1);
  writeNotNull('FIYAT2', instance.fiyat2);
  writeNotNull('FIYAT3', instance.fiyat3);
  writeNotNull('FIYAT4', instance.fiyat4);
  return val;
}

_$SeriListImpl _$$SeriListImplFromJson(Map<String, dynamic> json) =>
    _$SeriListImpl(
      stokKodu: json['STOK_KODU'] as String?,
      depoKodu: (json['DEPO_KODU'] as num?)?.toInt(),
      miktar: (json['MIKTAR'] as num?)?.toDouble(),
      seriNo: json['SERI_NO'] as String?,
      inckeyno: (json['INCKEYNO'] as num?)?.toInt(),
      depoTanimi: json['DEPO_TANIMI'] as String?,
      hareketId: (json['HAREKET_ID'] as num?)?.toInt(),
      barkod: json['BARKOD'] as String?,
      gckod: json['GCKOD'] as String?,
      seri1: json['SERI1'] as String?,
      requestVersion: (json['REQUEST_VERSION'] as num?)?.toInt(),
      tempBarkod: json['TEMP_BARKOD'] as String?,
      seri2: json['SERI2'] as String?,
      seri3: json['SERI3'] as String?,
      seri4: json['SERI4'] as String?,
      acik1: json['ACIK1'] as String?,
      acik2: json['ACIK2'] as String?,
      acik3: json['ACIK3'] as String?,
      acik4: json['ACIK4'] as String?,
      sonKullanmaTarihi: json['SON_KULLANMA_TARIHI'] == null
          ? null
          : DateTime.parse(json['SON_KULLANMA_TARIHI'] as String),
      stokAdi: json['STOK_ADI'] as String?,
      hucreKodu: json['HUCRE_KODU'] as String?,
      tarih: json['TARIH'] == null
          ? null
          : DateTime.parse(json['TARIH'] as String),
      refId: (json['REF_ID'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$SeriListImplToJson(_$SeriListImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('STOK_KODU', instance.stokKodu);
  writeNotNull('DEPO_KODU', instance.depoKodu);
  writeNotNull('MIKTAR', instance.miktar);
  writeNotNull('SERI_NO', instance.seriNo);
  writeNotNull('INCKEYNO', instance.inckeyno);
  writeNotNull('DEPO_TANIMI', instance.depoTanimi);
  writeNotNull('HAREKET_ID', instance.hareketId);
  writeNotNull('BARKOD', instance.barkod);
  writeNotNull('GCKOD', instance.gckod);
  writeNotNull('SERI1', instance.seri1);
  writeNotNull('REQUEST_VERSION', instance.requestVersion);
  writeNotNull('TEMP_BARKOD', instance.tempBarkod);
  writeNotNull('SERI2', instance.seri2);
  writeNotNull('SERI3', instance.seri3);
  writeNotNull('SERI4', instance.seri4);
  writeNotNull('ACIK1', instance.acik1);
  writeNotNull('ACIK2', instance.acik2);
  writeNotNull('ACIK3', instance.acik3);
  writeNotNull('ACIK4', instance.acik4);
  writeNotNull(
      'SON_KULLANMA_TARIHI', instance.sonKullanmaTarihi?.toIso8601String());
  writeNotNull('STOK_ADI', instance.stokAdi);
  writeNotNull('HUCRE_KODU', instance.hucreKodu);
  writeNotNull('TARIH', instance.tarih?.toIso8601String());
  writeNotNull('REF_ID', instance.refId);
  return val;
}
