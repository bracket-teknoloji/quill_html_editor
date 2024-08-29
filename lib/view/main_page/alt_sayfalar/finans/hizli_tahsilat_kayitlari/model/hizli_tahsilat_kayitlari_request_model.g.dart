// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hizli_tahsilat_kayitlari_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HizliTahsilatKayitlariRequestModelImpl
    _$$HizliTahsilatKayitlariRequestModelImplFromJson(
            Map<String, dynamic> json) =>
        _$HizliTahsilatKayitlariRequestModelImpl(
          baslamaTarihi: json['BaslamaTarihi'] as String?,
          bitisTarihi: json['BitisTarihi'] as String?,
          ekranTipi: json['EkranTipi'] as String?,
          sayfa: (json['Sayfa'] as num?)?.toInt() ?? 1,
        );

Map<String, dynamic> _$$HizliTahsilatKayitlariRequestModelImplToJson(
    _$HizliTahsilatKayitlariRequestModelImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('BaslamaTarihi', instance.baslamaTarihi);
  writeNotNull('BitisTarihi', instance.bitisTarihi);
  writeNotNull('EkranTipi', instance.ekranTipi);
  writeNotNull('Sayfa', instance.sayfa);
  return val;
}
