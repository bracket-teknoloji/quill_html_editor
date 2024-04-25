// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kasa_listesi_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$KasaListesiModelImpl _$$KasaListesiModelImplFromJson(
        Map<String, dynamic> json) =>
    _$KasaListesiModelImpl(
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

Map<String, dynamic> _$$KasaListesiModelImplToJson(
    _$KasaListesiModelImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('KASA_KODU', instance.kasaKodu);
  writeNotNull('KASA_TANIMI', instance.kasaTanimi);
  writeNotNull('SUBE_KODU', instance.subeKodu);
  writeNotNull('DOVIZLI', instance.dovizli);
  writeNotNull('DOVIZ_TIPI', instance.dovizTipi);
  writeNotNull('KKART_KASASI', instance.kkartKasasi);
  writeNotNull('TOPLAM_GIRIS', instance.toplamGiris);
  writeNotNull('TOPLAM_CIKIS', instance.toplamCikis);
  writeNotNull('BAKIYE', instance.bakiye);
  writeNotNull('DEVIRLI_BAKIYE', instance.devirliBakiye);
  writeNotNull('DEVIR_TUTARI', instance.devirTutari);
  writeNotNull('DOVIZ_TOPLAM_GIRIS', instance.dovizToplamGiris);
  writeNotNull('DOVIZ_TOPLAM_CIKIS', instance.dovizToplamCikis);
  writeNotNull('DOVIZ_BAKIYE', instance.dovizBakiye);
  writeNotNull('DEVIRLI_DOVIZ_BAKIYE', instance.devirliDovizBakiye);
  writeNotNull('DOVIZ_DEVIR_TUTARI', instance.dovizDevirTutari);
  writeNotNull('DOVIZ_ADI', instance.dovizAdi);
  return val;
}
