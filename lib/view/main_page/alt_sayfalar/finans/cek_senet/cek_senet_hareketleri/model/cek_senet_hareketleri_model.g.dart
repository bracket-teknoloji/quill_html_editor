// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cek_senet_hareketleri_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CekSenetHareketleriModelImpl _$$CekSenetHareketleriModelImplFromJson(
        Map<String, dynamic> json) =>
    _$CekSenetHareketleriModelImpl(
      inckeyno: (json['INCKEYNO'] as num?)?.toInt(),
      belgeTipi: json['BELGE_TIPI'] as String?,
      belgeNo: json['BELGE_NO'] as String?,
      yeri: json['YERI'] as String?,
      durum: json['DURUM'] as String?,
      tarih: json['TARIH'] == null
          ? null
          : DateTime.parse(json['TARIH'] as String),
      hesapKodu: json['HESAP_KODU'] as String?,
      islemKodu: (json['ISLEM_KODU'] as num?)?.toInt(),
      islemAdi: json['ISLEM_ADI'] as String?,
      alinanBordroNo: json['ALINAN_BORDRO_NO'] as String?,
      devir: json['DEVIR'] as String?,
      nereye: json['NEREYE'] as String?,
      kayityapankul: json['KAYITYAPANKUL'] as String?,
      kayittarihi: json['KAYITTARIHI'] as String?,
    );

Map<String, dynamic> _$$CekSenetHareketleriModelImplToJson(
        _$CekSenetHareketleriModelImpl instance) =>
    <String, dynamic>{
      if (instance.inckeyno case final value?) 'INCKEYNO': value,
      if (instance.belgeTipi case final value?) 'BELGE_TIPI': value,
      if (instance.belgeNo case final value?) 'BELGE_NO': value,
      if (instance.yeri case final value?) 'YERI': value,
      if (instance.durum case final value?) 'DURUM': value,
      if (instance.tarih?.toIso8601String() case final value?) 'TARIH': value,
      if (instance.hesapKodu case final value?) 'HESAP_KODU': value,
      if (instance.islemKodu case final value?) 'ISLEM_KODU': value,
      if (instance.islemAdi case final value?) 'ISLEM_ADI': value,
      if (instance.alinanBordroNo case final value?) 'ALINAN_BORDRO_NO': value,
      if (instance.devir case final value?) 'DEVIR': value,
      if (instance.nereye case final value?) 'NEREYE': value,
      if (instance.kayityapankul case final value?) 'KAYITYAPANKUL': value,
      if (instance.kayittarihi case final value?) 'KAYITTARIHI': value,
    };
