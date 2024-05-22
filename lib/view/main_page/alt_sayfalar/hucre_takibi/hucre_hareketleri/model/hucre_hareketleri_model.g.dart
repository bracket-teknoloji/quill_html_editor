// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hucre_hareketleri_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HucreHareketleriModelImpl _$$HucreHareketleriModelImplFromJson(
        Map<String, dynamic> json) =>
    _$HucreHareketleriModelImpl(
      inckeyno: (json['INCKEYNO'] as num?)?.toInt(),
      stokKodu: json['STOK_KODU'] as String?,
      stokAdi: json['STOK_ADI'] as String?,
      gc: json['GC'] as String?,
      hucreKodu: json['HUCRE_KODU'] as String?,
      tarih: json['TARIH'] == null
          ? null
          : DateTime.parse(json['TARIH'] as String),
      netMiktar: (json['NET_MIKTAR'] as num?)?.toInt(),
      belgeTipi: json['BELGE_TIPI'] as String?,
      hareketTuru: json['HAREKET_TURU'] as String?,
      hareketAdi: json['HAREKET_ADI'] as String?,
      kayityapankul: json['KAYITYAPANKUL'] as String?,
      kayittarihi: json['KAYITTARIHI'] == null
          ? null
          : DateTime.parse(json['KAYITTARIHI'] as String),
      depoKodu: (json['DEPO_KODU'] as num?)?.toInt(),
      depoTanimi: json['DEPO_TANIMI'] as String?,
      eksiBakiye: json['EKSI_BAKIYE'] as String?,
      stokOlcuBirimi: json['STOK_OLCU_BIRIMI'] as String?,
      stharFisno: json['STHAR_FISNO'] as String?,
      stharInc: (json['STHAR_INC'] as num?)?.toInt(),
      yapkod: json['YAPKOD'] as String?,
    );

Map<String, dynamic> _$$HucreHareketleriModelImplToJson(
    _$HucreHareketleriModelImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('INCKEYNO', instance.inckeyno);
  writeNotNull('STOK_KODU', instance.stokKodu);
  writeNotNull('STOK_ADI', instance.stokAdi);
  writeNotNull('GC', instance.gc);
  writeNotNull('HUCRE_KODU', instance.hucreKodu);
  writeNotNull('TARIH', instance.tarih?.toIso8601String());
  writeNotNull('NET_MIKTAR', instance.netMiktar);
  writeNotNull('BELGE_TIPI', instance.belgeTipi);
  writeNotNull('HAREKET_TURU', instance.hareketTuru);
  writeNotNull('HAREKET_ADI', instance.hareketAdi);
  writeNotNull('KAYITYAPANKUL', instance.kayityapankul);
  writeNotNull('KAYITTARIHI', instance.kayittarihi?.toIso8601String());
  writeNotNull('DEPO_KODU', instance.depoKodu);
  writeNotNull('DEPO_TANIMI', instance.depoTanimi);
  writeNotNull('EKSI_BAKIYE', instance.eksiBakiye);
  writeNotNull('STOK_OLCU_BIRIMI', instance.stokOlcuBirimi);
  writeNotNull('STHAR_FISNO', instance.stharFisno);
  writeNotNull('STHAR_INC', instance.stharInc);
  writeNotNull('YAPKOD', instance.yapkod);
  return val;
}
