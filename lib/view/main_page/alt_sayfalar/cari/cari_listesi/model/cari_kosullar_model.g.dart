// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cari_kosullar_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CariKosullarModel _$CariKosullarModelFromJson(Map<String, dynamic> json) =>
    CariKosullarModel()
      ..kosulSabitAdi = json['KOSUL_SABIT_ADI'] as String?
      ..kosulKodu = json['KOSUL_KODU'] as String?
      ..genisk1O = (json['GENISK1_O'] as num?)?.toInt()
      ..genisk2O = (json['GENISK2_O'] as num?)?.toInt()
      ..genisk3O = (json['GENISK3_O'] as num?)?.toInt()
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
      ..iskAraIsk3 = (json['ISK_ARA_ISK3'] as num?)?.toDouble();

Map<String, dynamic> _$CariKosullarModelToJson(CariKosullarModel instance) => <String, dynamic>{
  if (instance.kosulSabitAdi case final value?) 'KOSUL_SABIT_ADI': value,
  if (instance.kosulKodu case final value?) 'KOSUL_KODU': value,
  if (instance.genisk1O case final value?) 'GENISK1_O': value,
  if (instance.genisk2O case final value?) 'GENISK2_O': value,
  if (instance.genisk3O case final value?) 'GENISK3_O': value,
  if (instance.genelKosulAdi case final value?) 'GENEL_KOSUL_ADI': value,
  if (instance.baslangictar case final value?) 'BASLANGICTAR': value,
  if (instance.vadeGunu case final value?) 'VADE_GUNU': value,
  if (instance.genisk1Tipi case final value?) 'GENISK1_TIPI': value,
  if (instance.genisk2Tipi case final value?) 'GENISK2_TIPI': value,
  if (instance.genisk3Tipi case final value?) 'GENISK3_TIPI': value,
  if (instance.satisk1Tipi case final value?) 'SATISK1_TIPI': value,
  if (instance.satisk2Tipi case final value?) 'SATISK2_TIPI': value,
  if (instance.satisk3Tipi case final value?) 'SATISK3_TIPI': value,
  if (instance.satisk4Tipi case final value?) 'SATISK4_TIPI': value,
  if (instance.satisk5Tipi case final value?) 'SATISK5_TIPI': value,
  if (instance.satisk6Tipi case final value?) 'SATISK6_TIPI': value,
  if (instance.iskAraAktif case final value?) 'ISK_ARA_AKTIF': value,
  if (instance.iskAraMiktut case final value?) 'ISK_ARA_MIKTUT': value,
  if (instance.iskAraDeger1 case final value?) 'ISK_ARA_DEGER1': value,
  if (instance.iskAraDeger2 case final value?) 'ISK_ARA_DEGER2': value,
  if (instance.iskAraDeger3 case final value?) 'ISK_ARA_DEGER3': value,
  if (instance.iskAraHangiIsk case final value?) 'ISK_ARA_HANGI_ISK': value,
  if (instance.iskAraIsk1 case final value?) 'ISK_ARA_ISK1': value,
  if (instance.iskAraIsk2 case final value?) 'ISK_ARA_ISK2': value,
  if (instance.iskAraIsk3 case final value?) 'ISK_ARA_ISK3': value,
};
