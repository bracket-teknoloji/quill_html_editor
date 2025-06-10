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
      if (instance.belgeTipi case final value?) 'BELGE_TIPI': value,
      if (instance.cariAdi case final value?) 'CARI_ADI': value,
      if (instance.cariKodu case final value?) 'CARI_KODU': value,
      if (instance.guid case final value?) 'GUID': value,
      if (instance.islemKodu case final value?) 'ISLEM_KODU': value,
      if (instance.kalemler?.map((e) => e.toJson()).toList() case final value?)
        'KALEMLER': value,
      if (instance.pickerTahsilatTuru case final value?)
        'PickerTahsilatTuru': value,
      if (instance.plasiyerKodu case final value?) 'PLASIYER_KODU': value,
      if (instance.tag case final value?) 'TAG': value,
      if (instance.tarih?.toIso8601String() case final value?) 'TARIH': value,
      if (instance.yeniKayit case final value?) '_YeniKayit': value,
      if (instance.projeKodu case final value?) 'PROJE_KODU': value,
      if (instance.belgeNo case final value?) 'BELGE_NO': value,
      if (instance.verilenKodu case final value?) 'VERILEN_KODU': value,
      if (instance.aciklama case final value?) 'ACIKLAMA': value,
      if (instance.ceksenNo case final value?) 'CEKSEN_NO': value,
      if (instance.gc case final value?) 'GC': value,
      if (instance.kasaKodu case final value?) 'KASA_KODU': value,
      if (instance.pickerBelgeTuru case final value?) 'PickerBelgeTuru': value,
      if (instance.refKod case final value?) 'REF_KOD': value,
      if (instance.tahsilatmi case final value?) 'TAHSILATMI': value,
      if (instance.tutar case final value?) 'TUTAR': value,
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
  if (instance.cariRaporKodu case final value?) 'CARI_RAPOR_KODU': value,
  if (instance.cekBanka case final value?) 'CEK_BANKA': value,
  if (instance.seriNo case final value?) 'SERI_NO': value,
  if (instance.cekSube case final value?) 'CEK_SUBE': value,
  if (instance.ciroTipi case final value?) 'CIRO_TIPI': value,
  if (instance.gorsel1 case final value?) 'GORSEL1': value,
  if (instance.gorsel2 case final value?) 'GORSEL2': value,
  if (instance.hesapNo case final value?) 'HESAP_NO': value,
  if (instance.ilce case final value?) 'ILCE': value,
  if (instance.plasiyerAdi case final value?) 'PLASIYER_ADI': value,
  if (instance.plasiyerKodu case final value?) 'PLASIYER_KODU': value,
  if (instance.raporKodu case final value?) 'RAPOR_KODU': value,
  if (instance.sehir case final value?) 'SEHIR': value,
  if (instance.sira case final value?) 'SIRA': value,
  if (instance.dovizTipi case final value?) 'DOVIZ_TIPI': value,
  if (instance.tag case final value?) 'TAG': value,
  if (instance.tarih?.toIso8601String() case final value?) 'TARIH': value,
  if (instance.tutar case final value?) 'TUTAR': value,
  if (instance.vadeTarihi?.toIso8601String() case final value?)
    'VADE_TARIHI': value,
  if (instance.dovizKuru case final value?) 'DOVIZ_KURU': value,
  if (instance.dovizTutari case final value?) 'DOVIZ_TUTARI': value,
  if (instance.asilCari case final value?) 'ASIL_CARI': value,
  if (instance.refKod case final value?) 'REF_KOD': value,
  if (instance.refTanimi case final value?) 'REF_TANIMI': value,
  if (instance.aciklama1 case final value?) 'ACIKLAMA1': value,
  if (instance.aciklama2 case final value?) 'ACIKLAMA2': value,
  if (instance.aciklama3 case final value?) 'ACIKLAMA3': value,
  if (instance.projeAdi case final value?) 'PROJE_ADI': value,
  if (instance.projeKodu case final value?) 'PROJE_KODU': value,
  if (instance.verenKodu case final value?) 'VEREN_KODU': value,
  if (instance.ibanNo case final value?) 'IBAN_NO': value,
  if (instance.duzenlendigiYer case final value?) 'DUZENLENDIGI_YER': value,
};
