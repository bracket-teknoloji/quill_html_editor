// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'save_cek_senet_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SaveCekSenetModel _$SaveCekSenetModelFromJson(
  Map<String, dynamic> json,
) => _SaveCekSenetModel(
  belgeTipi: json['BELGE_TIPI'] as String?,
  cariAdi: json['CARI_ADI'] as String?,
  cariKodu: json['CARI_KODU'] as String?,
  guid: json['GUID'] as String?,
  islemKodu: (json['ISLEM_KODU'] as num?)?.toInt(),
  kalemler: (json['KALEMLER'] as List<dynamic>?)
      ?.map((e) => CekSenetKalemlerModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  pickerTahsilatTuru: json['PickerTahsilatTuru'] as String?,
  plasiyerKodu: json['PLASIYER_KODU'] as String?,
  tag: json['TAG'] as String?,
  tarih: json['TARIH'] == null ? null : DateTime.parse(json['TARIH'] as String),
  yeniKayit: json['_YeniKayit'] as bool?,
  projeKodu: json['PROJE_KODU'] as String?,
  belgeNo: json['BELGE_NO'] as String?,
  verilenKodu: json['VERILEN_KODU'] as String?,
  aciklama: json['ACIKLAMA'] as String?,
  ceksenNo: json['CEKSEN_NO'] as String?,
  gc: json['GC'] as String?,
  kasaKodu: json['KASA_KODU'] as String?,
  pickerBelgeTuru: json['PickerBelgeTuru'] as String?,
  refKod: json['REF_KOD'] as String?,
  tahsilatmi: json['TAHSILATMI'] as bool?,
  tutar: (json['TUTAR'] as num?)?.toDouble(),
);

Map<String, dynamic> _$SaveCekSenetModelToJson(_SaveCekSenetModel instance) =>
    <String, dynamic>{
      'BELGE_TIPI': ?instance.belgeTipi,
      'CARI_ADI': ?instance.cariAdi,
      'CARI_KODU': ?instance.cariKodu,
      'GUID': ?instance.guid,
      'ISLEM_KODU': ?instance.islemKodu,
      'KALEMLER': ?instance.kalemler?.map((e) => e.toJson()).toList(),
      'PickerTahsilatTuru': ?instance.pickerTahsilatTuru,
      'PLASIYER_KODU': ?instance.plasiyerKodu,
      'TAG': ?instance.tag,
      'TARIH': ?instance.tarih?.toIso8601String(),
      '_YeniKayit': ?instance.yeniKayit,
      'PROJE_KODU': ?instance.projeKodu,
      'BELGE_NO': ?instance.belgeNo,
      'VERILEN_KODU': ?instance.verilenKodu,
      'ACIKLAMA': ?instance.aciklama,
      'CEKSEN_NO': ?instance.ceksenNo,
      'GC': ?instance.gc,
      'KASA_KODU': ?instance.kasaKodu,
      'PickerBelgeTuru': ?instance.pickerBelgeTuru,
      'REF_KOD': ?instance.refKod,
      'TAHSILATMI': ?instance.tahsilatmi,
      'TUTAR': ?instance.tutar,
    };

_CekSenetKalemlerModel _$CekSenetKalemlerModelFromJson(
  Map<String, dynamic> json,
) => _CekSenetKalemlerModel(
  cariRaporKodu: json['CARI_RAPOR_KODU'] as String?,
  cekBanka: json['CEK_BANKA'] as String?,
  seriNo: json['SERI_NO'] as String?,
  cekSube: json['CEK_SUBE'] as String?,
  ciroTipi: json['CIRO_TIPI'] as String?,
  gorsel1: json['GORSEL1'] as String?,
  gorsel2: json['GORSEL2'] as String?,
  hesapNo: json['HESAP_NO'] as String?,
  ilce: json['ILCE'] as String?,
  plasiyerAdi: json['PLASIYER_ADI'] as String?,
  plasiyerKodu: json['PLASIYER_KODU'] as String?,
  raporKodu: json['RAPOR_KODU'] as String?,
  sehir: json['SEHIR'] as String?,
  sira: (json['SIRA'] as num?)?.toInt(),
  dovizTipi: (json['DOVIZ_TIPI'] as num?)?.toInt(),
  tag: json['TAG'] as String?,
  tarih: json['TARIH'] == null ? null : DateTime.parse(json['TARIH'] as String),
  tutar: (json['TUTAR'] as num?)?.toDouble(),
  vadeTarihi: json['VADE_TARIHI'] == null
      ? null
      : DateTime.parse(json['VADE_TARIHI'] as String),
  dovizKuru: (json['DOVIZ_KURU'] as num?)?.toDouble(),
  dovizTutari: (json['DOVIZ_TUTARI'] as num?)?.toDouble(),
  asilCari: json['ASIL_CARI'] as String?,
  refKod: json['REF_KOD'] as String?,
  refTanimi: json['REF_TANIMI'] as String?,
  aciklama1: json['ACIKLAMA1'] as String?,
  aciklama2: json['ACIKLAMA2'] as String?,
  aciklama3: json['ACIKLAMA3'] as String?,
  projeAdi: json['PROJE_ADI'] as String?,
  projeKodu: json['PROJE_KODU'] as String?,
  verenKodu: json['VEREN_KODU'] as String?,
  ibanNo: json['IBAN_NO'] as String?,
  duzenlendigiYer: json['DUZENLENDIGI_YER'] as String?,
);

Map<String, dynamic> _$CekSenetKalemlerModelToJson(
  _CekSenetKalemlerModel instance,
) => <String, dynamic>{
  'CARI_RAPOR_KODU': ?instance.cariRaporKodu,
  'CEK_BANKA': ?instance.cekBanka,
  'SERI_NO': ?instance.seriNo,
  'CEK_SUBE': ?instance.cekSube,
  'CIRO_TIPI': ?instance.ciroTipi,
  'GORSEL1': ?instance.gorsel1,
  'GORSEL2': ?instance.gorsel2,
  'HESAP_NO': ?instance.hesapNo,
  'ILCE': ?instance.ilce,
  'PLASIYER_ADI': ?instance.plasiyerAdi,
  'PLASIYER_KODU': ?instance.plasiyerKodu,
  'RAPOR_KODU': ?instance.raporKodu,
  'SEHIR': ?instance.sehir,
  'SIRA': ?instance.sira,
  'DOVIZ_TIPI': ?instance.dovizTipi,
  'TAG': ?instance.tag,
  'TARIH': ?instance.tarih?.toIso8601String(),
  'TUTAR': ?instance.tutar,
  'VADE_TARIHI': ?instance.vadeTarihi?.toIso8601String(),
  'DOVIZ_KURU': ?instance.dovizKuru,
  'DOVIZ_TUTARI': ?instance.dovizTutari,
  'ASIL_CARI': ?instance.asilCari,
  'REF_KOD': ?instance.refKod,
  'REF_TANIMI': ?instance.refTanimi,
  'ACIKLAMA1': ?instance.aciklama1,
  'ACIKLAMA2': ?instance.aciklama2,
  'ACIKLAMA3': ?instance.aciklama3,
  'PROJE_ADI': ?instance.projeAdi,
  'PROJE_KODU': ?instance.projeKodu,
  'VEREN_KODU': ?instance.verenKodu,
  'IBAN_NO': ?instance.ibanNo,
  'DUZENLENDIGI_YER': ?instance.duzenlendigiYer,
};
