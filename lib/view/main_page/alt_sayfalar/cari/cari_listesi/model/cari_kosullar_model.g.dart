// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cari_kosullar_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CariKosullarModel _$CariKosullarModelFromJson(Map<String, dynamic> json) =>
    CariKosullarModel()
      ..kosulSabitAdi = json['KOSUL_SABIT_ADI'] as String?
      ..kosulKodu = json['KOSUL_KODU'] as String?
      ..genisk1o = (json['GENISK1O'] as num?)?.toInt()
      ..genisk2o = (json['GENISK2O'] as num?)?.toInt()
      ..genisk3o = (json['GENISK3O'] as num?)?.toInt()
      ..genelKosulAdi = json['GENEL_KOSUL_ADI'] as String?
      ..baslangictar = json['BASLANGICTAR'] as String?
      ..vadeGunu = (json['VADE_GUNU'] as num?)?.toInt()
      ..genisk1Tipi = (json['GENISK1_TIPI'] as num?)?.toInt()
      ..genisk2Tipi = (json['GENISK2_TIPI'] as num?)?.toInt()
      ..genisk3Tipi = (json['GENISK3_TIPI'] as num?)?.toInt()
      ..satisk1Tipi = (json['SATISK1_TIPI'] as num?)?.toInt()
      ..satisk2Tipi = (json['SATISK2_TIPI'] as num?)?.toInt()
      ..satisk3Tipi = (json['SATISK3_TIPI'] as num?)?.toInt()
      ..satisk4Tipi = (json['SATISK4_TIPI'] as num?)?.toInt()
      ..satisk5Tipi = (json['SATISK5_TIPI'] as num?)?.toInt()
      ..satisk6Tipi = (json['SATISK6_TIPI'] as num?)?.toInt()
      ..iskAraAktif = json['ISK_ARA_AKTIF'] as String?
      ..iskAraMiktut = json['ISK_ARA_MIKTUT'] as String?
      ..iskAraDeger1 = (json['ISK_ARA_DEGER1'] as num?)?.toDouble()
      ..iskAraDeger2 = (json['ISK_ARA_DEGER2'] as num?)?.toDouble()
      ..iskAraDeger3 = (json['ISK_ARA_DEGER3'] as num?)?.toDouble()
      ..iskAraHangiIsk = (json['ISK_ARA_HANGI_ISK'] as num?)?.toDouble()
      ..iskAraIsk1 = (json['ISK_ARA_ISK1'] as num?)?.toDouble()
      ..iskAraIsk2 = (json['ISK_ARA_ISK2'] as num?)?.toDouble()
      ..iskAraIsk3 = (json['ISK_ARA_ISK3'] as num?)?.toDouble()
      ..fiyatTarihi = json['FIYAT_TARIHI'] == null
          ? null
          : DateTime.parse(json['FIYAT_TARIHI'] as String)
      ..odemeKodu = json['ODEME_KODU'] as String?;

Map<String, dynamic> _$CariKosullarModelToJson(CariKosullarModel instance) =>
    <String, dynamic>{
      'KOSUL_SABIT_ADI': ?instance.kosulSabitAdi,
      'KOSUL_KODU': ?instance.kosulKodu,
      'GENISK1O': ?instance.genisk1o,
      'GENISK2O': ?instance.genisk2o,
      'GENISK3O': ?instance.genisk3o,
      'GENEL_KOSUL_ADI': ?instance.genelKosulAdi,
      'BASLANGICTAR': ?instance.baslangictar,
      'VADE_GUNU': ?instance.vadeGunu,
      'GENISK1_TIPI': ?instance.genisk1Tipi,
      'GENISK2_TIPI': ?instance.genisk2Tipi,
      'GENISK3_TIPI': ?instance.genisk3Tipi,
      'SATISK1_TIPI': ?instance.satisk1Tipi,
      'SATISK2_TIPI': ?instance.satisk2Tipi,
      'SATISK3_TIPI': ?instance.satisk3Tipi,
      'SATISK4_TIPI': ?instance.satisk4Tipi,
      'SATISK5_TIPI': ?instance.satisk5Tipi,
      'SATISK6_TIPI': ?instance.satisk6Tipi,
      'ISK_ARA_AKTIF': ?instance.iskAraAktif,
      'ISK_ARA_MIKTUT': ?instance.iskAraMiktut,
      'ISK_ARA_DEGER1': ?instance.iskAraDeger1,
      'ISK_ARA_DEGER2': ?instance.iskAraDeger2,
      'ISK_ARA_DEGER3': ?instance.iskAraDeger3,
      'ISK_ARA_HANGI_ISK': ?instance.iskAraHangiIsk,
      'ISK_ARA_ISK1': ?instance.iskAraIsk1,
      'ISK_ARA_ISK2': ?instance.iskAraIsk2,
      'ISK_ARA_ISK3': ?instance.iskAraIsk3,
      'FIYAT_TARIHI': ?instance.fiyatTarihi?.toIso8601String(),
      'ODEME_KODU': ?instance.odemeKodu,
    };
