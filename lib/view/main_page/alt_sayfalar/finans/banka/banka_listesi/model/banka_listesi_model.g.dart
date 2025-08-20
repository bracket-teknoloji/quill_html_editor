// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banka_listesi_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BankaListesiModel _$BankaListesiModelFromJson(Map<String, dynamic> json) =>
    _BankaListesiModel(
      bankaKodu: json['BANKA_KODU'] as String?,
      bankasubeKodu: json['BANKASUBE_KODU'] as String?,
      hesapKodu: json['HESAP_KODU'] as String?,
      hesapAdi: json['HESAP_ADI'] as String?,
      muhasebeHesapTipi: json['MUHASEBE_HESAP_TIPI'] as String?,
      hesapNo: json['HESAP_NO'] as String?,
      ibanNo: json['IBAN_NO'] as String?,
      kilit: json['KILIT'] as String?,
      hesapTipi: (json['HESAP_TIPI'] as num?)?.toInt(),
      hesapTipiAdi: json['HESAP_TIPI_ADI'] as String?,
      dovizTipi: (json['DOVIZ_TIPI'] as num?)?.toInt(),
      borcToplami: (json['BORC_TOPLAMI'] as num?)?.toDouble(),
      alacakToplami: (json['ALACAK_TOPLAMI'] as num?)?.toDouble(),
      dovizborcToplami: (json['DOVIZBORC_TOPLAMI'] as num?)?.toDouble(),
      dovizalacakToplami: (json['DOVIZALACAK_TOPLAMI'] as num?)?.toDouble(),
      dovizAdi: json['DOVIZ_ADI'] as String?,
      bankaAdi: json['BANKA_ADI'] as String?,
      subeAdi: json['SUBE_ADI'] as String?,
      baglihesapKodu: json['BAGLIHESAP_KODU'] as String?,
    );

Map<String, dynamic> _$BankaListesiModelToJson(_BankaListesiModel instance) =>
    <String, dynamic>{
      'BANKA_KODU': ?instance.bankaKodu,
      'BANKASUBE_KODU': ?instance.bankasubeKodu,
      'HESAP_KODU': ?instance.hesapKodu,
      'HESAP_ADI': ?instance.hesapAdi,
      'MUHASEBE_HESAP_TIPI': ?instance.muhasebeHesapTipi,
      'HESAP_NO': ?instance.hesapNo,
      'IBAN_NO': ?instance.ibanNo,
      'KILIT': ?instance.kilit,
      'HESAP_TIPI': ?instance.hesapTipi,
      'HESAP_TIPI_ADI': ?instance.hesapTipiAdi,
      'DOVIZ_TIPI': ?instance.dovizTipi,
      'BORC_TOPLAMI': ?instance.borcToplami,
      'ALACAK_TOPLAMI': ?instance.alacakToplami,
      'DOVIZBORC_TOPLAMI': ?instance.dovizborcToplami,
      'DOVIZALACAK_TOPLAMI': ?instance.dovizalacakToplami,
      'DOVIZ_ADI': ?instance.dovizAdi,
      'BANKA_ADI': ?instance.bankaAdi,
      'SUBE_ADI': ?instance.subeAdi,
      'BAGLIHESAP_KODU': ?instance.baglihesapKodu,
    };
