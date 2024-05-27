// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paketleme_listesi_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PaketlemeListesiRequestModelImpl _$$PaketlemeListesiRequestModelImplFromJson(
        Map<String, dynamic> json) =>
    _$PaketlemeListesiRequestModelImpl(
      id: (json['ID'] as num?)?.toInt(),
      stokKodu: json['StokKodu'] as String?,
      belgeNo: json['BelgeNo'] as String?,
      menuKodu: json['MenuKodu'] as String?,
      depoKodu: json['DepoKodu'] as String?,
      paketKodu: json['PaketKodu'] as String?,
      islemKodu: (json['IslemKodu'] as num?)?.toInt(),
      kisitYok: json['KisitYok'] as bool?,
      ekranTipi: json['EkranTipi'] as String?,
      paketId: (json['PaketID'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$PaketlemeListesiRequestModelImplToJson(
    _$PaketlemeListesiRequestModelImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ID', instance.id);
  writeNotNull('StokKodu', instance.stokKodu);
  writeNotNull('BelgeNo', instance.belgeNo);
  writeNotNull('MenuKodu', instance.menuKodu);
  writeNotNull('DepoKodu', instance.depoKodu);
  writeNotNull('PaketKodu', instance.paketKodu);
  writeNotNull('IslemKodu', instance.islemKodu);
  writeNotNull('KisitYok', instance.kisitYok);
  writeNotNull('EkranTipi', instance.ekranTipi);
  writeNotNull('PaketID', instance.paketId);
  return val;
}
