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
  if (instance.girisDepo case final value?) 'GIRIS_DEPO': value,
  if (instance.cikisDepo case final value?) 'CIKIS_DEPO': value,
  if (instance.stokKodu case final value?) 'STOK_KODU': value,
  if (instance.seriNo case final value?) 'SERI_NO': value,
  if (instance.miktar case final value?) 'MIKTAR': value,
};
