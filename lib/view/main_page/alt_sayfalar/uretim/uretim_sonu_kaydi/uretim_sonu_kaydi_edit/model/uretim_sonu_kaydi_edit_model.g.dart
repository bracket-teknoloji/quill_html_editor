// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'uretim_sonu_kaydi_edit_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UretimSonuKaydiEditModelImpl _$$UretimSonuKaydiEditModelImplFromJson(
        Map<String, dynamic> json) =>
    _$UretimSonuKaydiEditModelImpl(
      belgeNo: json['BELGE_NO'] as String?,
      belgeTarihi: json['BELGE_TARIHI'] == null
          ? null
          : DateTime.parse(json['BELGE_TARIHI'] as String),
      cikisDepo: (json['CIKIS_DEPO'] as num?)?.toInt(),
      aciklama: json['ACIKLAMA'] as String?,
      depoOnceligi: json['DEPO_ONCELIGI'] as String?,
      ekAlanlar: json['EkAlanlar'] == null
          ? null
          : EkAlanlar.fromJson(json['EkAlanlar'] as Map<String, dynamic>),
      girisDepo: (json['GIRIS_DEPO'] as num?)?.toInt(),
      guid: json['GUID'] as String?,
      kalemList: (json['KalemList'] as List<dynamic>?)
          ?.map((e) => KalemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      projeKodu: json['PROJE_KODU'] as String?,
      tarih: json['TARIH'] as String?,
      yeniKayit: json['_YeniKayit'] as bool?,
    );

Map<String, dynamic> _$$UretimSonuKaydiEditModelImplToJson(
    _$UretimSonuKaydiEditModelImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('BELGE_NO', instance.belgeNo);
  writeNotNull('BELGE_TARIHI', instance.belgeTarihi?.toIso8601String());
  writeNotNull('CIKIS_DEPO', instance.cikisDepo);
  writeNotNull('ACIKLAMA', instance.aciklama);
  writeNotNull('DEPO_ONCELIGI', instance.depoOnceligi);
  writeNotNull('EkAlanlar', instance.ekAlanlar?.toJson());
  writeNotNull('GIRIS_DEPO', instance.girisDepo);
  writeNotNull('GUID', instance.guid);
  writeNotNull(
      'KalemList', instance.kalemList?.map((e) => e.toJson()).toList());
  writeNotNull('PROJE_KODU', instance.projeKodu);
  writeNotNull('TARIH', instance.tarih);
  writeNotNull('_YeniKayit', instance.yeniKayit);
  return val;
}

_$EkAlanlarImpl _$$EkAlanlarImplFromJson(Map<String, dynamic> json) =>
    _$EkAlanlarImpl(
      ktAlan1: json['KT_ALAN1'] as String?,
      ktAlan3: json['KT_ALAN3'] as String?,
      ktAlan4: json['KT_ALAN4'] as String?,
    );

Map<String, dynamic> _$$EkAlanlarImplToJson(_$EkAlanlarImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('KT_ALAN1', instance.ktAlan1);
  writeNotNull('KT_ALAN3', instance.ktAlan3);
  writeNotNull('KT_ALAN4', instance.ktAlan4);
  return val;
}
