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
  return val;
}
