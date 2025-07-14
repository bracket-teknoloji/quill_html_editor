// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stok_detay_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SeriListAdapter extends TypeAdapter<_SeriList> {
  @override
  final typeId = 196;

  @override
  _SeriList read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _SeriList(
      stokKodu: fields[0] as String?,
      depoKodu: (fields[1] as num?)?.toInt(),
      miktar: (fields[2] as num?)?.toDouble(),
      seriNo: fields[3] as String?,
      inckeyno: (fields[4] as num?)?.toInt(),
      depoTanimi: fields[5] as String?,
      hareketId: (fields[6] as num?)?.toInt(),
      barkod: fields[7] as String?,
      gckod: fields[8] as String?,
      seri1: fields[9] as String?,
      requestVersion: (fields[10] as num?)?.toInt(),
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
      refId: (fields[23] as num?)?.toInt(),
      aciklama1: fields[24] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, _SeriList obj) {
    writer
      ..writeByte(25)
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
      ..write(obj.refId)
      ..writeByte(24)
      ..write(obj.aciklama1);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is SeriListAdapter && runtimeType == other.runtimeType && typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StokDetayModel _$StokDetayModelFromJson(Map<String, dynamic> json) => StokDetayModel()
  ..stokKodu = json['STOK_KODU'] as String?
  ..stokAdi = json['STOK_ADI'] as String?
  ..seriList = (json['SeriList'] as List<dynamic>?)?.map((e) => SeriList.fromJson(e as Map<String, dynamic>)).toList()
  ..yapList = json['YapList'] as List<dynamic>?
  ..stokList = (json['StokList'] as List<dynamic>?)
      ?.map((e) => StokListesiModel.fromJson(e as Map<String, dynamic>))
      .toList()
  ..fiyatList = (json['FiyatList'] as List<dynamic>?)
      ?.map((e) => FiyatList.fromJson(e as Map<String, dynamic>))
      .toList();

Map<String, dynamic> _$StokDetayModelToJson(StokDetayModel instance) => <String, dynamic>{
  if (instance.stokKodu case final value?) 'STOK_KODU': value,
  if (instance.stokAdi case final value?) 'STOK_ADI': value,
  if (instance.seriList?.map((e) => e.toJson()).toList() case final value?) 'SeriList': value,
  if (instance.yapList case final value?) 'YapList': value,
  if (instance.stokList?.map((e) => e.toJson()).toList() case final value?) 'StokList': value,
  if (instance.fiyatList?.map((e) => e.toJson()).toList() case final value?) 'FiyatList': value,
};

FiyatList _$FiyatListFromJson(Map<String, dynamic> json) => FiyatList()
  ..aS = json['A_S'] as String?
  ..stokKodu = json['STOK_KODU'] as String?
  ..dovizTipi = (json['DOVIZ_TIPI'] as num?)?.toInt()
  ..dovizKodu = json['DOVIZ_KODU'] as String?
  ..bastar = json['BASTAR'] == null ? null : DateTime.parse(json['BASTAR'] as String)
  ..bittar = json['BITTAR'] == null ? null : DateTime.parse(json['BITTAR'] as String)
  ..gecerli = json['GECERLI'] as String?
  ..fiyat1 = (json['FIYAT1'] as num?)?.toDouble()
  ..fiyat2 = (json['FIYAT2'] as num?)?.toDouble()
  ..fiyat3 = (json['FIYAT3'] as num?)?.toDouble()
  ..fiyat4 = (json['FIYAT4'] as num?)?.toDouble();

Map<String, dynamic> _$FiyatListToJson(FiyatList instance) => <String, dynamic>{
  if (instance.aS case final value?) 'A_S': value,
  if (instance.stokKodu case final value?) 'STOK_KODU': value,
  if (instance.dovizTipi case final value?) 'DOVIZ_TIPI': value,
  if (instance.dovizKodu case final value?) 'DOVIZ_KODU': value,
  if (instance.bastar?.toIso8601String() case final value?) 'BASTAR': value,
  if (instance.bittar?.toIso8601String() case final value?) 'BITTAR': value,
  if (instance.gecerli case final value?) 'GECERLI': value,
  if (instance.fiyat1 case final value?) 'FIYAT1': value,
  if (instance.fiyat2 case final value?) 'FIYAT2': value,
  if (instance.fiyat3 case final value?) 'FIYAT3': value,
  if (instance.fiyat4 case final value?) 'FIYAT4': value,
};

_SeriList _$SeriListFromJson(Map<String, dynamic> json) => _SeriList(
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
  sonKullanmaTarihi: json['SON_KULLANMA_TARIHI'] == null ? null : DateTime.parse(json['SON_KULLANMA_TARIHI'] as String),
  stokAdi: json['STOK_ADI'] as String?,
  hucreKodu: json['HUCRE_KODU'] as String?,
  tarih: json['TARIH'] == null ? null : DateTime.parse(json['TARIH'] as String),
  refId: (json['REF_ID'] as num?)?.toInt(),
  aciklama1: json['ACIKLAMA1'] as String?,
);

Map<String, dynamic> _$SeriListToJson(_SeriList instance) => <String, dynamic>{
  if (instance.stokKodu case final value?) 'STOK_KODU': value,
  if (instance.depoKodu case final value?) 'DEPO_KODU': value,
  if (instance.miktar case final value?) 'MIKTAR': value,
  if (instance.seriNo case final value?) 'SERI_NO': value,
  if (instance.inckeyno case final value?) 'INCKEYNO': value,
  if (instance.depoTanimi case final value?) 'DEPO_TANIMI': value,
  if (instance.hareketId case final value?) 'HAREKET_ID': value,
  if (instance.barkod case final value?) 'BARKOD': value,
  if (instance.gckod case final value?) 'GCKOD': value,
  if (instance.seri1 case final value?) 'SERI1': value,
  if (instance.requestVersion case final value?) 'REQUEST_VERSION': value,
  if (instance.tempBarkod case final value?) 'TEMP_BARKOD': value,
  if (instance.seri2 case final value?) 'SERI2': value,
  if (instance.seri3 case final value?) 'SERI3': value,
  if (instance.seri4 case final value?) 'SERI4': value,
  if (instance.acik1 case final value?) 'ACIK1': value,
  if (instance.acik2 case final value?) 'ACIK2': value,
  if (instance.acik3 case final value?) 'ACIK3': value,
  if (instance.acik4 case final value?) 'ACIK4': value,
  if (instance.sonKullanmaTarihi?.toIso8601String() case final value?) 'SON_KULLANMA_TARIHI': value,
  if (instance.stokAdi case final value?) 'STOK_ADI': value,
  if (instance.hucreKodu case final value?) 'HUCRE_KODU': value,
  if (instance.tarih?.toIso8601String() case final value?) 'TARIH': value,
  if (instance.refId case final value?) 'REF_ID': value,
  if (instance.aciklama1 case final value?) 'ACIKLAMA1': value,
};
