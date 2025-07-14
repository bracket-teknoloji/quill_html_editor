// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'olcum_ekle_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OlcumEkleModel _$OlcumEkleModelFromJson(Map<String, dynamic> json) => _OlcumEkleModel(
  belgeNo: json['BELGE_NO'] as String?,
  belgeTipi: json['BELGE_TIPI'] as String?,
  belgeSira: (json['BELGE_SIRA'] as num?)?.toInt(),
  stokKodu: json['STOK_KODU'] as String?,
  yapkod: json['YAPKOD'] as String?,
  opkodu: json['OPKODU'] as String?,
  kayitOperator: json['KAYIT_OPERATOR'] as String?,
  tarih: json['TARIH'] == null ? null : DateTime.parse(json['TARIH'] as String),
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

Map<String, dynamic> _$OlcumEkleModelToJson(_OlcumEkleModel instance) => <String, dynamic>{
  if (instance.belgeNo case final value?) 'BELGE_NO': value,
  if (instance.belgeTipi case final value?) 'BELGE_TIPI': value,
  if (instance.belgeSira case final value?) 'BELGE_SIRA': value,
  if (instance.stokKodu case final value?) 'STOK_KODU': value,
  if (instance.yapkod case final value?) 'YAPKOD': value,
  if (instance.opkodu case final value?) 'OPKODU': value,
  if (instance.kayitOperator case final value?) 'KAYIT_OPERATOR': value,
  if (instance.tarih?.toIso8601String() case final value?) 'TARIH': value,
  if (instance.sira case final value?) 'SIRA': value,
  if (instance.stokAdi case final value?) 'STOK_ADI': value,
  if (instance.seriNo case final value?) 'SERI_NO': value,
  if (instance.miktar case final value?) 'MIKTAR': value,
  if (instance.belgeId case final value?) 'BELGE_ID': value,
  if (instance.tamamlandi case final value?) 'TAMAMLANDI': value,
  if (instance.prosesler?.map((e) => e.toJson()).toList() case final value?) 'PROSESLER': value,
};
