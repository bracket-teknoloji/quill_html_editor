// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_cek_senet_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DeleteCekSenetModelImpl _$$DeleteCekSenetModelImplFromJson(Map<String, dynamic> json) => _$DeleteCekSenetModelImpl(
      belgeNo: json['BELGE_NO'] as String?,
      belgeTipi: json['BELGE_TIPI'] as String?,
      islemKodu: json['ISLEM_KODU'] as int?,
      pickerTahsilatTuru: json['PickerTahsilatTuru'] as String?,
      tag: json['TAG'] as String?,
    );

Map<String, dynamic> _$$DeleteCekSenetModelImplToJson(_$DeleteCekSenetModelImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('BELGE_NO', instance.belgeNo);
  writeNotNull('BELGE_TIPI', instance.belgeTipi);
  writeNotNull('ISLEM_KODU', instance.islemKodu);
  writeNotNull('PickerTahsilatTuru', instance.pickerTahsilatTuru);
  writeNotNull('TAG', instance.tag);
  return val;
}
