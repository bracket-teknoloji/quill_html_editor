// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'uretim_sonu_kaydi_listesi_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UretimSonuKaydiListesiRequestModelImpl _$$UretimSonuKaydiListesiRequestModelImplFromJson(Map<String, dynamic> json) =>
    _$UretimSonuKaydiListesiRequestModelImpl(
      sayfa: (json['Sayfa'] as num?)?.toInt(),
      ekranTipi: json['EkranTipi'] as String?,
      belgeNo: json['BelgeNo'] as String?,
      searchText: json['SearchText'] as String?,
    );

Map<String, dynamic> _$$UretimSonuKaydiListesiRequestModelImplToJson(
  _$UretimSonuKaydiListesiRequestModelImpl instance,
) => <String, dynamic>{
  if (instance.sayfa case final value?) 'Sayfa': value,
  if (instance.ekranTipi case final value?) 'EkranTipi': value,
  if (instance.belgeNo case final value?) 'BelgeNo': value,
  if (instance.searchText case final value?) 'SearchText': value,
};
