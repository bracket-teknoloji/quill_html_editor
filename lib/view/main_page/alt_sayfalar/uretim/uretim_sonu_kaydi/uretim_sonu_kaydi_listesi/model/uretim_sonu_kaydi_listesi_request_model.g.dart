// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'uretim_sonu_kaydi_listesi_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UretimSonuKaydiListesiRequestModel
_$UretimSonuKaydiListesiRequestModelFromJson(Map<String, dynamic> json) =>
    _UretimSonuKaydiListesiRequestModel(
      sayfa: (json['Sayfa'] as num?)?.toInt(),
      ekranTipi: json['EkranTipi'] as String?,
      belgeNo: json['BelgeNo'] as String?,
      searchText: json['SearchText'] as String?,
    );

Map<String, dynamic> _$UretimSonuKaydiListesiRequestModelToJson(
  _UretimSonuKaydiListesiRequestModel instance,
) => <String, dynamic>{
  if (instance.sayfa case final value?) 'Sayfa': value,
  if (instance.ekranTipi case final value?) 'EkranTipi': value,
  if (instance.belgeNo case final value?) 'BelgeNo': value,
  if (instance.searchText case final value?) 'SearchText': value,
};
