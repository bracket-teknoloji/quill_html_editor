// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'masraf_kodu_rehberi_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MasrafKoduRehberiModelImpl _$$MasrafKoduRehberiModelImplFromJson(
        Map<String, dynamic> json) =>
    _$MasrafKoduRehberiModelImpl(
      masrafKodu: json['MASRAF_KODU'] as String?,
      masrafAdi: json['MASRAF_ADI'] as String?,
    );

Map<String, dynamic> _$$MasrafKoduRehberiModelImplToJson(
    _$MasrafKoduRehberiModelImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('MASRAF_KODU', instance.masrafKodu);
  writeNotNull('MASRAF_ADI', instance.masrafAdi);
  return val;
}
