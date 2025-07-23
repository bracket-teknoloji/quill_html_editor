// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hizli_tahsilat_kayitlari_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_HizliTahsilatKayitlariRequestModel
_$HizliTahsilatKayitlariRequestModelFromJson(Map<String, dynamic> json) =>
    _HizliTahsilatKayitlariRequestModel(
      baslamaTarihi: json['BaslamaTarihi'] as String?,
      bitisTarihi: json['BitisTarihi'] as String?,
      ekranTipi: json['EkranTipi'] as String?,
      sayfa: (json['Sayfa'] as num?)?.toInt() ?? 1,
    );

Map<String, dynamic> _$HizliTahsilatKayitlariRequestModelToJson(
  _HizliTahsilatKayitlariRequestModel instance,
) => <String, dynamic>{
  if (instance.baslamaTarihi case final value?) 'BaslamaTarihi': value,
  if (instance.bitisTarihi case final value?) 'BitisTarihi': value,
  if (instance.ekranTipi case final value?) 'EkranTipi': value,
  if (instance.sayfa case final value?) 'Sayfa': value,
};
