// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stok_listesi_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StokListAdapter extends TypeAdapter<StokList> {
  @override
  final int typeId = 2;

  @override
  StokList read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return StokList(
      stokKodu: fields[10] as String?,
      stokAdi: fields[8] as String?,
      alisKdv: fields[0] as double?,
      satisKdv: fields[7] as double?,
      stokFiyatList: (fields[9] as List?)?.cast<dynamic>(),
      stokList: (fields[11] as List?)?.cast<dynamic>(),
      bulunanFiyat: fields[1] as double?,
      paketMi: fields[6] as String?,
      koliBilesenMiktari: fields[4] as double?,
      koliBilesenOrani: fields[5] as double?,
      koliBilesenFiyatorandan: fields[2] as String?,
      koliBilesenKolikdv: fields[3] as String?,
      depoKodu: fields[12] as int?,
      bakiye: fields[13] as double?,
    )
      ..muhdetayAdi = fields[14] as String?
      ..alisFiat1 = fields[15] as double?
      ..alisFiat2 = fields[16] as double?
      ..alisFiat3 = fields[17] as double?
      ..alisFiat4 = fields[18] as double?
      ..satisFiat1 = fields[19] as double?
      ..satisFiat2 = fields[20] as double?
      ..satisFiat3 = fields[21] as double?
      ..satisFiat4 = fields[22] as double?
      ..olcuBirimi = fields[23] as String?
      ..olcuBirimi2 = fields[24] as String?
      ..olcuBirimi3 = fields[25] as String?
      ..olcuBirimi2Pay = fields[26] as double?
      ..olcuBirimi2Payda = fields[27] as double?
      ..olcuBirimi3Pay = fields[28] as double?
      ..olcuBirimi3Payda = fields[29] as double?
      ..barkod1 = fields[30] as String?
      ..barkod2 = fields[31] as String?
      ..barkod3 = fields[32] as String?
      ..kayityapankul = fields[33] as String?
      ..kayittarihi = fields[34] as DateTime?
      ..grupKodu = fields[35] as String?
      ..grupTanimi = fields[36] as String?
      ..kod1 = fields[37] as String?
      ..kod1Tanimi = fields[38] as String?
      ..kod2 = fields[39] as String?
      ..kod2Tanimi = fields[40] as String?
      ..kod3 = fields[41] as String?
      ..kod3Tanimi = fields[42] as String?
      ..kod4 = fields[43] as String?
      ..kod4Tanimi = fields[44] as String?
      ..kod5 = fields[45] as String?
      ..kod5Tanimi = fields[46] as String?
      ..seriCikislardaAcik = fields[47] as bool?
      ..seriGirislerdeAcik = fields[48] as bool?
      ..seriMiktarKadarSor = fields[49] as bool?
      ..seriBakiyeKontrolu = fields[50] as bool?
      ..seriGiristeOtomatikMi = fields[51] as bool?
      ..seriCikistaOtomatikMi = fields[52] as bool?
      ..duzeltmetarihi = fields[53] as DateTime?
      ..duzeltmeyapankul = fields[54] as String?
      ..fiatBirimi = fields[55] as int?
      ..kilitGenel = fields[56] as String?
      ..kilitSaticisip = fields[57] as String?
      ..kilitMussip = fields[58] as String?
      ..kilitAlis = fields[59] as String?
      ..kilitSatis = fields[60] as String?
      ..subeKodu = fields[61] as int?
      ..muhdetayKodu = fields[62] as int?
      ..alisDovTip = fields[63] as int?
      ..dovAlisFiat = fields[64] as double?
      ..alisDovizAdi = fields[65] as String?
      ..satDovTip = fields[66] as int?
      ..dovSatisFiat = fields[67] as double?
      ..satisDovizAdi = fields[68] as String?
      ..ureticiKodu = fields[69] as String?
      ..birimAgirlik = fields[70] as double?;
  }

  @override
  void write(BinaryWriter writer, StokList obj) {
    writer
      ..writeByte(71)
      ..writeByte(0)
      ..write(obj.alisKdv)
      ..writeByte(1)
      ..write(obj.bulunanFiyat)
      ..writeByte(2)
      ..write(obj.koliBilesenFiyatorandan)
      ..writeByte(3)
      ..write(obj.koliBilesenKolikdv)
      ..writeByte(4)
      ..write(obj.koliBilesenMiktari)
      ..writeByte(5)
      ..write(obj.koliBilesenOrani)
      ..writeByte(6)
      ..write(obj.paketMi)
      ..writeByte(7)
      ..write(obj.satisKdv)
      ..writeByte(8)
      ..write(obj.stokAdi)
      ..writeByte(9)
      ..write(obj.stokFiyatList)
      ..writeByte(10)
      ..write(obj.stokKodu)
      ..writeByte(11)
      ..write(obj.stokList)
      ..writeByte(12)
      ..write(obj.depoKodu)
      ..writeByte(13)
      ..write(obj.bakiye)
      ..writeByte(14)
      ..write(obj.muhdetayAdi)
      ..writeByte(15)
      ..write(obj.alisFiat1)
      ..writeByte(16)
      ..write(obj.alisFiat2)
      ..writeByte(17)
      ..write(obj.alisFiat3)
      ..writeByte(18)
      ..write(obj.alisFiat4)
      ..writeByte(19)
      ..write(obj.satisFiat1)
      ..writeByte(20)
      ..write(obj.satisFiat2)
      ..writeByte(21)
      ..write(obj.satisFiat3)
      ..writeByte(22)
      ..write(obj.satisFiat4)
      ..writeByte(23)
      ..write(obj.olcuBirimi)
      ..writeByte(24)
      ..write(obj.olcuBirimi2)
      ..writeByte(25)
      ..write(obj.olcuBirimi3)
      ..writeByte(26)
      ..write(obj.olcuBirimi2Pay)
      ..writeByte(27)
      ..write(obj.olcuBirimi2Payda)
      ..writeByte(28)
      ..write(obj.olcuBirimi3Pay)
      ..writeByte(29)
      ..write(obj.olcuBirimi3Payda)
      ..writeByte(30)
      ..write(obj.barkod1)
      ..writeByte(31)
      ..write(obj.barkod2)
      ..writeByte(32)
      ..write(obj.barkod3)
      ..writeByte(33)
      ..write(obj.kayityapankul)
      ..writeByte(34)
      ..write(obj.kayittarihi)
      ..writeByte(35)
      ..write(obj.grupKodu)
      ..writeByte(36)
      ..write(obj.grupTanimi)
      ..writeByte(37)
      ..write(obj.kod1)
      ..writeByte(38)
      ..write(obj.kod1Tanimi)
      ..writeByte(39)
      ..write(obj.kod2)
      ..writeByte(40)
      ..write(obj.kod2Tanimi)
      ..writeByte(41)
      ..write(obj.kod3)
      ..writeByte(42)
      ..write(obj.kod3Tanimi)
      ..writeByte(43)
      ..write(obj.kod4)
      ..writeByte(44)
      ..write(obj.kod4Tanimi)
      ..writeByte(45)
      ..write(obj.kod5)
      ..writeByte(46)
      ..write(obj.kod5Tanimi)
      ..writeByte(47)
      ..write(obj.seriCikislardaAcik)
      ..writeByte(48)
      ..write(obj.seriGirislerdeAcik)
      ..writeByte(49)
      ..write(obj.seriMiktarKadarSor)
      ..writeByte(50)
      ..write(obj.seriBakiyeKontrolu)
      ..writeByte(51)
      ..write(obj.seriGiristeOtomatikMi)
      ..writeByte(52)
      ..write(obj.seriCikistaOtomatikMi)
      ..writeByte(53)
      ..write(obj.duzeltmetarihi)
      ..writeByte(54)
      ..write(obj.duzeltmeyapankul)
      ..writeByte(55)
      ..write(obj.fiatBirimi)
      ..writeByte(56)
      ..write(obj.kilitGenel)
      ..writeByte(57)
      ..write(obj.kilitSaticisip)
      ..writeByte(58)
      ..write(obj.kilitMussip)
      ..writeByte(59)
      ..write(obj.kilitAlis)
      ..writeByte(60)
      ..write(obj.kilitSatis)
      ..writeByte(61)
      ..write(obj.subeKodu)
      ..writeByte(62)
      ..write(obj.muhdetayKodu)
      ..writeByte(63)
      ..write(obj.alisDovTip)
      ..writeByte(64)
      ..write(obj.dovAlisFiat)
      ..writeByte(65)
      ..write(obj.alisDovizAdi)
      ..writeByte(66)
      ..write(obj.satDovTip)
      ..writeByte(67)
      ..write(obj.dovSatisFiat)
      ..writeByte(68)
      ..write(obj.satisDovizAdi)
      ..writeByte(69)
      ..write(obj.ureticiKodu)
      ..writeByte(70)
      ..write(obj.birimAgirlik);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StokListAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StokListesiModel _$StokListesiModelFromJson(Map<String, dynamic> json) =>
    StokListesiModel()
      ..seriBakiyeKontrolu = json['SERI_BAKIYE_KONTROLU'] as bool?
      ..seriCikislardaAcik = json['SERI_CIKISLARDA_ACIK'] as bool?
      ..seriCikistaOtomatikMi = json['SERI_CIKISTA_OTOMATIK_MI'] as bool?
      ..seriGirislerdeAcik = json['SERI_GIRISLERDE_ACIK'] as bool?
      ..seriGiristeOtomatikMi = json['SERI_GIRISTE_OTOMATIK_MI'] as bool?
      ..seriMiktarKadarSor = json['SERI_MIKTAR_KADAR_SOR'] as bool?
      ..duzeltmetarihi = json['DUZELTMETARIHI'] == null
          ? null
          : DateTime.parse(json['DUZELTMETARIHI'] as String)
      ..alisFiat1 = (json['ALIS_FIAT1'] as num?)?.toDouble()
      ..alisFiat2 = (json['ALIS_FIAT2'] as num?)?.toDouble()
      ..alisFiat3 = (json['ALIS_FIAT3'] as num?)?.toDouble()
      ..alisFiat4 = (json['ALIS_FIAT4'] as num?)?.toDouble()
      ..alisKdv = (json['ALIS_KDV'] as num?)?.toDouble()
      ..bakiye = (json['BAKIYE'] as num?)?.toDouble()
      ..birimAgirlik = (json['BIRIM_AGIRLIK'] as num?)?.toDouble()
      ..dovAlisFiat = (json['DOV_ALIS_FIAT'] as num?)?.toDouble()
      ..dovSatisFiat = (json['DOV_SATIS_FIAT'] as num?)?.toDouble()
      ..olcuBirimi2Pay = (json['OLCU_BIRIMI2_PAY'] as num?)?.toDouble()
      ..olcuBirimi2Payda = (json['OLCU_BIRIMI2_PAYDA'] as num?)?.toDouble()
      ..olcuBirimi3Pay = (json['OLCU_BIRIMI3_PAY'] as num?)?.toDouble()
      ..olcuBirimi3Payda = (json['OLCU_BIRIMI3_PAYDA'] as num?)?.toDouble()
      ..satisFiat1 = (json['SATIS_FIAT1'] as num?)?.toDouble()
      ..satisFiat2 = (json['SATIS_FIAT2'] as num?)?.toDouble()
      ..satisFiat3 = (json['SATIS_FIAT3'] as num?)?.toDouble()
      ..satisFiat4 = (json['SATIS_FIAT4'] as num?)?.toDouble()
      ..satisKdv = (json['SATIS_KDV'] as num?)?.toDouble()
      ..alisDovTip = json['ALIS_DOV_TIP'] as int?
      ..bulunanFiyat = (json['BULUNAN_FIYAT'] as num?)?.toDouble()
      ..depoKodu = json['DEPO_KODU'] as int?
      ..fiatBirimi = json['FIAT_BIRIMI'] as int?
      ..muhdetayKodu = json['MUHDETAY_KODU'] as int?
      ..satDovTip = json['SAT_DOV_TIP'] as int?
      ..subeKodu = json['SUBE_KODU'] as int?
      ..stokFiyatList = json['STOK_FIYAT_LIST'] as List<dynamic>?
      ..stokList = (json['STOK_LIST'] as List<dynamic>?)
          ?.map((e) => StokList.fromJson(e as Map<String, dynamic>))
          .toList()
      ..alisDovizAdi = json['ALIS_DOVIZ_ADI'] as String?
      ..barkod1 = json['BARKOD1'] as String?
      ..barkod2 = json['BARKOD2'] as String?
      ..barkod3 = json['BARKOD3'] as String?
      ..duzeltmeyapankul = json['DUZELTMEYAPANKUL'] as String?
      ..grupKodu = json['GRUP_KODU'] as String?
      ..grupTanimi = json['GRUP_TANIMI'] as String?
      ..kayittarihi = json['KAYITTARIHI'] as String?
      ..kayityapankul = json['KAYITYAPANKUL'] as String?
      ..kilitAlis = json['KILIT_ALIS'] as String?
      ..kilitGenel = json['KILIT_GENEL'] as String?
      ..kilitMussip = json['KILIT_MUSSIP'] as String?
      ..kilitSaticisip = json['KILIT_SATICISIP'] as String?
      ..kilitSatis = json['KILIT_SATIS'] as String?
      ..kod1 = json['KOD1'] as String?
      ..kod1Tanimi = json['KOD1_TANIMI'] as String?
      ..kod2 = json['KOD2'] as String?
      ..kod2Tanimi = json['KOD2_TANIMI'] as String?
      ..kod3 = json['KOD3'] as String?
      ..kod3Tanimi = json['KOD3_TANIMI'] as String?
      ..kod4 = json['KOD4'] as String?
      ..kod4Tanimi = json['KOD4_TANIMI'] as String?
      ..kod5 = json['KOD5'] as String?
      ..kod5Tanimi = json['KOD5_TANIMI'] as String?
      ..muhdetayAdi = json['MUHDETAY_ADI'] as String?
      ..olcuBirimi = json['OLCU_BIRIMI'] as String?
      ..olcuBirimi2 = json['OLCU_BIRIMI2'] as String?
      ..olcuBirimi3 = json['OLCU_BIRIMI3'] as String?
      ..paketMi = json['PAKET_MI'] as String?
      ..resimBase64 = json['RESIM_BASE64'] as String?
      ..resimUrl = json['RESIM_URL'] as String?
      ..resimUrlKucuk = json['RESIM_URL_KUCUK'] as String?
      ..satisDovizAdi = json['SATIS_DOVIZ_ADI'] as String?
      ..stokAdi = json['STOK_ADI'] as String?
      ..stokKodu = json['STOK_KODU'] as String?
      ..ureticiKodu = json['URETICI_KODU'] as String?
      ..yapilandirmaAktif = json['YAPILANDIRMA_AKTIF'] as bool?;

Map<String, dynamic> _$StokListesiModelToJson(StokListesiModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('SERI_BAKIYE_KONTROLU', instance.seriBakiyeKontrolu);
  writeNotNull('SERI_CIKISLARDA_ACIK', instance.seriCikislardaAcik);
  writeNotNull('SERI_CIKISTA_OTOMATIK_MI', instance.seriCikistaOtomatikMi);
  writeNotNull('SERI_GIRISLERDE_ACIK', instance.seriGirislerdeAcik);
  writeNotNull('SERI_GIRISTE_OTOMATIK_MI', instance.seriGiristeOtomatikMi);
  writeNotNull('SERI_MIKTAR_KADAR_SOR', instance.seriMiktarKadarSor);
  writeNotNull('DUZELTMETARIHI', instance.duzeltmetarihi?.toIso8601String());
  writeNotNull('ALIS_FIAT1', instance.alisFiat1);
  writeNotNull('ALIS_FIAT2', instance.alisFiat2);
  writeNotNull('ALIS_FIAT3', instance.alisFiat3);
  writeNotNull('ALIS_FIAT4', instance.alisFiat4);
  writeNotNull('ALIS_KDV', instance.alisKdv);
  writeNotNull('BAKIYE', instance.bakiye);
  writeNotNull('BIRIM_AGIRLIK', instance.birimAgirlik);
  writeNotNull('DOV_ALIS_FIAT', instance.dovAlisFiat);
  writeNotNull('DOV_SATIS_FIAT', instance.dovSatisFiat);
  writeNotNull('OLCU_BIRIMI2_PAY', instance.olcuBirimi2Pay);
  writeNotNull('OLCU_BIRIMI2_PAYDA', instance.olcuBirimi2Payda);
  writeNotNull('OLCU_BIRIMI3_PAY', instance.olcuBirimi3Pay);
  writeNotNull('OLCU_BIRIMI3_PAYDA', instance.olcuBirimi3Payda);
  writeNotNull('SATIS_FIAT1', instance.satisFiat1);
  writeNotNull('SATIS_FIAT2', instance.satisFiat2);
  writeNotNull('SATIS_FIAT3', instance.satisFiat3);
  writeNotNull('SATIS_FIAT4', instance.satisFiat4);
  writeNotNull('SATIS_KDV', instance.satisKdv);
  writeNotNull('ALIS_DOV_TIP', instance.alisDovTip);
  writeNotNull('BULUNAN_FIYAT', instance.bulunanFiyat);
  writeNotNull('DEPO_KODU', instance.depoKodu);
  writeNotNull('FIAT_BIRIMI', instance.fiatBirimi);
  writeNotNull('MUHDETAY_KODU', instance.muhdetayKodu);
  writeNotNull('SAT_DOV_TIP', instance.satDovTip);
  writeNotNull('SUBE_KODU', instance.subeKodu);
  writeNotNull('STOK_FIYAT_LIST', instance.stokFiyatList);
  writeNotNull('STOK_LIST', instance.stokList?.map((e) => e.toJson()).toList());
  writeNotNull('ALIS_DOVIZ_ADI', instance.alisDovizAdi);
  writeNotNull('BARKOD1', instance.barkod1);
  writeNotNull('BARKOD2', instance.barkod2);
  writeNotNull('BARKOD3', instance.barkod3);
  writeNotNull('DUZELTMEYAPANKUL', instance.duzeltmeyapankul);
  writeNotNull('GRUP_KODU', instance.grupKodu);
  writeNotNull('GRUP_TANIMI', instance.grupTanimi);
  writeNotNull('KAYITTARIHI', instance.kayittarihi);
  writeNotNull('KAYITYAPANKUL', instance.kayityapankul);
  writeNotNull('KILIT_ALIS', instance.kilitAlis);
  writeNotNull('KILIT_GENEL', instance.kilitGenel);
  writeNotNull('KILIT_MUSSIP', instance.kilitMussip);
  writeNotNull('KILIT_SATICISIP', instance.kilitSaticisip);
  writeNotNull('KILIT_SATIS', instance.kilitSatis);
  writeNotNull('KOD1', instance.kod1);
  writeNotNull('KOD1_TANIMI', instance.kod1Tanimi);
  writeNotNull('KOD2', instance.kod2);
  writeNotNull('KOD2_TANIMI', instance.kod2Tanimi);
  writeNotNull('KOD3', instance.kod3);
  writeNotNull('KOD3_TANIMI', instance.kod3Tanimi);
  writeNotNull('KOD4', instance.kod4);
  writeNotNull('KOD4_TANIMI', instance.kod4Tanimi);
  writeNotNull('KOD5', instance.kod5);
  writeNotNull('KOD5_TANIMI', instance.kod5Tanimi);
  writeNotNull('MUHDETAY_ADI', instance.muhdetayAdi);
  writeNotNull('OLCU_BIRIMI', instance.olcuBirimi);
  writeNotNull('OLCU_BIRIMI2', instance.olcuBirimi2);
  writeNotNull('OLCU_BIRIMI3', instance.olcuBirimi3);
  writeNotNull('PAKET_MI', instance.paketMi);
  writeNotNull('RESIM_BASE64', instance.resimBase64);
  writeNotNull('RESIM_URL', instance.resimUrl);
  writeNotNull('RESIM_URL_KUCUK', instance.resimUrlKucuk);
  writeNotNull('SATIS_DOVIZ_ADI', instance.satisDovizAdi);
  writeNotNull('STOK_ADI', instance.stokAdi);
  writeNotNull('STOK_KODU', instance.stokKodu);
  writeNotNull('URETICI_KODU', instance.ureticiKodu);
  writeNotNull('YAPILANDIRMA_AKTIF', instance.yapilandirmaAktif);
  return val;
}

StokList _$StokListFromJson(Map<String, dynamic> json) => StokList(
      stokKodu: json['STOK_KODU'] as String?,
      stokAdi: json['STOK_ADI'] as String?,
      alisKdv: (json['ALIS_KDV'] as num?)?.toDouble(),
      satisKdv: (json['SATIS_KDV'] as num?)?.toDouble(),
      stokFiyatList: json['STOK_FIYAT_LIST'] as List<dynamic>?,
      stokList: json['STOK_LIST'] as List<dynamic>?,
      bulunanFiyat: (json['BULUNAN_FIYAT'] as num?)?.toDouble(),
      paketMi: json['PAKET_MI'] as String?,
      koliBilesenMiktari: (json['KOLI_BILESEN_MIKTARI'] as num?)?.toDouble(),
      koliBilesenOrani: (json['KOLI_BILESEN_ORANI'] as num?)?.toDouble(),
      koliBilesenFiyatorandan: json['KOLI_BILESEN_FIYATORANDAN'] as String?,
      koliBilesenKolikdv: json['KOLI_BILESEN_KOLIKDV'] as String?,
      depoKodu: json['DEPO_KODU'] as int?,
      bakiye: (json['BAKIYE'] as num?)?.toDouble(),
    )
      ..muhdetayAdi = json['MUHDETAY_ADI'] as String?
      ..alisFiat1 = (json['ALIS_FIAT1'] as num?)?.toDouble()
      ..alisFiat2 = (json['ALIS_FIAT2'] as num?)?.toDouble()
      ..alisFiat3 = (json['ALIS_FIAT3'] as num?)?.toDouble()
      ..alisFiat4 = (json['ALIS_FIAT4'] as num?)?.toDouble()
      ..satisFiat1 = (json['SATIS_FIAT1'] as num?)?.toDouble()
      ..satisFiat2 = (json['SATIS_FIAT2'] as num?)?.toDouble()
      ..satisFiat3 = (json['SATIS_FIAT3'] as num?)?.toDouble()
      ..satisFiat4 = (json['SATIS_FIAT4'] as num?)?.toDouble()
      ..olcuBirimi = json['OLCU_BIRIMI'] as String?
      ..olcuBirimi2 = json['OLCU_BIRIMI2'] as String?
      ..olcuBirimi3 = json['OLCU_BIRIMI3'] as String?
      ..olcuBirimi2Pay = (json['OLCU_BIRIMI2_PAY'] as num?)?.toDouble()
      ..olcuBirimi2Payda = (json['OLCU_BIRIMI2_PAYDA'] as num?)?.toDouble()
      ..olcuBirimi3Pay = (json['OLCU_BIRIMI3_PAY'] as num?)?.toDouble()
      ..olcuBirimi3Payda = (json['OLCU_BIRIMI3_PAYDA'] as num?)?.toDouble()
      ..barkod1 = json['BARKOD1'] as String?
      ..barkod2 = json['BARKOD2'] as String?
      ..barkod3 = json['BARKOD3'] as String?
      ..kayityapankul = json['KAYITYAPANKUL'] as String?
      ..kayittarihi = json['KAYITTARIHI'] == null
          ? null
          : DateTime.parse(json['KAYITTARIHI'] as String)
      ..grupKodu = json['GRUP_KODU'] as String?
      ..grupTanimi = json['GRUP_TANIMI'] as String?
      ..kod1 = json['KOD1'] as String?
      ..kod1Tanimi = json['KOD1_TANIMI'] as String?
      ..kod2 = json['KOD2'] as String?
      ..kod2Tanimi = json['KOD2_TANIMI'] as String?
      ..kod3 = json['KOD3'] as String?
      ..kod3Tanimi = json['KOD3_TANIMI'] as String?
      ..kod4 = json['KOD4'] as String?
      ..kod4Tanimi = json['KOD4_TANIMI'] as String?
      ..kod5 = json['KOD5'] as String?
      ..kod5Tanimi = json['KOD5_TANIMI'] as String?
      ..seriCikislardaAcik = json['SERI_CIKISLARDA_ACIK'] as bool?
      ..seriGirislerdeAcik = json['SERI_GIRISLERDE_ACIK'] as bool?
      ..seriMiktarKadarSor = json['SERI_MIKTAR_KADAR_SOR'] as bool?
      ..seriBakiyeKontrolu = json['SERI_BAKIYE_KONTROLU'] as bool?
      ..seriGiristeOtomatikMi = json['SERI_GIRISTE_OTOMATIK_MI'] as bool?
      ..seriCikistaOtomatikMi = json['SERI_CIKISTA_OTOMATIK_MI'] as bool?
      ..duzeltmetarihi = json['DUZELTMETARIHI'] == null
          ? null
          : DateTime.parse(json['DUZELTMETARIHI'] as String)
      ..duzeltmeyapankul = json['DUZELTMEYAPANKUL'] as String?
      ..fiatBirimi = json['FIAT_BIRIMI'] as int?
      ..kilitGenel = json['KILIT_GENEL'] as String?
      ..kilitSaticisip = json['KILIT_SATICISIP'] as String?
      ..kilitMussip = json['KILIT_MUSSIP'] as String?
      ..kilitAlis = json['KILIT_ALIS'] as String?
      ..kilitSatis = json['KILIT_SATIS'] as String?
      ..subeKodu = json['SUBE_KODU'] as int?
      ..muhdetayKodu = json['MUHDETAY_KODU'] as int?
      ..alisDovTip = json['ALIS_DOV_TIP'] as int?
      ..dovAlisFiat = (json['DOV_ALIS_FIAT'] as num?)?.toDouble()
      ..alisDovizAdi = json['ALIS_DOVIZ_ADI'] as String?
      ..satDovTip = json['SAT_DOV_TIP'] as int?
      ..dovSatisFiat = (json['DOV_SATIS_FIAT'] as num?)?.toDouble()
      ..satisDovizAdi = json['SATIS_DOVIZ_ADI'] as String?
      ..ureticiKodu = json['URETICI_KODU'] as String?
      ..birimAgirlik = (json['BIRIM_AGIRLIK'] as num?)?.toDouble();

Map<String, dynamic> _$StokListToJson(StokList instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ALIS_KDV', instance.alisKdv);
  writeNotNull('BULUNAN_FIYAT', instance.bulunanFiyat);
  writeNotNull('KOLI_BILESEN_FIYATORANDAN', instance.koliBilesenFiyatorandan);
  writeNotNull('KOLI_BILESEN_KOLIKDV', instance.koliBilesenKolikdv);
  writeNotNull('KOLI_BILESEN_MIKTARI', instance.koliBilesenMiktari);
  writeNotNull('KOLI_BILESEN_ORANI', instance.koliBilesenOrani);
  writeNotNull('PAKET_MI', instance.paketMi);
  writeNotNull('SATIS_KDV', instance.satisKdv);
  writeNotNull('STOK_ADI', instance.stokAdi);
  writeNotNull('STOK_FIYAT_LIST', instance.stokFiyatList);
  writeNotNull('STOK_KODU', instance.stokKodu);
  writeNotNull('STOK_LIST', instance.stokList);
  writeNotNull('DEPO_KODU', instance.depoKodu);
  writeNotNull('BAKIYE', instance.bakiye);
  writeNotNull('MUHDETAY_ADI', instance.muhdetayAdi);
  writeNotNull('ALIS_FIAT1', instance.alisFiat1);
  writeNotNull('ALIS_FIAT2', instance.alisFiat2);
  writeNotNull('ALIS_FIAT3', instance.alisFiat3);
  writeNotNull('ALIS_FIAT4', instance.alisFiat4);
  writeNotNull('SATIS_FIAT1', instance.satisFiat1);
  writeNotNull('SATIS_FIAT2', instance.satisFiat2);
  writeNotNull('SATIS_FIAT3', instance.satisFiat3);
  writeNotNull('SATIS_FIAT4', instance.satisFiat4);
  writeNotNull('OLCU_BIRIMI', instance.olcuBirimi);
  writeNotNull('OLCU_BIRIMI2', instance.olcuBirimi2);
  writeNotNull('OLCU_BIRIMI3', instance.olcuBirimi3);
  writeNotNull('OLCU_BIRIMI2_PAY', instance.olcuBirimi2Pay);
  writeNotNull('OLCU_BIRIMI2_PAYDA', instance.olcuBirimi2Payda);
  writeNotNull('OLCU_BIRIMI3_PAY', instance.olcuBirimi3Pay);
  writeNotNull('OLCU_BIRIMI3_PAYDA', instance.olcuBirimi3Payda);
  writeNotNull('BARKOD1', instance.barkod1);
  writeNotNull('BARKOD2', instance.barkod2);
  writeNotNull('BARKOD3', instance.barkod3);
  writeNotNull('KAYITYAPANKUL', instance.kayityapankul);
  writeNotNull('KAYITTARIHI', instance.kayittarihi?.toIso8601String());
  writeNotNull('GRUP_KODU', instance.grupKodu);
  writeNotNull('GRUP_TANIMI', instance.grupTanimi);
  writeNotNull('KOD1', instance.kod1);
  writeNotNull('KOD1_TANIMI', instance.kod1Tanimi);
  writeNotNull('KOD2', instance.kod2);
  writeNotNull('KOD2_TANIMI', instance.kod2Tanimi);
  writeNotNull('KOD3', instance.kod3);
  writeNotNull('KOD3_TANIMI', instance.kod3Tanimi);
  writeNotNull('KOD4', instance.kod4);
  writeNotNull('KOD4_TANIMI', instance.kod4Tanimi);
  writeNotNull('KOD5', instance.kod5);
  writeNotNull('KOD5_TANIMI', instance.kod5Tanimi);
  writeNotNull('SERI_CIKISLARDA_ACIK', instance.seriCikislardaAcik);
  writeNotNull('SERI_GIRISLERDE_ACIK', instance.seriGirislerdeAcik);
  writeNotNull('SERI_MIKTAR_KADAR_SOR', instance.seriMiktarKadarSor);
  writeNotNull('SERI_BAKIYE_KONTROLU', instance.seriBakiyeKontrolu);
  writeNotNull('SERI_GIRISTE_OTOMATIK_MI', instance.seriGiristeOtomatikMi);
  writeNotNull('SERI_CIKISTA_OTOMATIK_MI', instance.seriCikistaOtomatikMi);
  writeNotNull('DUZELTMETARIHI', instance.duzeltmetarihi?.toIso8601String());
  writeNotNull('DUZELTMEYAPANKUL', instance.duzeltmeyapankul);
  writeNotNull('FIAT_BIRIMI', instance.fiatBirimi);
  writeNotNull('KILIT_GENEL', instance.kilitGenel);
  writeNotNull('KILIT_SATICISIP', instance.kilitSaticisip);
  writeNotNull('KILIT_MUSSIP', instance.kilitMussip);
  writeNotNull('KILIT_ALIS', instance.kilitAlis);
  writeNotNull('KILIT_SATIS', instance.kilitSatis);
  writeNotNull('SUBE_KODU', instance.subeKodu);
  writeNotNull('MUHDETAY_KODU', instance.muhdetayKodu);
  writeNotNull('ALIS_DOV_TIP', instance.alisDovTip);
  writeNotNull('DOV_ALIS_FIAT', instance.dovAlisFiat);
  writeNotNull('ALIS_DOVIZ_ADI', instance.alisDovizAdi);
  writeNotNull('SAT_DOV_TIP', instance.satDovTip);
  writeNotNull('DOV_SATIS_FIAT', instance.dovSatisFiat);
  writeNotNull('SATIS_DOVIZ_ADI', instance.satisDovizAdi);
  writeNotNull('URETICI_KODU', instance.ureticiKodu);
  writeNotNull('BIRIM_AGIRLIK', instance.birimAgirlik);
  return val;
}
