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
  'BELGE_NO': ?instance.belgeNo,
  'BELGE_TIPI': ?instance.belgeTipi,
  'ISLEM_KODU': ?instance.islemKodu,
  'PickerTahsilatTuru': ?instance.pickerTahsilatTuru,
  'TAG': ?instance.tag,
};
