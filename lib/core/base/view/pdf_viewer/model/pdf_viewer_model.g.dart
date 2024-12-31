// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pdf_viewer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PdfModelImpl _$$PdfModelImplFromJson(Map<String, dynamic> json) =>
    _$PdfModelImpl(
      raporOzelKod: json['RAPOR_OZEL_KOD'] as String?,
      standart: json['STANDART'] as bool?,
      dicParams: json['DIC_PARAMS'] == null
          ? null
          : DicParams.fromJson(json['DIC_PARAMS'] as Map<String, dynamic>),
      dicParamsMap: json['DicParams'] as Map<String, dynamic>?,
      dizaynId: (json['DIZAYN_ID'] as num?)?.toInt(),
      etiketSayisi: (json['ETIKET_SAYISI'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$PdfModelImplToJson(_$PdfModelImpl instance) =>
    <String, dynamic>{
      if (instance.raporOzelKod case final value?) 'RAPOR_OZEL_KOD': value,
      if (instance.standart case final value?) 'STANDART': value,
      if (instance.dicParams?.toJson() case final value?) 'DIC_PARAMS': value,
      if (instance.dizaynId case final value?) 'DIZAYN_ID': value,
      if (instance.etiketSayisi case final value?) 'ETIKET_SAYISI': value,
    };

_$DicParamsImpl _$$DicParamsImplFromJson(Map<String, dynamic> json) =>
    _$DicParamsImpl(
      belgeNo: json['BELGE_NO'] as String,
      cariKodu: json['CARI_KODU'] as String?,
      teslimCariKodu: json['TESLIM_CARI_KODU'] as String?,
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
      isemriNo: json['ISEMRI_NO'] as String?,
      dinamikParam: json['DINAMIK_PARAM'] as String?,
      kasaharInckey: json['KASAHAR_INCKEY'] as String?,
      uretimFiyatiDahil: json['URETIM_FIYATI_DAHIL'] as String?,
      fiyatTipi: json['FIYAT_TIPI'] as String?,
      tblnfStokfiyatgecmisiId: json['TBLNF_STOKFIYATGECMISI_ID'] as String?,
      gorunecekAlanlar: json['GORUNECEK_ALANLAR'] as String?,
      miktar: (json['MIKTAR'] as num?)?.toInt(),
      yapkod: json['YAPKOD'] as String?,
      opkodu: json['OPKODU'] as String?,
      kasaKodu: json['KASA_KODU'] as String?,
      muhasebeKodu: json['MUHASEBE_KODU'] as String?,
      filtre: json['FILTRE'] as String?,
      depoKodu: json['DEPO_KODU'] as String?,
      hucreKodu: json['HUCRE_KODU'] as String?,
      kalemId: json['KALEM_ID'] as String?,
      tempBelgeId: json['TEMP_BELGE_ID'] as String?,
    );

Map<String, dynamic> _$$DicParamsImplToJson(_$DicParamsImpl instance) =>
    <String, dynamic>{
      'BELGE_NO': instance.belgeNo,
      if (instance.cariKodu case final value?) 'CARI_KODU': value,
      if (instance.teslimCariKodu case final value?) 'TESLIM_CARI_KODU': value,
      if (instance.stokKodu case final value?) 'STOK_KODU': value,
      if (instance.sifirHaric case final value?) 'SIFIR_HARIC': value,
      if (instance.maliyetTipi case final value?) 'MALIYET_TIPI': value,
      if (instance.tlHarDokulsun case final value?) 'TL_HAR_DOKULSUN': value,
      if (instance.depoKodlari case final value?) 'DEPO_KODLARI': value,
      if (instance.haricStokKodlari case final value?)
        'HARIC_STOK_KODLARI': value,
      if (instance.haricStokGrupKodlari case final value?)
        'HARIC_STOK_GRUP_KODLARI': value,
      if (instance.dovizTipi case final value?) 'DOVIZ_TIPI': value,
      if (instance.bastar case final value?) 'BASTAR': value,
      if (instance.bittar case final value?) 'BITTAR': value,
      if (instance.grupKodu case final value?) 'GRUP_KODU': value,
      if (instance.borcAlacak case final value?) 'BORC_ALACAK': value,
      if (instance.refTarih case final value?) 'REF_TARIH': value,
      if (instance.tarihTipi case final value?) 'TARIH_TIPI': value,
      if (instance.kod1 case final value?) 'KOD1': value,
      if (instance.kod2 case final value?) 'KOD2': value,
      if (instance.kod3 case final value?) 'KOD3': value,
      if (instance.kod4 case final value?) 'KOD4': value,
      if (instance.kod5 case final value?) 'KOD5': value,
      if (instance.kapali case final value?) 'KAPALI': value,
      if (instance.durum case final value?) 'DURUM': value,
      if (instance.vergiNo case final value?) 'VERGI_NO': value,
      if (instance.plasiyerKodu case final value?) 'PLASIYER_KODU': value,
      if (instance.aralikTipi case final value?) 'ARALIK_TIPI': value,
      if (instance.sirala case final value?) 'SIRALA': value,
      if (instance.bakiyeDurumu case final value?) 'BAKIYE_DURUMU': value,
      if (instance.caharInckey case final value?) 'CAHAR_INCKEY': value,
      if (instance.belgeTipi case final value?) 'BELGE_TIPI': value,
      if (instance.isemriNo case final value?) 'ISEMRI_NO': value,
      if (instance.dinamikParam case final value?) 'DINAMIK_PARAM': value,
      if (instance.kasaharInckey case final value?) 'KASAHAR_INCKEY': value,
      if (instance.uretimFiyatiDahil case final value?)
        'URETIM_FIYATI_DAHIL': value,
      if (instance.fiyatTipi case final value?) 'FIYAT_TIPI': value,
      if (instance.tblnfStokfiyatgecmisiId case final value?)
        'TBLNF_STOKFIYATGECMISI_ID': value,
      if (instance.gorunecekAlanlar case final value?)
        'GORUNECEK_ALANLAR': value,
      if (instance.miktar case final value?) 'MIKTAR': value,
      if (instance.yapkod case final value?) 'YAPKOD': value,
      if (instance.opkodu case final value?) 'OPKODU': value,
      if (instance.kasaKodu case final value?) 'KASA_KODU': value,
      if (instance.muhasebeKodu case final value?) 'MUHASEBE_KODU': value,
      if (instance.filtre case final value?) 'FILTRE': value,
      if (instance.depoKodu case final value?) 'DEPO_KODU': value,
      if (instance.hucreKodu case final value?) 'HUCRE_KODU': value,
      if (instance.kalemId case final value?) 'KALEM_ID': value,
      if (instance.tempBelgeId case final value?) 'TEMP_BELGE_ID': value,
    };
