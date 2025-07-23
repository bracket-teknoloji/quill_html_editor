// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kasa_listesi_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_KasaListesiModel _$KasaListesiModelFromJson(Map<String, dynamic> json) =>
    _KasaListesiModel(
      kasaKodu: json['KASA_KODU'] as String?,
      kasaTanimi: json['KASA_TANIMI'] as String?,
      subeKodu: (json['SUBE_KODU'] as num?)?.toInt(),
      dovizli: json['DOVIZLI'] as String?,
      dovizTipi: (json['DOVIZ_TIPI'] as num?)?.toInt(),
      kkartKasasi: json['KKART_KASASI'] as bool?,
      toplamGiris: (json['TOPLAM_GIRIS'] as num?)?.toDouble(),
      toplamCikis: (json['TOPLAM_CIKIS'] as num?)?.toDouble(),
      bakiye: (json['BAKIYE'] as num?)?.toDouble(),
      devirliBakiye: (json['DEVIRLI_BAKIYE'] as num?)?.toDouble(),
      devirTutari: (json['DEVIR_TUTARI'] as num?)?.toDouble(),
      dovizToplamGiris: (json['DOVIZ_TOPLAM_GIRIS'] as num?)?.toDouble(),
      dovizToplamCikis: (json['DOVIZ_TOPLAM_CIKIS'] as num?)?.toDouble(),
      dovizBakiye: (json['DOVIZ_BAKIYE'] as num?)?.toDouble(),
      devirliDovizBakiye: (json['DEVIRLI_DOVIZ_BAKIYE'] as num?)?.toDouble(),
      dovizDevirTutari: (json['DOVIZ_DEVIR_TUTARI'] as num?)?.toDouble(),
      dovizAdi: json['DOVIZ_ADI'] as String?,
    );

Map<String, dynamic> _$KasaListesiModelToJson(
  _KasaListesiModel instance,
) => <String, dynamic>{
  if (instance.kasaKodu case final value?) 'KASA_KODU': value,
  if (instance.kasaTanimi case final value?) 'KASA_TANIMI': value,
  if (instance.subeKodu case final value?) 'SUBE_KODU': value,
  if (instance.dovizli case final value?) 'DOVIZLI': value,
  if (instance.dovizTipi case final value?) 'DOVIZ_TIPI': value,
  if (instance.kkartKasasi case final value?) 'KKART_KASASI': value,
  if (instance.toplamGiris case final value?) 'TOPLAM_GIRIS': value,
  if (instance.toplamCikis case final value?) 'TOPLAM_CIKIS': value,
  if (instance.bakiye case final value?) 'BAKIYE': value,
  if (instance.devirliBakiye case final value?) 'DEVIRLI_BAKIYE': value,
  if (instance.devirTutari case final value?) 'DEVIR_TUTARI': value,
  if (instance.dovizToplamGiris case final value?) 'DOVIZ_TOPLAM_GIRIS': value,
  if (instance.dovizToplamCikis case final value?) 'DOVIZ_TOPLAM_CIKIS': value,
  if (instance.dovizBakiye case final value?) 'DOVIZ_BAKIYE': value,
  if (instance.devirliDovizBakiye case final value?)
    'DEVIRLI_DOVIZ_BAKIYE': value,
  if (instance.dovizDevirTutari case final value?) 'DOVIZ_DEVIR_TUTARI': value,
  if (instance.dovizAdi case final value?) 'DOVIZ_ADI': value,
};
