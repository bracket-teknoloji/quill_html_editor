// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banka_hesaplari_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BankaHesaplariModelImpl _$$BankaHesaplariModelImplFromJson(Map<String, dynamic> json) => _$BankaHesaplariModelImpl(
      bankaKodu: json['BANKA_KODU'] as String?,
      bankasubeKodu: json['BANKASUBE_KODU'] as String?,
      hesapKodu: json['HESAP_KODU'] as String?,
      hesapAdi: json['HESAP_ADI'] as String?,
      kilit: json['KILIT'] as String?,
      hesapTipi: json['HESAP_TIPI'] as int?,
      hesapTipiAdi: json['HESAP_TIPI_ADI'] as String?,
      dovizTipi: json['DOVIZ_TIPI'] as int?,
      borcToplami: (json['BORC_TOPLAMI'] as num?)?.toDouble(),
      alacakToplami: (json['ALACAK_TOPLAMI'] as num?)?.toDouble(),
      dovizborcToplami: (json['DOVIZBORC_TOPLAMI'] as num?)?.toDouble(),
      dovizalacakToplami: (json['DOVIZALACAK_TOPLAMI'] as num?)?.toDouble(),
      bankaAdi: json['BANKA_ADI'] as String?,
      subeAdi: json['SUBE_ADI'] as String?,
      baglihesapKodu: json['BAGLIHESAP_KODU'] as String?,
      muhasebeHesapTipi: json['MUHASEBE_HESAP_TIPI'] as String?,
      dovizAdi: json['DOVIZ_ADI'] as String?,
      hesapNo: json['HESAP_NO'] as String?,
    );

Map<String, dynamic> _$$BankaHesaplariModelImplToJson(_$BankaHesaplariModelImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('BANKA_KODU', instance.bankaKodu);
  writeNotNull('BANKASUBE_KODU', instance.bankasubeKodu);
  writeNotNull('HESAP_KODU', instance.hesapKodu);
  writeNotNull('HESAP_ADI', instance.hesapAdi);
  writeNotNull('KILIT', instance.kilit);
  writeNotNull('HESAP_TIPI', instance.hesapTipi);
  writeNotNull('HESAP_TIPI_ADI', instance.hesapTipiAdi);
  writeNotNull('DOVIZ_TIPI', instance.dovizTipi);
  writeNotNull('BORC_TOPLAMI', instance.borcToplami);
  writeNotNull('ALACAK_TOPLAMI', instance.alacakToplami);
  writeNotNull('DOVIZBORC_TOPLAMI', instance.dovizborcToplami);
  writeNotNull('DOVIZALACAK_TOPLAMI', instance.dovizalacakToplami);
  writeNotNull('BANKA_ADI', instance.bankaAdi);
  writeNotNull('SUBE_ADI', instance.subeAdi);
  writeNotNull('BAGLIHESAP_KODU', instance.baglihesapKodu);
  writeNotNull('MUHASEBE_HESAP_TIPI', instance.muhasebeHesapTipi);
  writeNotNull('DOVIZ_ADI', instance.dovizAdi);
  writeNotNull('HESAP_NO', instance.hesapNo);
  return val;
}
