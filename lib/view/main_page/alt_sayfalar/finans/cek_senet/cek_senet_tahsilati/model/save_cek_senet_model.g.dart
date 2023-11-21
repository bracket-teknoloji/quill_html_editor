// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'save_cek_senet_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SaveCekSenetModelImpl _$$SaveCekSenetModelImplFromJson(
        Map<String, dynamic> json) =>
    _$SaveCekSenetModelImpl(
      belgeTipi: json['BELGE_TIPI'] as String?,
      cariAdi: json['CARI_ADI'] as String?,
      cariKodu: json['CARI_KODU'] as String?,
      guid: json['GUID'] as String?,
      islemKodu: json['ISLEM_KODU'] as int?,
      kalemler: (json['KALEMLER'] as List<dynamic>?)
          ?.map(
              (e) => CekSenetKalemlerModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      pickerTahsilatTuru: json['PickerTahsilatTuru'] as String?,
      plasiyerKodu: json['PLASIYER_KODU'] as String?,
      tag: json['TAG'] as String?,
      tarih: json['TARIH'] == null
          ? null
          : DateTime.parse(json['TARIH'] as String),
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

Map<String, dynamic> _$$SaveCekSenetModelImplToJson(
    _$SaveCekSenetModelImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('BELGE_TIPI', instance.belgeTipi);
  writeNotNull('CARI_ADI', instance.cariAdi);
  writeNotNull('CARI_KODU', instance.cariKodu);
  writeNotNull('GUID', instance.guid);
  writeNotNull('ISLEM_KODU', instance.islemKodu);
  writeNotNull('KALEMLER', instance.kalemler?.map((e) => e.toJson()).toList());
  writeNotNull('PickerTahsilatTuru', instance.pickerTahsilatTuru);
  writeNotNull('PLASIYER_KODU', instance.plasiyerKodu);
  writeNotNull('TAG', instance.tag);
  writeNotNull('TARIH', instance.tarih?.toIso8601String());
  writeNotNull('_YeniKayit', instance.yeniKayit);
  writeNotNull('PROJE_KODU', instance.projeKodu);
  writeNotNull('BELGE_NO', instance.belgeNo);
  writeNotNull('VERILEN_KODU', instance.verilenKodu);
  writeNotNull('ACIKLAMA', instance.aciklama);
  writeNotNull('CEKSEN_NO', instance.ceksenNo);
  writeNotNull('GC', instance.gc);
  writeNotNull('KASA_KODU', instance.kasaKodu);
  writeNotNull('PickerBelgeTuru', instance.pickerBelgeTuru);
  writeNotNull('REF_KOD', instance.refKod);
  writeNotNull('TAHSILATMI', instance.tahsilatmi);
  writeNotNull('TUTAR', instance.tutar);
  return val;
}

_$CekSenetKalemlerModelImpl _$$CekSenetKalemlerModelImplFromJson(
        Map<String, dynamic> json) =>
    _$CekSenetKalemlerModelImpl(
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
      sira: json['SIRA'] as int?,
      dovizTipi: json['DOVIZ_TIPI'] as int?,
      tag: json['TAG'] as String?,
      tarih: json['TARIH'] == null
          ? null
          : DateTime.parse(json['TARIH'] as String),
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

Map<String, dynamic> _$$CekSenetKalemlerModelImplToJson(
    _$CekSenetKalemlerModelImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('CARI_RAPOR_KODU', instance.cariRaporKodu);
  writeNotNull('CEK_BANKA', instance.cekBanka);
  writeNotNull('SERI_NO', instance.seriNo);
  writeNotNull('CEK_SUBE', instance.cekSube);
  writeNotNull('CIRO_TIPI', instance.ciroTipi);
  writeNotNull('GORSEL1', instance.gorsel1);
  writeNotNull('GORSEL2', instance.gorsel2);
  writeNotNull('HESAP_NO', instance.hesapNo);
  writeNotNull('ILCE', instance.ilce);
  writeNotNull('PLASIYER_ADI', instance.plasiyerAdi);
  writeNotNull('PLASIYER_KODU', instance.plasiyerKodu);
  writeNotNull('RAPOR_KODU', instance.raporKodu);
  writeNotNull('SEHIR', instance.sehir);
  writeNotNull('SIRA', instance.sira);
  writeNotNull('DOVIZ_TIPI', instance.dovizTipi);
  writeNotNull('TAG', instance.tag);
  writeNotNull('TARIH', instance.tarih?.toIso8601String());
  writeNotNull('TUTAR', instance.tutar);
  writeNotNull('VADE_TARIHI', instance.vadeTarihi?.toIso8601String());
  writeNotNull('DOVIZ_KURU', instance.dovizKuru);
  writeNotNull('DOVIZ_TUTARI', instance.dovizTutari);
  writeNotNull('ASIL_CARI', instance.asilCari);
  writeNotNull('REF_KOD', instance.refKod);
  writeNotNull('REF_TANIMI', instance.refTanimi);
  writeNotNull('ACIKLAMA1', instance.aciklama1);
  writeNotNull('ACIKLAMA2', instance.aciklama2);
  writeNotNull('ACIKLAMA3', instance.aciklama3);
  writeNotNull('PROJE_ADI', instance.projeAdi);
  writeNotNull('PROJE_KODU', instance.projeKodu);
  writeNotNull('VEREN_KODU', instance.verenKodu);
  writeNotNull('IBAN_NO', instance.ibanNo);
  writeNotNull('DUZENLENDIGI_YER', instance.duzenlendigiYer);
  return val;
}
