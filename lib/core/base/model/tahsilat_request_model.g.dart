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
      dovizTipi: json['DOVIZ_TIPI'] as int?,
      kktYontemi: json['KKT_YONTEMI'] as String?,
      refKod: json['REF_KOD'] as String?,
      pickerBelgeTuru: json['PickerBelgeTuru'] as String?,
      stokKodu: json['STOK_KODU'] as String?,
      depoKodu: json['DEPO_KODU'] as int?,
      hareketTuru: json['HAREKET_TURU'] as String?,
      miktar: json['MIKTAR'] as int?,
      fiyat: (json['FIYAT'] as num?)?.toDouble(),
      dekontSeri: json['DEKONT_SERI'] as String?,
      yeniKayit: json['_YeniKayit'] as bool?,
      cariKodu: json['CARI_KODU'] as String?,
      sozlesmeKodu: json['SOZLESME_KODU'] as String?,
      krediKartNo: json['KREDI_KART_NO'] as String?,
      hedefAciklama: json['HEDEF_ACIKLAMA'] as String?,
      vadeGunu: json['VADE_GUNU'] as int?,
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
    );

Map<String, dynamic> _$$TahsilatRequestModelImplToJson(
    _$TahsilatRequestModelImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ACIKLAMA', instance.aciklama);
  writeNotNull('BELGE_NO', instance.belgeNo);
  writeNotNull('GC', instance.gc);
  writeNotNull('GUID', instance.guid);
  writeNotNull('HESAP_KODU', instance.hesapKodu);
  writeNotNull('HESAP_TIPI', instance.hesapTipi);
  writeNotNull('KASA_KODU', instance.kasaKodu);
  writeNotNull('PLASIYER_KODU', instance.plasiyerKodu);
  writeNotNull('PROJE_KODU', instance.projeKodu);
  writeNotNull('TAG', instance.tag);
  writeNotNull('TAHSILATMI', instance.tahsilatmi);
  writeNotNull('TARIH', instance.tarih?.toIso8601String());
  writeNotNull('TUTAR', instance.tutar);
  writeNotNull('DOVIZ_TUTARI', instance.dovizTutari);
  writeNotNull('DOVIZ_TIPI', instance.dovizTipi);
  writeNotNull('KKT_YONTEMI', instance.kktYontemi);
  writeNotNull('REF_KOD', instance.refKod);
  writeNotNull('PickerBelgeTuru', instance.pickerBelgeTuru);
  writeNotNull('STOK_KODU', instance.stokKodu);
  writeNotNull('DEPO_KODU', instance.depoKodu);
  writeNotNull('HAREKET_TURU', instance.hareketTuru);
  writeNotNull('MIKTAR', instance.miktar);
  writeNotNull('FIYAT', instance.fiyat);
  writeNotNull('DEKONT_SERI', instance.dekontSeri);
  writeNotNull('_YeniKayit', instance.yeniKayit);
  writeNotNull('CARI_KODU', instance.cariKodu);
  writeNotNull('SOZLESME_KODU', instance.sozlesmeKodu);
  writeNotNull('KREDI_KART_NO', instance.krediKartNo);
  writeNotNull('HEDEF_ACIKLAMA', instance.hedefAciklama);
  writeNotNull('VADE_GUNU', instance.vadeGunu);
  writeNotNull('BSMV_TUTARI', instance.bsmvTutari);
  writeNotNull('DEKONT_ISLEM_TURU', instance.dekontIslemTuru);
  writeNotNull('DEKONT_BELGE_NO', instance.dekontBelgeNo);
  writeNotNull('HEDEF_HESAP_KODU', instance.hedefHesapKodu);
  writeNotNull('ISLEM_MODULU', instance.islemModulu);
  writeNotNull('MASRAF_MUH_KODU', instance.masrafMuhKodu);
  writeNotNull('MASRAF_TUTARI', instance.masrafTutari);
  writeNotNull('CARIYI_BORCLANDIR', instance.cariyiBorclandir);
  writeNotNull('HESAP_NO', instance.hesapNo);
  writeNotNull('IBAN', instance.iban);
  writeNotNull('TCMB_BANKA_KODU', instance.tcmbBankaKodu);
  writeNotNull('TCMB_SUBE_KODU', instance.tcmbSubeKodu);
  writeNotNull('KALEMLER', instance.kalemler?.map((e) => e.toJson()).toList());
  return val;
}

_$DekontKalemlerImpl _$$DekontKalemlerImplFromJson(Map<String, dynamic> json) =>
    _$DekontKalemlerImpl(
      aciklama: json['ACIKLAMA'] as String?,
      belgeNo: json['BELGE_NO'] as String?,
      ba: json['BA'] as String?,
      dovizTipi: json['DOVIZ_TIPI'] as int?,
      dovizTutari: (json['DOVIZ_TUTARI'] as num?)?.toDouble(),
      exportRefno: json['EXPORT_REFNO'] as String?,
      exportTipi: json['EXPORT_TIPI'] as int?,
      hesapKodu: json['HESAP_KODU'] as String?,
      hesapTipi: json['HESAP_TIPI'] as String?,
      plasiyerKodu: json['PLASIYER_KODU'] as String?,
      tarih: json['TARIH'] == null
          ? null
          : DateTime.parse(json['TARIH'] as String),
      tutar: (json['TUTAR'] as num?)?.toDouble(),
      depoKodu: json['DEPO_KODU'] as int?,
    );

Map<String, dynamic> _$$DekontKalemlerImplToJson(
    _$DekontKalemlerImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ACIKLAMA', instance.aciklama);
  writeNotNull('BELGE_NO', instance.belgeNo);
  writeNotNull('BA', instance.ba);
  writeNotNull('DOVIZ_TIPI', instance.dovizTipi);
  writeNotNull('DOVIZ_TUTARI', instance.dovizTutari);
  writeNotNull('EXPORT_REFNO', instance.exportRefno);
  writeNotNull('EXPORT_TIPI', instance.exportTipi);
  writeNotNull('HESAP_KODU', instance.hesapKodu);
  writeNotNull('HESAP_TIPI', instance.hesapTipi);
  writeNotNull('PLASIYER_KODU', instance.plasiyerKodu);
  writeNotNull('TARIH', instance.tarih?.toIso8601String());
  writeNotNull('TUTAR', instance.tutar);
  writeNotNull('DEPO_KODU', instance.depoKodu);
  return val;
}
