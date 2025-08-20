// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cek_senet_hareketleri_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CekSenetHareketleriModel _$CekSenetHareketleriModelFromJson(
  Map<String, dynamic> json,
) => _CekSenetHareketleriModel(
  inckeyno: (json['INCKEYNO'] as num?)?.toInt(),
  belgeTipi: json['BELGE_TIPI'] as String?,
  belgeNo: json['BELGE_NO'] as String?,
  yeri: json['YERI'] as String?,
  durum: json['DURUM'] as String?,
  tarih: json['TARIH'] == null ? null : DateTime.parse(json['TARIH'] as String),
  hesapKodu: json['HESAP_KODU'] as String?,
  islemKodu: (json['ISLEM_KODU'] as num?)?.toInt(),
  islemAdi: json['ISLEM_ADI'] as String?,
  alinanBordroNo: json['ALINAN_BORDRO_NO'] as String?,
  verilenBordroNo: json['VERILEN_BORDRO_NO'] as String?,
  devir: json['DEVIR'] as String?,
  nereye: json['NEREYE'] as String?,
  kayityapankul: json['KAYITYAPANKUL'] as String?,
  kayittarihi: json['KAYITTARIHI'] as String?,
);

Map<String, dynamic> _$CekSenetHareketleriModelToJson(
  _CekSenetHareketleriModel instance,
) => <String, dynamic>{
  'INCKEYNO': ?instance.inckeyno,
  'BELGE_TIPI': ?instance.belgeTipi,
  'BELGE_NO': ?instance.belgeNo,
  'YERI': ?instance.yeri,
  'DURUM': ?instance.durum,
  'TARIH': ?instance.tarih?.toIso8601String(),
  'HESAP_KODU': ?instance.hesapKodu,
  'ISLEM_KODU': ?instance.islemKodu,
  'ISLEM_ADI': ?instance.islemAdi,
  'ALINAN_BORDRO_NO': ?instance.alinanBordroNo,
  'VERILEN_BORDRO_NO': ?instance.verilenBordroNo,
  'DEVIR': ?instance.devir,
  'NEREYE': ?instance.nereye,
  'KAYITYAPANKUL': ?instance.kayityapankul,
  'KAYITTARIHI': ?instance.kayittarihi,
};
