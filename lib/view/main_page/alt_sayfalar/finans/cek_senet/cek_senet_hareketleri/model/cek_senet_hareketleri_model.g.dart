// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cek_senet_hareketleri_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CekSenetHareketleriModelImpl _$$CekSenetHareketleriModelImplFromJson(Map<String, dynamic> json) => _$CekSenetHareketleriModelImpl(
      inckeyno: json['INCKEYNO'] as int?,
      belgeTipi: json['BELGE_TIPI'] as String?,
      belgeNo: json['BELGE_NO'] as String?,
      yeri: json['YERI'] as String?,
      durum: json['DURUM'] as String?,
      tarih: json['TARIH'] == null ? null : DateTime.parse(json['TARIH'] as String),
      hesapKodu: json['HESAP_KODU'] as String?,
      islemKodu: json['ISLEM_KODU'] as int?,
      islemAdi: json['ISLEM_ADI'] as String?,
      alinanBordroNo: json['ALINAN_BORDRO_NO'] as String?,
      devir: json['DEVIR'] as String?,
      nereye: json['NEREYE'] as String?,
      kayityapankul: json['KAYITYAPANKUL'] as String?,
      kayittarihi: json['KAYITTARIHI'] as String?,
    );

Map<String, dynamic> _$$CekSenetHareketleriModelImplToJson(_$CekSenetHareketleriModelImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('INCKEYNO', instance.inckeyno);
  writeNotNull('BELGE_TIPI', instance.belgeTipi);
  writeNotNull('BELGE_NO', instance.belgeNo);
  writeNotNull('YERI', instance.yeri);
  writeNotNull('DURUM', instance.durum);
  writeNotNull('TARIH', instance.tarih?.toIso8601String());
  writeNotNull('HESAP_KODU', instance.hesapKodu);
  writeNotNull('ISLEM_KODU', instance.islemKodu);
  writeNotNull('ISLEM_ADI', instance.islemAdi);
  writeNotNull('ALINAN_BORDRO_NO', instance.alinanBordroNo);
  writeNotNull('DEVIR', instance.devir);
  writeNotNull('NEREYE', instance.nereye);
  writeNotNull('KAYITYAPANKUL', instance.kayityapankul);
  writeNotNull('KAYITTARIHI', instance.kayittarihi);
  return val;
}
