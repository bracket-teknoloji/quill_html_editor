// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pdf_viewer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PdfModel _$$_PdfModelFromJson(Map<String, dynamic> json) => _$_PdfModel(
      raporOzelKod: json['RAPOR_OZEL_KOD'] as String?,
      standart: json['STANDART'] as bool?,
      dicParams: json['DIC_PARAMS'] == null
          ? null
          : DicParams.fromJson(json['DIC_PARAMS'] as Map<String, dynamic>),
      dizaynId: json['DIZAYN_ID'] as int?,
      etiketSayisi: json['ETIKET_SAYISI'] as int?,
    );

Map<String, dynamic> _$$_PdfModelToJson(_$_PdfModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('RAPOR_OZEL_KOD', instance.raporOzelKod);
  writeNotNull('STANDART', instance.standart);
  writeNotNull('DIC_PARAMS', instance.dicParams?.toJson());
  writeNotNull('DIZAYN_ID', instance.dizaynId);
  writeNotNull('ETIKET_SAYISI', instance.etiketSayisi);
  return val;
}

_$_DicParams _$$_DicParamsFromJson(Map<String, dynamic> json) => _$_DicParams(
      cariKodu: json['CARI_KODU'] as String?,
      stokKodu: json['STOK_KODU'] as String?,
      sifirHaric: json['SIFIR_HARIC'] as String?,
      maliyetTipi: json['MALIYET_TIPI'] as String?,
      tlHarDokulsun: json['TL_HAR_DOKULSUN'] as String?,
      depoKodlari: json['DEPO_KODLARI'] as String?,
      haricStokKodlari: json['HARIC_STOK_KODLARI'] as String?,
      haricStokGrupKodlari: json['HARIC_STOK_GRUP_KODLARI'] as String?,
      dovizTipi: json['DOVIZ_TIPI'] as String?,
      bastar: json['BASTAR'] as String?,
      bittar: json['BITTAR'] as String?,
      grupKodu: json['GRUP_KODU'] as String?,
      borcAlacak: json['BORC_ALACAK'] as String?,
      refTarih: json['REF_TARIH'] as String?,
      tarihTipi: json['TARIH_TIPI'] as String?,
      kod1: json['KOD1'] as String?,
      kod2: json['KOD2'] as String?,
      kod3: json['KOD3'] as String?,
      kod4: json['KOD4'] as String?,
      kod5: json['KOD5'] as String?,
      kapali: json['KAPALI'] as String?,
      durum: json['DURUM'] as String?,
      vergiNo: json['VERGI_NO'] as String?,
      plasiyerKodu: json['PLASIYER_KODU'] as String?,
      aralikTipi: json['ARALIK_TIPI'] as String?,
      sirala: json['SIRALA'] as String?,
      bakiyeDurumu: json['BAKIYE_DURUMU'] as String?,
      caharInckey: json['CAHAR_INCKEY'] as String?,
      belgeTipi: json['BELGE_TIPI'] as String?,
      belgeNo: json['BELGE_NO'] as String?,
      isemriNo: json['ISEMRI_NO'] as String?,
      dinamikParam: json['DINAMIK_PARAM'] as String?,
      kasaharInckey: json['KASAHAR_INCKEY'] as String?,
      uretimFiyatiDahil: json['URETIM_FIYATI_DAHIL'] as String?,
      fiyatTipi: json['FIYAT_TIPI'] as String?,
      tblnfStokfiyatgecmisiId: json['TBLNF_STOKFIYATGECMISI_ID'] as String?,
      miktar: json['MIKTAR'] as int?,
    );

Map<String, dynamic> _$$_DicParamsToJson(_$_DicParams instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('CARI_KODU', instance.cariKodu);
  writeNotNull('STOK_KODU', instance.stokKodu);
  writeNotNull('SIFIR_HARIC', instance.sifirHaric);
  writeNotNull('MALIYET_TIPI', instance.maliyetTipi);
  writeNotNull('TL_HAR_DOKULSUN', instance.tlHarDokulsun);
  writeNotNull('DEPO_KODLARI', instance.depoKodlari);
  writeNotNull('HARIC_STOK_KODLARI', instance.haricStokKodlari);
  writeNotNull('HARIC_STOK_GRUP_KODLARI', instance.haricStokGrupKodlari);
  writeNotNull('DOVIZ_TIPI', instance.dovizTipi);
  writeNotNull('BASTAR', instance.bastar);
  writeNotNull('BITTAR', instance.bittar);
  writeNotNull('GRUP_KODU', instance.grupKodu);
  writeNotNull('BORC_ALACAK', instance.borcAlacak);
  writeNotNull('REF_TARIH', instance.refTarih);
  writeNotNull('TARIH_TIPI', instance.tarihTipi);
  writeNotNull('KOD1', instance.kod1);
  writeNotNull('KOD2', instance.kod2);
  writeNotNull('KOD3', instance.kod3);
  writeNotNull('KOD4', instance.kod4);
  writeNotNull('KOD5', instance.kod5);
  writeNotNull('KAPALI', instance.kapali);
  writeNotNull('DURUM', instance.durum);
  writeNotNull('VERGI_NO', instance.vergiNo);
  writeNotNull('PLASIYER_KODU', instance.plasiyerKodu);
  writeNotNull('ARALIK_TIPI', instance.aralikTipi);
  writeNotNull('SIRALA', instance.sirala);
  writeNotNull('BAKIYE_DURUMU', instance.bakiyeDurumu);
  writeNotNull('CAHAR_INCKEY', instance.caharInckey);
  writeNotNull('BELGE_TIPI', instance.belgeTipi);
  writeNotNull('BELGE_NO', instance.belgeNo);
  writeNotNull('ISEMRI_NO', instance.isemriNo);
  writeNotNull('DINAMIK_PARAM', instance.dinamikParam);
  writeNotNull('KASAHAR_INCKEY', instance.kasaharInckey);
  writeNotNull('URETIM_FIYATI_DAHIL', instance.uretimFiyatiDahil);
  writeNotNull('FIYAT_TIPI', instance.fiyatTipi);
  writeNotNull('TBLNF_STOKFIYATGECMISI_ID', instance.tblnfStokfiyatgecmisiId);
  writeNotNull('MIKTAR', instance.miktar);
  return val;
}
