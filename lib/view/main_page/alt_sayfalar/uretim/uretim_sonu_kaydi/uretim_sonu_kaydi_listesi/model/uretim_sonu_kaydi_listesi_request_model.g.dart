// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'uretim_sonu_kaydi_listesi_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UretimSonuKaydiListesiRequestModelImpl
    _$$UretimSonuKaydiListesiRequestModelImplFromJson(
            Map<String, dynamic> json) =>
        _$UretimSonuKaydiListesiRequestModelImpl(
          sayfa: (json['Sayfa'] as num?)?.toInt(),
          ekranTipi: json['EkranTipi'] as String?,
          belgeNo: json['BelgeNo'] as String?,
          searchText: json['SearchText'] as String?,
        );

Map<String, dynamic> _$$UretimSonuKaydiListesiRequestModelImplToJson(
    _$UretimSonuKaydiListesiRequestModelImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Sayfa', instance.sayfa);
  writeNotNull('EkranTipi', instance.ekranTipi);
  writeNotNull('BelgeNo', instance.belgeNo);
  writeNotNull('SearchText', instance.searchText);
  return val;
}
