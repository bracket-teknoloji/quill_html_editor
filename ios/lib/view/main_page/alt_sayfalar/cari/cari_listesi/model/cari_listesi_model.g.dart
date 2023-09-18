// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cari_listesi_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CariListesiModelAdapter extends TypeAdapter<CariListesiModel> {
  @override
  final int typeId = 195;

  @override
  CariListesiModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CariListesiModel()
      ..cariKodu = fields[0] as String?
      ..cariAdi = fields[1] as String?
      ..bagliCari = fields[2] as String?
      ..bagliCariAdi = fields[3] as String?
      ..cariTip = fields[4] as String?
      ..cariTipAciklama = fields[5] as String?
      ..kilit = fields[6] as String?
      ..vadeGunu = fields[7] as int?
      ..odemeTipi = fields[8] as String?
      ..hesaptutmasekli = fields[9] as String?
      ..plasiyerKodu = fields[10] as String?
      ..plasiyerAciklama = fields[11] as String?
      ..borcToplami = fields[12] as double?
      ..bakiyeList = (fields[13] as List?)?.cast<dynamic>()
      ..alacakToplami = fields[15] as double?
      ..genisk1Orani = fields[16] as int?
      ..ulkeKodu = fields[17] as String?
      ..ulkeAdi = fields[18] as String?
      ..cariIl = fields[19] as String?
      ..cariIlce = fields[20] as String?
      ..cariTel = fields[21] as String?
      ..postakodu = fields[22] as String?
      ..email = fields[23] as String?
      ..web = fields[24] as String?
      ..cariAdres = fields[25] as String?
      ..vergiDairesi = fields[26] as String?
      ..vergiNumarasi = fields[27] as String?
      ..grupKodu = fields[28] as String?
      ..grupTanimi = fields[29] as String?
      ..bilgi = fields[30] as String?
      ..aciklama1 = fields[31] as String?
      ..aciklama2 = fields[32] as String?
      ..aciklama3 = fields[33] as String?
      ..kodu = fields[34] as String?
      ..kod1 = fields[35] as String?
      ..kod1Tanimi = fields[36] as String?
      ..kod2 = fields[37] as String?
      ..kod2Tanimi = fields[38] as String?
      ..kod3 = fields[39] as String?
      ..kod3Tanimi = fields[40] as String?
      ..kod4 = fields[41] as String?
      ..kod4Tanimi = fields[42] as String?
      ..kod5 = fields[43] as String?
      ..kod5Tanimi = fields[44] as String?
      ..kayityapankul = fields[45] as String?
      ..kayittarihi = fields[46] as String?
      ..duzeltmeyapankul = fields[47] as String?
      ..duzeltmetarihi = fields[48] as String?
      ..efaturaMi = fields[49] as bool?
      ..efaturaTipi = fields[50] as String?
      ..efatGecisTarihi = fields[51] as String?
      ..efatAktif = fields[52] as bool?
      ..riskTakibi = fields[53] as String?
      ..efaturaCarisi = fields[54] as String?
      ..bakiye = fields[55] as double?
      ..enlem = fields[56] as double?
      ..boylam = fields[57] as double?
      ..kull1s = fields[58] as String?
      ..kull2s = fields[59] as String?
      ..kull3s = fields[60] as String?
      ..kull4s = fields[61] as String?
      ..kull5s = fields[62] as String?
      ..kull6s = fields[63] as String?
      ..kull7s = fields[64] as String?
      ..kull8s = fields[65] as String?
      ..kull1n = fields[66] as double?
      ..kull2n = fields[67] as double?
      ..kull3n = fields[68] as double?
      ..kull4n = fields[69] as double?
      ..kull5n = fields[70] as double?
      ..kull6n = fields[71] as double?
      ..kull7n = fields[72] as double?
      ..kull8n = fields[73] as double?
      ..fax = fields[74] as String?
      ..sahisFirmasiMi = fields[75] as bool?
      ..dovizli = fields[76] as bool?
      ..dovizKodu = fields[77] as int?
      ..dovizAdi = fields[78] as String?
      ..subeKodu = fields[79] as int?
      ..kosulKodu = fields[80] as String?
      ..fiyatGrubu = fields[81] as String?
      ..kull1S = fields[82] as String?
      ..kull2S = fields[83] as String?;
  }

  @override
  void write(BinaryWriter writer, CariListesiModel obj) {
    writer
      ..writeByte(83)
      ..writeByte(0)
      ..write(obj.cariKodu)
      ..writeByte(1)
      ..write(obj.cariAdi)
      ..writeByte(2)
      ..write(obj.bagliCari)
      ..writeByte(3)
      ..write(obj.bagliCariAdi)
      ..writeByte(4)
      ..write(obj.cariTip)
      ..writeByte(5)
      ..write(obj.cariTipAciklama)
      ..writeByte(6)
      ..write(obj.kilit)
      ..writeByte(7)
      ..write(obj.vadeGunu)
      ..writeByte(8)
      ..write(obj.odemeTipi)
      ..writeByte(9)
      ..write(obj.hesaptutmasekli)
      ..writeByte(10)
      ..write(obj.plasiyerKodu)
      ..writeByte(11)
      ..write(obj.plasiyerAciklama)
      ..writeByte(12)
      ..write(obj.borcToplami)
      ..writeByte(13)
      ..write(obj.bakiyeList)
      ..writeByte(15)
      ..write(obj.alacakToplami)
      ..writeByte(16)
      ..write(obj.genisk1Orani)
      ..writeByte(17)
      ..write(obj.ulkeKodu)
      ..writeByte(18)
      ..write(obj.ulkeAdi)
      ..writeByte(19)
      ..write(obj.cariIl)
      ..writeByte(20)
      ..write(obj.cariIlce)
      ..writeByte(21)
      ..write(obj.cariTel)
      ..writeByte(22)
      ..write(obj.postakodu)
      ..writeByte(23)
      ..write(obj.email)
      ..writeByte(24)
      ..write(obj.web)
      ..writeByte(25)
      ..write(obj.cariAdres)
      ..writeByte(26)
      ..write(obj.vergiDairesi)
      ..writeByte(27)
      ..write(obj.vergiNumarasi)
      ..writeByte(28)
      ..write(obj.grupKodu)
      ..writeByte(29)
      ..write(obj.grupTanimi)
      ..writeByte(30)
      ..write(obj.bilgi)
      ..writeByte(31)
      ..write(obj.aciklama1)
      ..writeByte(32)
      ..write(obj.aciklama2)
      ..writeByte(33)
      ..write(obj.aciklama3)
      ..writeByte(34)
      ..write(obj.kodu)
      ..writeByte(35)
      ..write(obj.kod1)
      ..writeByte(36)
      ..write(obj.kod1Tanimi)
      ..writeByte(37)
      ..write(obj.kod2)
      ..writeByte(38)
      ..write(obj.kod2Tanimi)
      ..writeByte(39)
      ..write(obj.kod3)
      ..writeByte(40)
      ..write(obj.kod3Tanimi)
      ..writeByte(41)
      ..write(obj.kod4)
      ..writeByte(42)
      ..write(obj.kod4Tanimi)
      ..writeByte(43)
      ..write(obj.kod5)
      ..writeByte(44)
      ..write(obj.kod5Tanimi)
      ..writeByte(45)
      ..write(obj.kayityapankul)
      ..writeByte(46)
      ..write(obj.kayittarihi)
      ..writeByte(47)
      ..write(obj.duzeltmeyapankul)
      ..writeByte(48)
      ..write(obj.duzeltmetarihi)
      ..writeByte(49)
      ..write(obj.efaturaMi)
      ..writeByte(50)
      ..write(obj.efaturaTipi)
      ..writeByte(51)
      ..write(obj.efatGecisTarihi)
      ..writeByte(52)
      ..write(obj.efatAktif)
      ..writeByte(53)
      ..write(obj.riskTakibi)
      ..writeByte(54)
      ..write(obj.efaturaCarisi)
      ..writeByte(55)
      ..write(obj.bakiye)
      ..writeByte(56)
      ..write(obj.enlem)
      ..writeByte(57)
      ..write(obj.boylam)
      ..writeByte(58)
      ..write(obj.kull1s)
      ..writeByte(59)
      ..write(obj.kull2s)
      ..writeByte(60)
      ..write(obj.kull3s)
      ..writeByte(61)
      ..write(obj.kull4s)
      ..writeByte(62)
      ..write(obj.kull5s)
      ..writeByte(63)
      ..write(obj.kull6s)
      ..writeByte(64)
      ..write(obj.kull7s)
      ..writeByte(65)
      ..write(obj.kull8s)
      ..writeByte(66)
      ..write(obj.kull1n)
      ..writeByte(67)
      ..write(obj.kull2n)
      ..writeByte(68)
      ..write(obj.kull3n)
      ..writeByte(69)
      ..write(obj.kull4n)
      ..writeByte(70)
      ..write(obj.kull5n)
      ..writeByte(71)
      ..write(obj.kull6n)
      ..writeByte(72)
      ..write(obj.kull7n)
      ..writeByte(73)
      ..write(obj.kull8n)
      ..writeByte(74)
      ..write(obj.fax)
      ..writeByte(75)
      ..write(obj.sahisFirmasiMi)
      ..writeByte(76)
      ..write(obj.dovizli)
      ..writeByte(77)
      ..write(obj.dovizKodu)
      ..writeByte(78)
      ..write(obj.dovizAdi)
      ..writeByte(79)
      ..write(obj.subeKodu)
      ..writeByte(80)
      ..write(obj.kosulKodu)
      ..writeByte(81)
      ..write(obj.fiyatGrubu)
      ..writeByte(82)
      ..write(obj.kull1S)
      ..writeByte(83)
      ..write(obj.kull2S);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CariListesiModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CariListesiModel _$CariListesiModelFromJson(Map<String, dynamic> json) =>
    CariListesiModel()
      ..cariKodu = json['CARI_KODU'] as String?
      ..cariAdi = json['CARI_ADI'] as String?
      ..bagliCari = json['BAGLI_CARI'] as String?
      ..bagliCariAdi = json['BAGLI_CARI_ADI'] as String?
      ..cariTip = json['CARI_TIP'] as String?
      ..cariTipAciklama = json['CARI_TIP_ACIKLAMA'] as String?
      ..kilit = json['KILIT'] as String?
      ..vadeGunu = json['VADE_GUNU'] as int?
      ..odemeTipi = json['ODEME_TIPI'] as String?
      ..hesaptutmasekli = json['HESAPTUTMASEKLI'] as String?
      ..plasiyerKodu = json['PLASIYER_KODU'] as String?
      ..plasiyerAciklama = json['PLASIYER_ACIKLAMA'] as String?
      ..borcToplami = (json['BORC_TOPLAMI'] as num?)?.toDouble()
      ..alacakToplami = (json['ALACAK_TOPLAMI'] as num?)?.toDouble()
      ..genisk1Orani = json['GENISK1_ORANI'] as int?
      ..ulkeKodu = json['ULKE_KODU'] as String?
      ..ulkeAdi = json['ULKE_ADI'] as String?
      ..cariIl = json['CARI_IL'] as String?
      ..cariIlce = json['CARI_ILCE'] as String?
      ..cariTel = json['CARI_TEL'] as String?
      ..postakodu = json['POSTAKODU'] as String?
      ..email = json['EMAIL'] as String?
      ..web = json['WEB'] as String?
      ..cariAdres = json['CARI_ADRES'] as String?
      ..vergiDairesi = json['VERGI_DAIRESI'] as String?
      ..vergiNumarasi = json['VERGI_NUMARASI'] as String?
      ..grupKodu = json['GRUP_KODU'] as String?
      ..grupTanimi = json['GRUP_TANIMI'] as String?
      ..bilgi = json['BILGI'] as String?
      ..aciklama1 = json['ACIKLAMA1'] as String?
      ..aciklama2 = json['ACIKLAMA2'] as String?
      ..aciklama3 = json['ACIKLAMA3'] as String?
      ..kodu = json['KODU'] as String?
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
      ..kayityapankul = json['KAYITYAPANKUL'] as String?
      ..kayittarihi = json['KAYITTARIHI'] as String?
      ..duzeltmeyapankul = json['DUZELTMEYAPANKUL'] as String?
      ..duzeltmetarihi = json['DUZELTMETARIHI'] as String?
      ..efaturaMi = json['EFATURA_MI'] as bool?
      ..efaturaTipi = json['EFATURA_TIPI'] as String?
      ..efatGecisTarihi = json['EFAT_GECIS_TARIHI'] as String?
      ..efatAktif = json['EFAT_AKTIF'] as bool?
      ..riskTakibi = json['RISK_TAKIBI'] as String?
      ..efaturaCarisi = json['EFATURA_CARISI'] as String?
      ..bakiye = (json['BAKIYE'] as num?)?.toDouble()
      ..enlem = (json['ENLEM'] as num?)?.toDouble()
      ..boylam = (json['BOYLAM'] as num?)?.toDouble()
      ..kull1s = json['KULL1S'] as String?
      ..kull2s = json['KULL2S'] as String?
      ..kull3s = json['KULL3S'] as String?
      ..kull4s = json['KULL4S'] as String?
      ..kull5s = json['KULL5S'] as String?
      ..kull6s = json['KULL6S'] as String?
      ..kull7s = json['KULL7S'] as String?
      ..kull8s = json['KULL8S'] as String?
      ..kull1n = (json['KULL1N'] as num?)?.toDouble()
      ..kull2n = (json['KULL2N'] as num?)?.toDouble()
      ..kull3n = (json['KULL3N'] as num?)?.toDouble()
      ..kull4n = (json['KULL4N'] as num?)?.toDouble()
      ..kull5n = (json['KULL5N'] as num?)?.toDouble()
      ..kull6n = (json['KULL6N'] as num?)?.toDouble()
      ..kull7n = (json['KULL7N'] as num?)?.toDouble()
      ..kull8n = (json['KULL8N'] as num?)?.toDouble()
      ..fax = json['FAX'] as String?
      ..sahisFirmasiMi = json['SAHIS_FIRMASI_MI'] as bool?
      ..dovizli = json['DOVIZLI'] as bool?
      ..dovizKodu = json['DOVIZ_KODU'] as int?
      ..dovizAdi = json['DOVIZ_ADI'] as String?
      ..subeKodu = json['SUBE_KODU'] as int?
      ..kosulKodu = json['KOSUL_KODU'] as String?
      ..fiyatGrubu = json['FIYAT_GRUBU'] as String?
      ..kull1S = json['KULL1_S'] as String?
      ..kull2S = json['KULL2_S'] as String?;

Map<String, dynamic> _$CariListesiModelToJson(CariListesiModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('CARI_KODU', instance.cariKodu);
  writeNotNull('CARI_ADI', instance.cariAdi);
  writeNotNull('BAGLI_CARI', instance.bagliCari);
  writeNotNull('BAGLI_CARI_ADI', instance.bagliCariAdi);
  writeNotNull('CARI_TIP', instance.cariTip);
  writeNotNull('CARI_TIP_ACIKLAMA', instance.cariTipAciklama);
  writeNotNull('KILIT', instance.kilit);
  writeNotNull('VADE_GUNU', instance.vadeGunu);
  writeNotNull('ODEME_TIPI', instance.odemeTipi);
  writeNotNull('HESAPTUTMASEKLI', instance.hesaptutmasekli);
  writeNotNull('PLASIYER_KODU', instance.plasiyerKodu);
  writeNotNull('PLASIYER_ACIKLAMA', instance.plasiyerAciklama);
  writeNotNull('BORC_TOPLAMI', instance.borcToplami);
  writeNotNull('ALACAK_TOPLAMI', instance.alacakToplami);
  writeNotNull('GENISK1_ORANI', instance.genisk1Orani);
  writeNotNull('ULKE_KODU', instance.ulkeKodu);
  writeNotNull('ULKE_ADI', instance.ulkeAdi);
  writeNotNull('CARI_IL', instance.cariIl);
  writeNotNull('CARI_ILCE', instance.cariIlce);
  writeNotNull('CARI_TEL', instance.cariTel);
  writeNotNull('POSTAKODU', instance.postakodu);
  writeNotNull('EMAIL', instance.email);
  writeNotNull('WEB', instance.web);
  writeNotNull('CARI_ADRES', instance.cariAdres);
  writeNotNull('VERGI_DAIRESI', instance.vergiDairesi);
  writeNotNull('VERGI_NUMARASI', instance.vergiNumarasi);
  writeNotNull('GRUP_KODU', instance.grupKodu);
  writeNotNull('GRUP_TANIMI', instance.grupTanimi);
  writeNotNull('BILGI', instance.bilgi);
  writeNotNull('ACIKLAMA1', instance.aciklama1);
  writeNotNull('ACIKLAMA2', instance.aciklama2);
  writeNotNull('ACIKLAMA3', instance.aciklama3);
  writeNotNull('KODU', instance.kodu);
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
  writeNotNull('KAYITYAPANKUL', instance.kayityapankul);
  writeNotNull('KAYITTARIHI', instance.kayittarihi);
  writeNotNull('DUZELTMEYAPANKUL', instance.duzeltmeyapankul);
  writeNotNull('DUZELTMETARIHI', instance.duzeltmetarihi);
  writeNotNull('EFATURA_MI', instance.efaturaMi);
  writeNotNull('EFATURA_TIPI', instance.efaturaTipi);
  writeNotNull('EFAT_GECIS_TARIHI', instance.efatGecisTarihi);
  writeNotNull('EFAT_AKTIF', instance.efatAktif);
  writeNotNull('RISK_TAKIBI', instance.riskTakibi);
  writeNotNull('EFATURA_CARISI', instance.efaturaCarisi);
  writeNotNull('BAKIYE', instance.bakiye);
  writeNotNull('ENLEM', instance.enlem);
  writeNotNull('BOYLAM', instance.boylam);
  writeNotNull('KULL1S', instance.kull1s);
  writeNotNull('KULL2S', instance.kull2s);
  writeNotNull('KULL3S', instance.kull3s);
  writeNotNull('KULL4S', instance.kull4s);
  writeNotNull('KULL5S', instance.kull5s);
  writeNotNull('KULL6S', instance.kull6s);
  writeNotNull('KULL7S', instance.kull7s);
  writeNotNull('KULL8S', instance.kull8s);
  writeNotNull('KULL1N', instance.kull1n);
  writeNotNull('KULL2N', instance.kull2n);
  writeNotNull('KULL3N', instance.kull3n);
  writeNotNull('KULL4N', instance.kull4n);
  writeNotNull('KULL5N', instance.kull5n);
  writeNotNull('KULL6N', instance.kull6n);
  writeNotNull('KULL7N', instance.kull7n);
  writeNotNull('KULL8N', instance.kull8n);
  writeNotNull('FAX', instance.fax);
  writeNotNull('SAHIS_FIRMASI_MI', instance.sahisFirmasiMi);
  writeNotNull('DOVIZLI', instance.dovizli);
  writeNotNull('DOVIZ_KODU', instance.dovizKodu);
  writeNotNull('DOVIZ_ADI', instance.dovizAdi);
  writeNotNull('SUBE_KODU', instance.subeKodu);
  writeNotNull('KOSUL_KODU', instance.kosulKodu);
  writeNotNull('FIYAT_GRUBU', instance.fiyatGrubu);
  writeNotNull('KULL1_S', instance.kull1S);
  writeNotNull('KULL2_S', instance.kull2S);
  return val;
}

BakiyeModel _$BakiyeModelFromJson(Map<String, dynamic> json) => BakiyeModel()
  ..cariKodu = json['CARI_KODU'] as String?
  ..dovizTipi = json['DOVIZ_TIPI'] as int?
  ..borcToplami = (json['BORC_TOPLAMI'] as num?)?.toDouble()
  ..alacakToplami = json['ALACAK_TOPLAMI'] as int?
  ..bakiye = (json['BAKIYE'] as num?)?.toDouble()
  ..dovizAdi = json['DOVIZ_ADI'] as String?;

Map<String, dynamic> _$BakiyeModelToJson(BakiyeModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('CARI_KODU', instance.cariKodu);
  writeNotNull('DOVIZ_TIPI', instance.dovizTipi);
  writeNotNull('BORC_TOPLAMI', instance.borcToplami);
  writeNotNull('ALACAK_TOPLAMI', instance.alacakToplami);
  writeNotNull('BAKIYE', instance.bakiye);
  writeNotNull('DOVIZ_ADI', instance.dovizAdi);
  return val;
}
