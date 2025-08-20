// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'olcum_ekle_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OlcumEkleModel _$OlcumEkleModelFromJson(Map<String, dynamic> json) =>
    _OlcumEkleModel(
      belgeNo: json['BELGE_NO'] as String?,
      belgeTipi: json['BELGE_TIPI'] as String?,
      belgeSira: (json['BELGE_SIRA'] as num?)?.toInt(),
      stokKodu: json['STOK_KODU'] as String?,
      yapkod: json['YAPKOD'] as String?,
      opkodu: json['OPKODU'] as String?,
      kayitOperator: json['KAYIT_OPERATOR'] as String?,
      tarih: json['TARIH'] == null
          ? null
          : DateTime.parse(json['TARIH'] as String),
      sira: (json['SIRA'] as num?)?.toInt(),
      stokAdi: json['STOK_ADI'] as String?,
      seriNo: json['SERI_NO'] as String?,
      miktar: (json['MIKTAR'] as num?)?.toDouble(),
      belgeId: (json['BELGE_ID'] as num?)?.toInt(),
      tamamlandi: json['TAMAMLANDI'] as bool?,
      prosesler: (json['PROSESLER'] as List<dynamic>?)
          ?.map((e) => OlcumProsesModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$OlcumEkleModelToJson(_OlcumEkleModel instance) =>
    <String, dynamic>{
      'BELGE_NO': ?instance.belgeNo,
      'BELGE_TIPI': ?instance.belgeTipi,
      'BELGE_SIRA': ?instance.belgeSira,
      'STOK_KODU': ?instance.stokKodu,
      'YAPKOD': ?instance.yapkod,
      'OPKODU': ?instance.opkodu,
      'KAYIT_OPERATOR': ?instance.kayitOperator,
      'TARIH': ?instance.tarih?.toIso8601String(),
      'SIRA': ?instance.sira,
      'STOK_ADI': ?instance.stokAdi,
      'SERI_NO': ?instance.seriNo,
      'MIKTAR': ?instance.miktar,
      'BELGE_ID': ?instance.belgeId,
      'TAMAMLANDI': ?instance.tamamlandi,
      'PROSESLER': ?instance.prosesler?.map((e) => e.toJson()).toList(),
    };
