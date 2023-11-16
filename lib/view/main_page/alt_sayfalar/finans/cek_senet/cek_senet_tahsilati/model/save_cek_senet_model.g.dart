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
              (e) => CekSenetkalemlerModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      pickerTahsilatTuru: json['PICKER_TAHSILAT_TURU'] as String?,
      plasiyerKodu: json['PLASIYER_KODU'] as String?,
      tag: json['TAG'] as String?,
      tarih: json['TARIH'] == null
          ? null
          : DateTime.parse(json['TARIH'] as String),
      yeniKayit: json['YENI_KAYIT'] as bool?,
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
  writeNotNull('PICKER_TAHSILAT_TURU', instance.pickerTahsilatTuru);
  writeNotNull('PLASIYER_KODU', instance.plasiyerKodu);
  writeNotNull('TAG', instance.tag);
  writeNotNull('TARIH', instance.tarih?.toIso8601String());
  writeNotNull('YENI_KAYIT', instance.yeniKayit);
  return val;
}

_$CekSenetkalemlerModelImpl _$$CekSenetkalemlerModelImplFromJson(
        Map<String, dynamic> json) =>
    _$CekSenetkalemlerModelImpl(
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
      tag: json['TAG'] as String?,
      tarih: json['TARIH'] == null
          ? null
          : DateTime.parse(json['TARIH'] as String),
      tutar: (json['TUTAR'] as num?)?.toDouble(),
      vadeTarihi: json['VADE_TARIHI'] == null
          ? null
          : DateTime.parse(json['VADE_TARIHI'] as String),
    );

Map<String, dynamic> _$$CekSenetkalemlerModelImplToJson(
    _$CekSenetkalemlerModelImpl instance) {
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
  writeNotNull('TAG', instance.tag);
  writeNotNull('TARIH', instance.tarih?.toIso8601String());
  writeNotNull('TUTAR', instance.tutar);
  writeNotNull('VADE_TARIHI', instance.vadeTarihi?.toIso8601String());
  return val;
}
