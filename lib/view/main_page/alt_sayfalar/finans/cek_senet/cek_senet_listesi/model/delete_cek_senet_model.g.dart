// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_cek_senet_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DeleteCekSenetModel _$DeleteCekSenetModelFromJson(Map<String, dynamic> json) =>
    _DeleteCekSenetModel(
      belgeNo: json['BELGE_NO'] as String?,
      belgeTipi: json['BELGE_TIPI'] as String?,
      islemKodu: (json['ISLEM_KODU'] as num?)?.toInt(),
      pickerTahsilatTuru: json['PickerTahsilatTuru'] as String?,
      tag: json['TAG'] as String?,
    );

Map<String, dynamic> _$DeleteCekSenetModelToJson(
  _DeleteCekSenetModel instance,
) => <String, dynamic>{
  if (instance.belgeNo case final value?) 'BELGE_NO': value,
  if (instance.belgeTipi case final value?) 'BELGE_TIPI': value,
  if (instance.islemKodu case final value?) 'ISLEM_KODU': value,
  if (instance.pickerTahsilatTuru case final value?)
    'PickerTahsilatTuru': value,
  if (instance.tag case final value?) 'TAG': value,
};
