// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stok_detay_model.dart';

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
  ..dovizTipi = json['DOVIZ_TIPI'] as int?
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

SeriList _$SeriListFromJson(Map<String, dynamic> json) => SeriList()
  ..stokKodu = json['STOK_KODU'] as String?
  ..depoKodu = json['DEPO_KODU'] as int?
  ..miktar = (json['MIKTAR'] as num?)?.toDouble()
  ..seriNo = json['SERI_NO'] as String?
  ..inckeyno = json['INCKEYNO'] as int?
  ..depoTanimi = json['DEPO_TANIMI'] as String?
  ..hareketId = json['HAREKET_ID'] as int?;

Map<String, dynamic> _$SeriListToJson(SeriList instance) {
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
  return val;
}
