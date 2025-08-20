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

Map<String, dynamic> _$KasaListesiModelToJson(_KasaListesiModel instance) =>
    <String, dynamic>{
      'KASA_KODU': ?instance.kasaKodu,
      'KASA_TANIMI': ?instance.kasaTanimi,
      'SUBE_KODU': ?instance.subeKodu,
      'DOVIZLI': ?instance.dovizli,
      'DOVIZ_TIPI': ?instance.dovizTipi,
      'KKART_KASASI': ?instance.kkartKasasi,
      'TOPLAM_GIRIS': ?instance.toplamGiris,
      'TOPLAM_CIKIS': ?instance.toplamCikis,
      'BAKIYE': ?instance.bakiye,
      'DEVIRLI_BAKIYE': ?instance.devirliBakiye,
      'DEVIR_TUTARI': ?instance.devirTutari,
      'DOVIZ_TOPLAM_GIRIS': ?instance.dovizToplamGiris,
      'DOVIZ_TOPLAM_CIKIS': ?instance.dovizToplamCikis,
      'DOVIZ_BAKIYE': ?instance.dovizBakiye,
      'DEVIRLI_DOVIZ_BAKIYE': ?instance.devirliDovizBakiye,
      'DOVIZ_DEVIR_TUTARI': ?instance.dovizDevirTutari,
      'DOVIZ_ADI': ?instance.dovizAdi,
    };
