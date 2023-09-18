// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cari_kosullar_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CariKosullarModel _$CariKosullarModelFromJson(Map<String, dynamic> json) =>
    CariKosullarModel()
      ..kosulSabitAdi = json['KOSUL_SABIT_ADI'] as String?
      ..kosulKodu = json['KOSUL_KODU'] as String?
      ..genisk1O = json['GENISK1_O'] as int?
      ..genisk2O = json['GENISK2_O'] as int?
      ..genisk3O = json['GENISK3_O'] as int?
      ..genelKosulAdi = json['GENEL_KOSUL_ADI'] as String?
      ..baslangictar = json['BASLANGICTAR'] as String?
      ..vadeGunu = json['VADE_GUNU'] as int?
      ..genisk1Tipi = json['GENISK1_TIPI'] as int?
      ..genisk2Tipi = json['GENISK2_TIPI'] as int?
      ..genisk3Tipi = json['GENISK3_TIPI'] as int?
      ..satisk1Tipi = json['SATISK1_TIPI'] as int?
      ..satisk2Tipi = json['SATISK2_TIPI'] as int?
      ..satisk3Tipi = json['SATISK3_TIPI'] as int?
      ..satisk4Tipi = json['SATISK4_TIPI'] as int?
      ..satisk5Tipi = json['SATISK5_TIPI'] as int?
      ..satisk6Tipi = json['SATISK6_TIPI'] as int?
      ..iskAraAktif = json['ISK_ARA_AKTIF'] as String?
      ..iskAraMiktut = json['ISK_ARA_MIKTUT'] as String?
      ..iskAraDeger1 = (json['ISK_ARA_DEGER1'] as num?)?.toDouble()
      ..iskAraDeger2 = (json['ISK_ARA_DEGER2'] as num?)?.toDouble()
      ..iskAraDeger3 = (json['ISK_ARA_DEGER3'] as num?)?.toDouble()
      ..iskAraHangiIsk = (json['ISK_ARA_HANGI_ISK'] as num?)?.toDouble()
      ..iskAraIsk1 = (json['ISK_ARA_ISK1'] as num?)?.toDouble()
      ..iskAraIsk2 = (json['ISK_ARA_ISK2'] as num?)?.toDouble()
      ..iskAraIsk3 = (json['ISK_ARA_ISK3'] as num?)?.toDouble();

Map<String, dynamic> _$CariKosullarModelToJson(CariKosullarModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('KOSUL_SABIT_ADI', instance.kosulSabitAdi);
  writeNotNull('KOSUL_KODU', instance.kosulKodu);
  writeNotNull('GENISK1_O', instance.genisk1O);
  writeNotNull('GENISK2_O', instance.genisk2O);
  writeNotNull('GENISK3_O', instance.genisk3O);
  writeNotNull('GENEL_KOSUL_ADI', instance.genelKosulAdi);
  writeNotNull('BASLANGICTAR', instance.baslangictar);
  writeNotNull('VADE_GUNU', instance.vadeGunu);
  writeNotNull('GENISK1_TIPI', instance.genisk1Tipi);
  writeNotNull('GENISK2_TIPI', instance.genisk2Tipi);
  writeNotNull('GENISK3_TIPI', instance.genisk3Tipi);
  writeNotNull('SATISK1_TIPI', instance.satisk1Tipi);
  writeNotNull('SATISK2_TIPI', instance.satisk2Tipi);
  writeNotNull('SATISK3_TIPI', instance.satisk3Tipi);
  writeNotNull('SATISK4_TIPI', instance.satisk4Tipi);
  writeNotNull('SATISK5_TIPI', instance.satisk5Tipi);
  writeNotNull('SATISK6_TIPI', instance.satisk6Tipi);
  writeNotNull('ISK_ARA_AKTIF', instance.iskAraAktif);
  writeNotNull('ISK_ARA_MIKTUT', instance.iskAraMiktut);
  writeNotNull('ISK_ARA_DEGER1', instance.iskAraDeger1);
  writeNotNull('ISK_ARA_DEGER2', instance.iskAraDeger2);
  writeNotNull('ISK_ARA_DEGER3', instance.iskAraDeger3);
  writeNotNull('ISK_ARA_HANGI_ISK', instance.iskAraHangiIsk);
  writeNotNull('ISK_ARA_ISK1', instance.iskAraIsk1);
  writeNotNull('ISK_ARA_ISK2', instance.iskAraIsk2);
  writeNotNull('ISK_ARA_ISK3', instance.iskAraIsk3);
  return val;
}
