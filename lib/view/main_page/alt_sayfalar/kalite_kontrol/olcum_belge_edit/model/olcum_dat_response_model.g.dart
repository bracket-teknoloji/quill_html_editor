// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'olcum_dat_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OlcumDatResponseModelImpl _$$OlcumDatResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$OlcumDatResponseModelImpl(
      girisDepo: json['GIRIS_DEPO'] as String?,
      cikisDepo: json['CIKIS_DEPO'] as String?,
      stokKodu: json['STOK_KODU'] as String?,
      seriNo: json['SERI_NO'] as String?,
      miktar: (json['MIKTAR'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$OlcumDatResponseModelImplToJson(
    _$OlcumDatResponseModelImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('GIRIS_DEPO', instance.girisDepo);
  writeNotNull('CIKIS_DEPO', instance.cikisDepo);
  writeNotNull('STOK_KODU', instance.stokKodu);
  writeNotNull('SERI_NO', instance.seriNo);
  writeNotNull('MIKTAR', instance.miktar);
  return val;
}
