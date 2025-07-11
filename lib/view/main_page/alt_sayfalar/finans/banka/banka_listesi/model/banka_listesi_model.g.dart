// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banka_listesi_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BankaListesiModel _$BankaListesiModelFromJson(Map<String, dynamic> json) => _BankaListesiModel(
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

Map<String, dynamic> _$BankaListesiModelToJson(
  _BankaListesiModel instance,
) => <String, dynamic>{
  if (instance.bankaKodu case final value?) 'BANKA_KODU': value,
  if (instance.bankasubeKodu case final value?) 'BANKASUBE_KODU': value,
  if (instance.hesapKodu case final value?) 'HESAP_KODU': value,
  if (instance.hesapAdi case final value?) 'HESAP_ADI': value,
  if (instance.muhasebeHesapTipi case final value?) 'MUHASEBE_HESAP_TIPI': value,
  if (instance.hesapNo case final value?) 'HESAP_NO': value,
  if (instance.ibanNo case final value?) 'IBAN_NO': value,
  if (instance.kilit case final value?) 'KILIT': value,
  if (instance.hesapTipi case final value?) 'HESAP_TIPI': value,
  if (instance.hesapTipiAdi case final value?) 'HESAP_TIPI_ADI': value,
  if (instance.dovizTipi case final value?) 'DOVIZ_TIPI': value,
  if (instance.borcToplami case final value?) 'BORC_TOPLAMI': value,
  if (instance.alacakToplami case final value?) 'ALACAK_TOPLAMI': value,
  if (instance.dovizborcToplami case final value?) 'DOVIZBORC_TOPLAMI': value,
  if (instance.dovizalacakToplami case final value?) 'DOVIZALACAK_TOPLAMI': value,
  if (instance.dovizAdi case final value?) 'DOVIZ_ADI': value,
  if (instance.bankaAdi case final value?) 'BANKA_ADI': value,
  if (instance.subeAdi case final value?) 'SUBE_ADI': value,
  if (instance.baglihesapKodu case final value?) 'BAGLIHESAP_KODU': value,
};
