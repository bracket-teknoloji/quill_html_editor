// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cek_senet_listesi_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CekSenetListesiModelImpl _$$CekSenetListesiModelImplFromJson(
        Map<String, dynamic> json) =>
    _$CekSenetListesiModelImpl(
      isCiroTipli: json['IS_CIRO_TIPLI'] as bool?,
      cikisTarihi: json['CIKIS_TARIHI'] == null
          ? null
          : DateTime.parse(json['CIKIS_TARIHI'] as String),
      odemeTarihi: json['ODEME_TARIHI'] == null
          ? null
          : DateTime.parse(json['ODEME_TARIHI'] as String),
      tarih: json['TARIH'] == null
          ? null
          : DateTime.parse(json['TARIH'] as String),
      vadeTarihi: json['VADE_TARIHI'] == null
          ? null
          : DateTime.parse(json['VADE_TARIHI'] as String),
      dovizTutari: (json['DOVIZ_TUTARI'] as num?)?.toDouble(),
      getDovizTutari: (json['GetDovizTutari'] as num?)?.toDouble(),
      tutar: (json['TUTAR'] as num?)?.toDouble(),
      dovizTipi: json['DOVIZ_TIPI'] as int?,
      evrakSayisi: json['EVRAK_SAYISI'] as int?,
      getDovizTipi: json['GetDovizTipi'] as int?,
      aciklama1: json['ACIKLAMA1'] as String?,
      aciklama2: json['ACIKLAMA2'] as String?,
      aciklama3: json['ACIKLAMA3'] as String?,
      alinanBordroNo: json['ALINAN_BORDRO_NO'] as String?,
      asilCari: json['ASIL_CARI'] as String?,
      belgeNo: json['BELGE_NO'] as String?,
      belgeTipi: json['BELGE_TIPI'] as String?,
      cariAdi: json['CARI_ADI'] as String?,
      cariKodu: json['CARI_KODU'] as String?,
      cariRaporKodu: json['CARI_RAPOR_KODU'] as String?,
      cekBanka: json['CEK_BANKA'] as String?,
      cekSube: json['CEK_SUBE'] as String?,
      ciroTipi: json['CIRO_TIPI'] as String?,
      dovizKodu: json['DOVIZ_KODU'] as String?,
      durum: json['DURUM'] as String?,
      durumAciklama: json['DURUM_ACIKLAMA'] as String?,
      getAsilCariAdi: json['GetAsilCariAdi'] as String?,
      getCekBankaAdi: json['GetCekBankaAdi'] as String?,
      getCekSubeAdi: json['GetCekSubeAdi'] as String?,
      plasiyerKodu: json['PLASIYER_KODU'] as String?,
      projeKodu: json['PROJE_KODU'] as String?,
      raporKodu: json['RAPOR_KODU'] as String?,
      seriNo: json['SERI_NO'] as String?,
      verenKodu: json['VEREN_KODU'] as String?,
      verilenAdi: json['VERILEN_ADI'] as String?,
      verilenBankaKodu: json['VERILEN_BANKA_KODU'] as String?,
      verilenBordroNo: json['VERILEN_BORDRO_NO'] as String?,
      verilenKodu: json['VERILEN_KODU'] as String?,
      yerAciklama: json['YER_ACIKLAMA'] as String?,
      yeri: json['YERI'] as String?,
    );

Map<String, dynamic> _$$CekSenetListesiModelImplToJson(
    _$CekSenetListesiModelImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('IS_CIRO_TIPLI', instance.isCiroTipli);
  writeNotNull('CIKIS_TARIHI', instance.cikisTarihi?.toIso8601String());
  writeNotNull('ODEME_TARIHI', instance.odemeTarihi?.toIso8601String());
  writeNotNull('TARIH', instance.tarih?.toIso8601String());
  writeNotNull('VADE_TARIHI', instance.vadeTarihi?.toIso8601String());
  writeNotNull('DOVIZ_TUTARI', instance.dovizTutari);
  writeNotNull('GetDovizTutari', instance.getDovizTutari);
  writeNotNull('TUTAR', instance.tutar);
  writeNotNull('DOVIZ_TIPI', instance.dovizTipi);
  writeNotNull('EVRAK_SAYISI', instance.evrakSayisi);
  writeNotNull('GetDovizTipi', instance.getDovizTipi);
  writeNotNull('ACIKLAMA1', instance.aciklama1);
  writeNotNull('ACIKLAMA2', instance.aciklama2);
  writeNotNull('ACIKLAMA3', instance.aciklama3);
  writeNotNull('ALINAN_BORDRO_NO', instance.alinanBordroNo);
  writeNotNull('ASIL_CARI', instance.asilCari);
  writeNotNull('BELGE_NO', instance.belgeNo);
  writeNotNull('BELGE_TIPI', instance.belgeTipi);
  writeNotNull('CARI_ADI', instance.cariAdi);
  writeNotNull('CARI_KODU', instance.cariKodu);
  writeNotNull('CARI_RAPOR_KODU', instance.cariRaporKodu);
  writeNotNull('CEK_BANKA', instance.cekBanka);
  writeNotNull('CEK_SUBE', instance.cekSube);
  writeNotNull('CIRO_TIPI', instance.ciroTipi);
  writeNotNull('DOVIZ_KODU', instance.dovizKodu);
  writeNotNull('DURUM', instance.durum);
  writeNotNull('DURUM_ACIKLAMA', instance.durumAciklama);
  writeNotNull('GetAsilCariAdi', instance.getAsilCariAdi);
  writeNotNull('GetCekBankaAdi', instance.getCekBankaAdi);
  writeNotNull('GetCekSubeAdi', instance.getCekSubeAdi);
  writeNotNull('PLASIYER_KODU', instance.plasiyerKodu);
  writeNotNull('PROJE_KODU', instance.projeKodu);
  writeNotNull('RAPOR_KODU', instance.raporKodu);
  writeNotNull('SERI_NO', instance.seriNo);
  writeNotNull('VEREN_KODU', instance.verenKodu);
  writeNotNull('VERILEN_ADI', instance.verilenAdi);
  writeNotNull('VERILEN_BANKA_KODU', instance.verilenBankaKodu);
  writeNotNull('VERILEN_BORDRO_NO', instance.verilenBordroNo);
  writeNotNull('VERILEN_KODU', instance.verilenKodu);
  writeNotNull('YER_ACIKLAMA', instance.yerAciklama);
  writeNotNull('YERI', instance.yeri);
  return val;
}
