// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tahsilat_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TahsilatRequestModelImpl _$$TahsilatRequestModelImplFromJson(
        Map<String, dynamic> json) =>
    _$TahsilatRequestModelImpl(
      aciklama: json['ACIKLAMA'] as String?,
      belgeNo: json['BELGE_NO'] as String?,
      gc: json['GC'] as String?,
      guid: json['GUID'] as String?,
      hesapKodu: json['HESAP_KODU'] as String?,
      hesapTipi: json['HESAP_TIPI'] as String?,
      kasaKodu: json['KASA_KODU'] as String?,
      plasiyerKodu: json['PLASIYER_KODU'] as String?,
      projeKodu: json['PROJE_KODU'] as String?,
      tag: json['TAG'] as String?,
      tahsilatmi: json['TAHSILATMI'] as bool?,
      tarih: json['TARIH'] == null
          ? null
          : DateTime.parse(json['TARIH'] as String),
      tutar: (json['TUTAR'] as num?)?.toDouble(),
      dovizTutari: (json['DOVIZ_TUTARI'] as num?)?.toDouble(),
      dovizTipi: (json['DOVIZ_TIPI'] as num?)?.toInt(),
      kktYontemi: json['KKT_YONTEMI'] as String?,
      refKod: json['REF_KOD'] as String?,
      pickerBelgeTuru: json['PickerBelgeTuru'] as String?,
      stokKodu: json['STOK_KODU'] as String?,
      depoKodu: (json['DEPO_KODU'] as num?)?.toInt(),
      hareketTuru: json['HAREKET_TURU'] as String?,
      miktar: (json['MIKTAR'] as num?)?.toInt(),
      fiyat: (json['FIYAT'] as num?)?.toDouble(),
      dekontSeri: json['DEKONT_SERI'] as String?,
      yeniKayit: json['_YeniKayit'] as bool?,
      cariKodu: json['CARI_KODU'] as String?,
      sozlesmeKodu: json['SOZLESME_KODU'] as String?,
      krediKartNo: json['KREDI_KART_NO'] as String?,
      hedefAciklama: json['HEDEF_ACIKLAMA'] as String?,
      vadeGunu: (json['VADE_GUNU'] as num?)?.toInt(),
      bsmvTutari: (json['BSMV_TUTARI'] as num?)?.toDouble(),
      dekontIslemTuru: json['DEKONT_ISLEM_TURU'] as String?,
      dekontBelgeNo: json['DEKONT_BELGE_NO'] as String?,
      hedefHesapKodu: json['HEDEF_HESAP_KODU'] as String?,
      islemModulu: json['ISLEM_MODULU'] as String?,
      masrafMuhKodu: json['MASRAF_MUH_KODU'] as String?,
      masrafTutari: (json['MASRAF_TUTARI'] as num?)?.toDouble(),
      cariyiBorclandir: json['CARIYI_BORCLANDIR'] as bool?,
      hesapNo: json['HESAP_NO'] as String?,
      iban: json['IBAN'] as String?,
      tcmbBankaKodu: json['TCMB_BANKA_KODU'] as String?,
      tcmbSubeKodu: json['TCMB_SUBE_KODU'] as String?,
      kalemler: (json['KALEMLER'] as List<dynamic>?)
          ?.map((e) => DekontKalemler.fromJson(e as Map<String, dynamic>))
          .toList(),
      hedefCariKodu: json['HEDEF_CARI_KODU'] as String?,
      tahsilatBakiye: (json['TAHSILAT_BAKIYE'] as num?)?.toDouble(),
      odemeBakiye: (json['ODEME_BAKIYE'] as num?)?.toDouble(),
      hedefHesapReferansKodu: json['HEDEF_HESAP_REFERANS_KODU'] as String?,
      kaynakHesapReferansKodu: json['KAYNAK_HESAP_REFERANS_KODU'] as String?,
      taksitSayisi: (json['TAKSIT_SAYISI'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$TahsilatRequestModelImplToJson(
        _$TahsilatRequestModelImpl instance) =>
    <String, dynamic>{
      if (instance.aciklama case final value?) 'ACIKLAMA': value,
      if (instance.belgeNo case final value?) 'BELGE_NO': value,
      if (instance.gc case final value?) 'GC': value,
      if (instance.guid case final value?) 'GUID': value,
      if (instance.hesapKodu case final value?) 'HESAP_KODU': value,
      if (instance.hesapTipi case final value?) 'HESAP_TIPI': value,
      if (instance.kasaKodu case final value?) 'KASA_KODU': value,
      if (instance.plasiyerKodu case final value?) 'PLASIYER_KODU': value,
      if (instance.projeKodu case final value?) 'PROJE_KODU': value,
      if (instance.tag case final value?) 'TAG': value,
      if (instance.tahsilatmi case final value?) 'TAHSILATMI': value,
      if (instance.tarih?.toIso8601String() case final value?) 'TARIH': value,
      if (instance.tutar case final value?) 'TUTAR': value,
      if (instance.dovizTutari case final value?) 'DOVIZ_TUTARI': value,
      if (instance.dovizTipi case final value?) 'DOVIZ_TIPI': value,
      if (instance.kktYontemi case final value?) 'KKT_YONTEMI': value,
      if (instance.refKod case final value?) 'REF_KOD': value,
      if (instance.pickerBelgeTuru case final value?) 'PickerBelgeTuru': value,
      if (instance.stokKodu case final value?) 'STOK_KODU': value,
      if (instance.depoKodu case final value?) 'DEPO_KODU': value,
      if (instance.hareketTuru case final value?) 'HAREKET_TURU': value,
      if (instance.miktar case final value?) 'MIKTAR': value,
      if (instance.fiyat case final value?) 'FIYAT': value,
      if (instance.dekontSeri case final value?) 'DEKONT_SERI': value,
      if (instance.yeniKayit case final value?) '_YeniKayit': value,
      if (instance.cariKodu case final value?) 'CARI_KODU': value,
      if (instance.sozlesmeKodu case final value?) 'SOZLESME_KODU': value,
      if (instance.krediKartNo case final value?) 'KREDI_KART_NO': value,
      if (instance.hedefAciklama case final value?) 'HEDEF_ACIKLAMA': value,
      if (instance.vadeGunu case final value?) 'VADE_GUNU': value,
      if (instance.bsmvTutari case final value?) 'BSMV_TUTARI': value,
      if (instance.dekontIslemTuru case final value?)
        'DEKONT_ISLEM_TURU': value,
      if (instance.dekontBelgeNo case final value?) 'DEKONT_BELGE_NO': value,
      if (instance.hedefHesapKodu case final value?) 'HEDEF_HESAP_KODU': value,
      if (instance.islemModulu case final value?) 'ISLEM_MODULU': value,
      if (instance.masrafMuhKodu case final value?) 'MASRAF_MUH_KODU': value,
      if (instance.masrafTutari case final value?) 'MASRAF_TUTARI': value,
      if (instance.cariyiBorclandir case final value?)
        'CARIYI_BORCLANDIR': value,
      if (instance.hesapNo case final value?) 'HESAP_NO': value,
      if (instance.iban case final value?) 'IBAN': value,
      if (instance.tcmbBankaKodu case final value?) 'TCMB_BANKA_KODU': value,
      if (instance.tcmbSubeKodu case final value?) 'TCMB_SUBE_KODU': value,
      if (instance.kalemler?.map((e) => e.toJson()).toList() case final value?)
        'KALEMLER': value,
      if (instance.hedefCariKodu case final value?) 'HEDEF_CARI_KODU': value,
      if (instance.tahsilatBakiye case final value?) 'TAHSILAT_BAKIYE': value,
      if (instance.odemeBakiye case final value?) 'ODEME_BAKIYE': value,
      if (instance.hedefHesapReferansKodu case final value?)
        'HEDEF_HESAP_REFERANS_KODU': value,
      if (instance.kaynakHesapReferansKodu case final value?)
        'KAYNAK_HESAP_REFERANS_KODU': value,
      if (instance.taksitSayisi case final value?) 'TAKSIT_SAYISI': value,
    };

_$DekontKalemlerImpl _$$DekontKalemlerImplFromJson(Map<String, dynamic> json) =>
    _$DekontKalemlerImpl(
      aciklama: json['ACIKLAMA'] as String?,
      belgeNo: json['BELGE_NO'] as String?,
      ba: json['BA'] as String?,
      dovizTipi: (json['DOVIZ_TIPI'] as num?)?.toInt(),
      dovizTutari: (json['DOVIZ_TUTARI'] as num?)?.toDouble(),
      exportRefno: json['EXPORT_REFNO'] as String?,
      exportTipi: (json['EXPORT_TIPI'] as num?)?.toInt(),
      hesapKodu: json['HESAP_KODU'] as String?,
      hesapTipi: json['HESAP_TIPI'] as String?,
      plasiyerKodu: json['PLASIYER_KODU'] as String?,
      projeKodu: json['PROJE_KODU'] as String?,
      tarih: json['TARIH'] == null
          ? null
          : DateTime.parse(json['TARIH'] as String),
      tutar: (json['TUTAR'] as num?)?.toDouble(),
      depoKodu: (json['DEPO_KODU'] as num?)?.toInt(),
      inckeyno: (json['INCKEYNO'] as num?)?.toInt(),
      seriNo: json['SERI_NO'] as String?,
      dekontNo: (json['DEKONT_NO'] as num?)?.toInt(),
      siraNo: (json['SIRA_NO'] as num?)?.toInt(),
      hesapTipiAciklama: json['HESAP_TIPI_ACIKLAMA'] as String?,
      hesapAdi: json['HESAP_ADI'] as String?,
      dovizAdi: json['DOVIZ_ADI'] as String?,
      refkey: json['REFKEY'] as String?,
      plasiyerAciklama: json['PLASIYER_ACIKLAMA'] as String?,
      muhasebeHesapTipi: json['MUHASEBE_HESAP_TIPI'] as String?,
      cariKodu: json['CARI_KODU'] as String?,
      dekontIslemTuru: json['DEKONT_ISLEM_TURU'] as String?,
      dekontSeri: json['DEKONT_SERI'] as String?,
      guid: json['GUID'] as String?,
      hedefAciklama: json['HEDEF_ACIKLAMA'] as String?,
      hedefCariKodu: json['HEDEF_CARI_KODU'] as String?,
      islemModulu: json['ISLEM_MODULU'] as String?,
      tag: json['TAG'] as String?,
      vadeGunu: (json['VADE_GUNU'] as num?)?.toInt(),
      yeniKayit: json['YENI_KAYIT'] as bool?,
    );

Map<String, dynamic> _$$DekontKalemlerImplToJson(
        _$DekontKalemlerImpl instance) =>
    <String, dynamic>{
      if (instance.aciklama case final value?) 'ACIKLAMA': value,
      if (instance.belgeNo case final value?) 'BELGE_NO': value,
      if (instance.ba case final value?) 'BA': value,
      if (instance.dovizTipi case final value?) 'DOVIZ_TIPI': value,
      if (instance.dovizTutari case final value?) 'DOVIZ_TUTARI': value,
      if (instance.exportRefno case final value?) 'EXPORT_REFNO': value,
      if (instance.exportTipi case final value?) 'EXPORT_TIPI': value,
      if (instance.hesapKodu case final value?) 'HESAP_KODU': value,
      if (instance.hesapTipi case final value?) 'HESAP_TIPI': value,
      if (instance.plasiyerKodu case final value?) 'PLASIYER_KODU': value,
      if (instance.projeKodu case final value?) 'PROJE_KODU': value,
      if (instance.tarih?.toIso8601String() case final value?) 'TARIH': value,
      if (instance.tutar case final value?) 'TUTAR': value,
      if (instance.depoKodu case final value?) 'DEPO_KODU': value,
      if (instance.inckeyno case final value?) 'INCKEYNO': value,
      if (instance.seriNo case final value?) 'SERI_NO': value,
      if (instance.dekontNo case final value?) 'DEKONT_NO': value,
      if (instance.siraNo case final value?) 'SIRA_NO': value,
      if (instance.hesapTipiAciklama case final value?)
        'HESAP_TIPI_ACIKLAMA': value,
      if (instance.hesapAdi case final value?) 'HESAP_ADI': value,
      if (instance.dovizAdi case final value?) 'DOVIZ_ADI': value,
      if (instance.refkey case final value?) 'REFKEY': value,
      if (instance.plasiyerAciklama case final value?)
        'PLASIYER_ACIKLAMA': value,
      if (instance.muhasebeHesapTipi case final value?)
        'MUHASEBE_HESAP_TIPI': value,
      if (instance.cariKodu case final value?) 'CARI_KODU': value,
      if (instance.dekontIslemTuru case final value?)
        'DEKONT_ISLEM_TURU': value,
      if (instance.dekontSeri case final value?) 'DEKONT_SERI': value,
      if (instance.guid case final value?) 'GUID': value,
      if (instance.hedefAciklama case final value?) 'HEDEF_ACIKLAMA': value,
      if (instance.hedefCariKodu case final value?) 'HEDEF_CARI_KODU': value,
      if (instance.islemModulu case final value?) 'ISLEM_MODULU': value,
      if (instance.tag case final value?) 'TAG': value,
      if (instance.vadeGunu case final value?) 'VADE_GUNU': value,
      if (instance.yeniKayit case final value?) 'YENI_KAYIT': value,
    };
