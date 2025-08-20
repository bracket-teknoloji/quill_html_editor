// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'olcum_dat_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OlcumDatResponseModel _$OlcumDatResponseModelFromJson(
  Map<String, dynamic> json,
) => _OlcumDatResponseModel(
  girisDepo: json['GIRIS_DEPO'] as String?,
  cikisDepo: json['CIKIS_DEPO'] as String?,
  stokKodu: json['STOK_KODU'] as String?,
  seriNo: json['SERI_NO'] as String?,
  miktar: (json['MIKTAR'] as num?)?.toDouble(),
);

Map<String, dynamic> _$OlcumDatResponseModelToJson(
  _OlcumDatResponseModel instance,
) => <String, dynamic>{
  'GIRIS_DEPO': ?instance.girisDepo,
  'CIKIS_DEPO': ?instance.cikisDepo,
  'STOK_KODU': ?instance.stokKodu,
  'SERI_NO': ?instance.seriNo,
  'MIKTAR': ?instance.miktar,
};
