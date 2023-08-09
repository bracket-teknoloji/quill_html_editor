// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_siparis_edit_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BaseSiparisEditModelAdapter extends TypeAdapter<BaseSiparisEditModel> {
  @override
  final int typeId = 152;

  @override
  BaseSiparisEditModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BaseSiparisEditModel()
      ..duzeltmetarihi = fields[0] as DateTime?
      ..kalemAdedi = fields[1] as int?
      ..cariEfaturami = fields[2] as String?
      ..cYedek6 = fields[3] as String?
      ..duzeltmeyapankul = fields[4] as String?
      ..plasiyerAciklama = fields[5] as String?
      ..projeAciklama = fields[6] as String?
      ..tempJsonData = fields[7] as BaseSiparisEditModel?
      ..teslimCariAdi = fields[8] as String?
      ..kdvDahilmi = fields[9] as bool?
      ..remoteTempBelge = fields[10] as bool?
      ..tempBelgeMi = fields[11] as bool?
      ..cariModel = fields[12] as CariListesiModel?
      ..islemeBaslamaTarihi = fields[13] as DateTime?
      ..istenilenTeslimTarihi = fields[14] as DateTime?
      ..kayittarihi = fields[15] as DateTime?
      ..kosulTarihi = fields[16] as DateTime?
      ..tarih = fields[17] as DateTime?
      ..teslimTarihi = fields[18] as DateTime?
      ..vadeTarihi = fields[19] as DateTime?
      ..araToplam = fields[20] as double?
      ..ekMaliyet1Tutari = fields[21] as double?
      ..ekMaliyet2Tutari = fields[22] as double?
      ..ekMaliyet3Tutari = fields[23] as double?
      ..genelIskonto1 = fields[24] as double?
      ..genelIskonto2 = fields[25] as double?
      ..genelIskonto3 = fields[26] as double?
      ..genelToplam = fields[27] as double?
      ..genIsk1O = fields[28] as double?
      ..genIsk1T = fields[29] as double?
      ..genIsk2O = fields[30] as double?
      ..genIsk2T = fields[31] as double?
      ..genIsk3O = fields[32] as double?
      ..genIsk3T = fields[33] as double?
      ..kdv = fields[34] as double?
      ..belgeTipi = fields[35] as int?
      ..cikisDepoKodu = fields[36] as int?
      ..genisk1Tipi = fields[37] as int?
      ..genisk2Tipi = fields[38] as int?
      ..genisk3Tipi = fields[39] as int?
      ..kalemModelAdedi = fields[40] as int?
      ..tempBelgeId = fields[41] as int?
      ..tempKayitTipi = fields[42] as int?
      ..tipi = fields[43] as int?
      ..topluDepo = fields[44] as int?
      ..vadeGunu = fields[45] as int?
      ..tempSipList = (fields[46] as List?)?.cast<dynamic>()
      ..kalemList = (fields[47] as List?)?.cast<KalemModel>()
      ..kalemModeller = (fields[48] as List?)?.cast<KalemModel>()
      ..kalemModelList = (fields[49] as List?)?.cast<KalemModel>()
      ..acik1 = fields[50] as String?
      ..acik10 = fields[51] as String?
      ..acik11 = fields[52] as String?
      ..acik12 = fields[53] as String?
      ..acik13 = fields[54] as String?
      ..acik14 = fields[55] as String?
      ..acik15 = fields[56] as String?
      ..acik16 = fields[57] as String?
      ..acik2 = fields[58] as String?
      ..acik3 = fields[59] as String?
      ..acik4 = fields[60] as String?
      ..acik5 = fields[61] as String?
      ..acik6 = fields[62] as String?
      ..acik7 = fields[63] as String?
      ..acik8 = fields[64] as String?
      ..acik9 = fields[65] as String?
      ..belgeKodu = fields[66] as String?
      ..belgeNo = fields[67] as String?
      ..belgeTuru = fields[68] as String?
      ..cariAdi = fields[69] as String?
      ..cariKodu = fields[70] as String?
      ..ekAcik1 = fields[71] as String?
      ..ekAcik10 = fields[72] as String?
      ..ekAcik11 = fields[73] as String?
      ..ekAcik12 = fields[74] as String?
      ..ekAcik13 = fields[75] as String?
      ..ekAcik14 = fields[76] as String?
      ..ekAcik15 = fields[77] as String?
      ..ekAcik16 = fields[78] as String?
      ..ekAcik2 = fields[79] as String?
      ..ekAcik3 = fields[80] as String?
      ..ekAcik4 = fields[81] as String?
      ..ekAcik5 = fields[82] as String?
      ..ekAcik6 = fields[83] as String?
      ..ekAcik7 = fields[84] as String?
      ..ekAcik8 = fields[85] as String?
      ..ekAcik9 = fields[86] as String?
      ..ekAciklama = fields[87] as String?
      ..islemId = fields[88] as String?
      ..kayityapankul = fields[89] as String?
      ..kdvDahil = fields[90] as String?
      ..kosulKodu = fields[91] as String?
      ..mevcutBelgeNo = fields[92] as String?
      ..mevcutCariKodu = fields[93] as String?
      ..odemeKodu = fields[94] as String?
      ..ozelKod1 = fields[95] as String?
      ..ozelKod2 = fields[96] as String?
      ..pickerBelgeTuru = fields[97] as String?
      ..plasiyerKodu = fields[98] as String?
      ..projeKodu = fields[99] as String?
      ..remoteTempBelgeEtiketi = fields[100] as String?
      ..tag = fields[101] as String?
      ..kalemler = (fields[102] as List?)?.cast<KalemModel>()
      ..siparisTipi = fields[103] as SiparisTipiEnum?
      ..isNew = fields[104] as bool?
      ..irsaliyelesti = fields[105] as String?
      ..irslesenSayi = fields[106] as int?
      ..faturalasti = fields[107] as String?
      ..dovizTipi = fields[108] as int?
      ..dovizAdi = fields[109] as String?
      ..kapatilmis = fields[110] as String?
      ..aciklama = fields[111] as String?
      ..dovizTutari = fields[112] as double?
      ..teslimCari = fields[113] as String?
      ..fYedek4 = fields[114] as double?;
  }

  @override
  void write(BinaryWriter writer, BaseSiparisEditModel obj) {
    writer
      ..writeByte(115)
      ..writeByte(0)
      ..write(obj.duzeltmetarihi)
      ..writeByte(1)
      ..write(obj.kalemAdedi)
      ..writeByte(2)
      ..write(obj.cariEfaturami)
      ..writeByte(3)
      ..write(obj.cYedek6)
      ..writeByte(4)
      ..write(obj.duzeltmeyapankul)
      ..writeByte(5)
      ..write(obj.plasiyerAciklama)
      ..writeByte(6)
      ..write(obj.projeAciklama)
      ..writeByte(7)
      ..write(obj.tempJsonData)
      ..writeByte(8)
      ..write(obj.teslimCariAdi)
      ..writeByte(9)
      ..write(obj.kdvDahilmi)
      ..writeByte(10)
      ..write(obj.remoteTempBelge)
      ..writeByte(11)
      ..write(obj.tempBelgeMi)
      ..writeByte(12)
      ..write(obj.cariModel)
      ..writeByte(13)
      ..write(obj.islemeBaslamaTarihi)
      ..writeByte(14)
      ..write(obj.istenilenTeslimTarihi)
      ..writeByte(15)
      ..write(obj.kayittarihi)
      ..writeByte(16)
      ..write(obj.kosulTarihi)
      ..writeByte(17)
      ..write(obj.tarih)
      ..writeByte(18)
      ..write(obj.teslimTarihi)
      ..writeByte(19)
      ..write(obj.vadeTarihi)
      ..writeByte(20)
      ..write(obj.araToplam)
      ..writeByte(21)
      ..write(obj.ekMaliyet1Tutari)
      ..writeByte(22)
      ..write(obj.ekMaliyet2Tutari)
      ..writeByte(23)
      ..write(obj.ekMaliyet3Tutari)
      ..writeByte(24)
      ..write(obj.genelIskonto1)
      ..writeByte(25)
      ..write(obj.genelIskonto2)
      ..writeByte(26)
      ..write(obj.genelIskonto3)
      ..writeByte(27)
      ..write(obj.genelToplam)
      ..writeByte(28)
      ..write(obj.genIsk1O)
      ..writeByte(29)
      ..write(obj.genIsk1T)
      ..writeByte(30)
      ..write(obj.genIsk2O)
      ..writeByte(31)
      ..write(obj.genIsk2T)
      ..writeByte(32)
      ..write(obj.genIsk3O)
      ..writeByte(33)
      ..write(obj.genIsk3T)
      ..writeByte(34)
      ..write(obj.kdv)
      ..writeByte(35)
      ..write(obj.belgeTipi)
      ..writeByte(36)
      ..write(obj.cikisDepoKodu)
      ..writeByte(37)
      ..write(obj.genisk1Tipi)
      ..writeByte(38)
      ..write(obj.genisk2Tipi)
      ..writeByte(39)
      ..write(obj.genisk3Tipi)
      ..writeByte(40)
      ..write(obj.kalemModelAdedi)
      ..writeByte(41)
      ..write(obj.tempBelgeId)
      ..writeByte(42)
      ..write(obj.tempKayitTipi)
      ..writeByte(43)
      ..write(obj.tipi)
      ..writeByte(44)
      ..write(obj.topluDepo)
      ..writeByte(45)
      ..write(obj.vadeGunu)
      ..writeByte(46)
      ..write(obj.tempSipList)
      ..writeByte(47)
      ..write(obj.kalemList)
      ..writeByte(48)
      ..write(obj.kalemModeller)
      ..writeByte(49)
      ..write(obj.kalemModelList)
      ..writeByte(50)
      ..write(obj.acik1)
      ..writeByte(51)
      ..write(obj.acik10)
      ..writeByte(52)
      ..write(obj.acik11)
      ..writeByte(53)
      ..write(obj.acik12)
      ..writeByte(54)
      ..write(obj.acik13)
      ..writeByte(55)
      ..write(obj.acik14)
      ..writeByte(56)
      ..write(obj.acik15)
      ..writeByte(57)
      ..write(obj.acik16)
      ..writeByte(58)
      ..write(obj.acik2)
      ..writeByte(59)
      ..write(obj.acik3)
      ..writeByte(60)
      ..write(obj.acik4)
      ..writeByte(61)
      ..write(obj.acik5)
      ..writeByte(62)
      ..write(obj.acik6)
      ..writeByte(63)
      ..write(obj.acik7)
      ..writeByte(64)
      ..write(obj.acik8)
      ..writeByte(65)
      ..write(obj.acik9)
      ..writeByte(66)
      ..write(obj.belgeKodu)
      ..writeByte(67)
      ..write(obj.belgeNo)
      ..writeByte(68)
      ..write(obj.belgeTuru)
      ..writeByte(69)
      ..write(obj.cariAdi)
      ..writeByte(70)
      ..write(obj.cariKodu)
      ..writeByte(71)
      ..write(obj.ekAcik1)
      ..writeByte(72)
      ..write(obj.ekAcik10)
      ..writeByte(73)
      ..write(obj.ekAcik11)
      ..writeByte(74)
      ..write(obj.ekAcik12)
      ..writeByte(75)
      ..write(obj.ekAcik13)
      ..writeByte(76)
      ..write(obj.ekAcik14)
      ..writeByte(77)
      ..write(obj.ekAcik15)
      ..writeByte(78)
      ..write(obj.ekAcik16)
      ..writeByte(79)
      ..write(obj.ekAcik2)
      ..writeByte(80)
      ..write(obj.ekAcik3)
      ..writeByte(81)
      ..write(obj.ekAcik4)
      ..writeByte(82)
      ..write(obj.ekAcik5)
      ..writeByte(83)
      ..write(obj.ekAcik6)
      ..writeByte(84)
      ..write(obj.ekAcik7)
      ..writeByte(85)
      ..write(obj.ekAcik8)
      ..writeByte(86)
      ..write(obj.ekAcik9)
      ..writeByte(87)
      ..write(obj.ekAciklama)
      ..writeByte(88)
      ..write(obj.islemId)
      ..writeByte(89)
      ..write(obj.kayityapankul)
      ..writeByte(90)
      ..write(obj.kdvDahil)
      ..writeByte(91)
      ..write(obj.kosulKodu)
      ..writeByte(92)
      ..write(obj.mevcutBelgeNo)
      ..writeByte(93)
      ..write(obj.mevcutCariKodu)
      ..writeByte(94)
      ..write(obj.odemeKodu)
      ..writeByte(95)
      ..write(obj.ozelKod1)
      ..writeByte(96)
      ..write(obj.ozelKod2)
      ..writeByte(97)
      ..write(obj.pickerBelgeTuru)
      ..writeByte(98)
      ..write(obj.plasiyerKodu)
      ..writeByte(99)
      ..write(obj.projeKodu)
      ..writeByte(100)
      ..write(obj.remoteTempBelgeEtiketi)
      ..writeByte(101)
      ..write(obj.tag)
      ..writeByte(102)
      ..write(obj.kalemler)
      ..writeByte(103)
      ..write(obj.siparisTipi)
      ..writeByte(104)
      ..write(obj.isNew)
      ..writeByte(105)
      ..write(obj.irsaliyelesti)
      ..writeByte(106)
      ..write(obj.irslesenSayi)
      ..writeByte(107)
      ..write(obj.faturalasti)
      ..writeByte(108)
      ..write(obj.dovizTipi)
      ..writeByte(109)
      ..write(obj.dovizAdi)
      ..writeByte(110)
      ..write(obj.kapatilmis)
      ..writeByte(111)
      ..write(obj.aciklama)
      ..writeByte(112)
      ..write(obj.dovizTutari)
      ..writeByte(113)
      ..write(obj.teslimCari)
      ..writeByte(114)
      ..write(obj.fYedek4);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BaseSiparisEditModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class KalemModelAdapter extends TypeAdapter<KalemModel> {
  @override
  final int typeId = 17;

  @override
  KalemModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return KalemModel(
      iskonto1OranMi: fields[0] as bool?,
      tarih: fields[1] as DateTime?,
      teslimTarihi: fields[2] as DateTime?,
      brutFiyat: fields[3] as double?,
      depoKodu: fields[4] as int?,
      kdvOrani: fields[5] as double?,
      miktar: fields[6] as double?,
      olcuBirimKodu: fields[7] as int?,
      sira: fields[8] as int?,
      hucreList: (fields[9] as List?)?.cast<dynamic>(),
      kalemModelHucreList: (fields[10] as List?)?.cast<dynamic>(),
      seriList: (fields[11] as List?)?.cast<dynamic>(),
      tempBarkodList: (fields[12] as List?)?.cast<dynamic>(),
      belgeNo: fields[13] as String?,
      belgeTipi: fields[14] as String?,
      cariKodu: fields[15] as String?,
      depoTanimi: fields[16] as String?,
      olcuBirimAdi: fields[17] as String?,
      stokAdi: fields[18] as String?,
      stokKodu: fields[19] as String?,
      stokOlcuBirimi: fields[20] as String?,
      dovizKuru: fields[21] as double?,
      dovizTipi: fields[22] as int?,
      dovizliFiyat: fields[23] as double?,
      aciklama1: fields[24] as String?,
      aciklama10: fields[25] as String?,
      aciklama2: fields[26] as String?,
      aciklama3: fields[27] as String?,
      aciklama4: fields[28] as String?,
      aciklama5: fields[29] as String?,
      aciklama6: fields[30] as String?,
      aciklama7: fields[31] as String?,
      aciklama8: fields[32] as String?,
      aciklama9: fields[33] as String?,
      ekalan1: fields[34] as String?,
      ekalan2: fields[35] as String?,
      isk1Tipi: fields[36] as int?,
      isk2Tipi: fields[37] as int?,
      isk3Tipi: fields[38] as int?,
      iskonto1: fields[39] as double?,
      iskonto2: fields[40] as double?,
      iskonto3: fields[41] as double?,
      malfazIskAdedi: fields[42] as double?,
      miktar2: fields[43] as double?,
      projeKodu: fields[44] as String?,
      satisFiyati: fields[45] as double?,
      dovizKodu: fields[46] as int?,
      dovizFiyati: fields[47] as double?,
      malfazCevrimliMiktar: fields[48] as double?,
      malFazlasiMiktar: fields[49] as double?,
    );
  }

  @override
  void write(BinaryWriter writer, KalemModel obj) {
    writer
      ..writeByte(50)
      ..writeByte(0)
      ..write(obj.iskonto1OranMi)
      ..writeByte(1)
      ..write(obj.tarih)
      ..writeByte(2)
      ..write(obj.teslimTarihi)
      ..writeByte(3)
      ..write(obj.brutFiyat)
      ..writeByte(4)
      ..write(obj.depoKodu)
      ..writeByte(5)
      ..write(obj.kdvOrani)
      ..writeByte(6)
      ..write(obj.miktar)
      ..writeByte(7)
      ..write(obj.olcuBirimKodu)
      ..writeByte(8)
      ..write(obj.sira)
      ..writeByte(9)
      ..write(obj.hucreList)
      ..writeByte(10)
      ..write(obj.kalemModelHucreList)
      ..writeByte(11)
      ..write(obj.seriList)
      ..writeByte(12)
      ..write(obj.tempBarkodList)
      ..writeByte(13)
      ..write(obj.belgeNo)
      ..writeByte(14)
      ..write(obj.belgeTipi)
      ..writeByte(15)
      ..write(obj.cariKodu)
      ..writeByte(16)
      ..write(obj.depoTanimi)
      ..writeByte(17)
      ..write(obj.olcuBirimAdi)
      ..writeByte(18)
      ..write(obj.stokAdi)
      ..writeByte(19)
      ..write(obj.stokKodu)
      ..writeByte(20)
      ..write(obj.stokOlcuBirimi)
      ..writeByte(21)
      ..write(obj.dovizKuru)
      ..writeByte(22)
      ..write(obj.dovizTipi)
      ..writeByte(23)
      ..write(obj.dovizliFiyat)
      ..writeByte(24)
      ..write(obj.aciklama1)
      ..writeByte(25)
      ..write(obj.aciklama10)
      ..writeByte(26)
      ..write(obj.aciklama2)
      ..writeByte(27)
      ..write(obj.aciklama3)
      ..writeByte(28)
      ..write(obj.aciklama4)
      ..writeByte(29)
      ..write(obj.aciklama5)
      ..writeByte(30)
      ..write(obj.aciklama6)
      ..writeByte(31)
      ..write(obj.aciklama7)
      ..writeByte(32)
      ..write(obj.aciklama8)
      ..writeByte(33)
      ..write(obj.aciklama9)
      ..writeByte(34)
      ..write(obj.ekalan1)
      ..writeByte(35)
      ..write(obj.ekalan2)
      ..writeByte(36)
      ..write(obj.isk1Tipi)
      ..writeByte(37)
      ..write(obj.isk2Tipi)
      ..writeByte(38)
      ..write(obj.isk3Tipi)
      ..writeByte(39)
      ..write(obj.iskonto1)
      ..writeByte(40)
      ..write(obj.iskonto2)
      ..writeByte(41)
      ..write(obj.iskonto3)
      ..writeByte(42)
      ..write(obj.malfazIskAdedi)
      ..writeByte(43)
      ..write(obj.miktar2)
      ..writeByte(44)
      ..write(obj.projeKodu)
      ..writeByte(45)
      ..write(obj.satisFiyati)
      ..writeByte(46)
      ..write(obj.dovizKodu)
      ..writeByte(47)
      ..write(obj.dovizFiyati)
      ..writeByte(48)
      ..write(obj.malfazCevrimliMiktar)
      ..writeByte(49)
      ..write(obj.malFazlasiMiktar);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is KalemModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseSiparisEditModel _$BaseSiparisEditModelFromJson(
        Map<String, dynamic> json) =>
    BaseSiparisEditModel()
      ..duzeltmetarihi = json['DUZELTMETARIHI'] == null
          ? null
          : DateTime.parse(json['DUZELTMETARIHI'] as String)
      ..kalemAdedi = json['KALEM_ADEDI'] as int?
      ..cariEfaturami = json['CARI_EFATURAMI'] as String?
      ..cYedek6 = json['C_YEDEK6'] as String?
      ..duzeltmeyapankul = json['DUZELTMEYAPANKUL'] as String?
      ..plasiyerAciklama = json['PLASIYER_ACIKLAMA'] as String?
      ..projeAciklama = json['PROJE_ACIKLAMA'] as String?
      ..tempJsonData = json['TEMP_JSON_DATA'] == null
          ? null
          : BaseSiparisEditModel.fromJson(json['TEMP_JSON_DATA'] as String)
      ..teslimCariAdi = json['TESLIM_CARI_ADI'] as String?
      ..kdvDahilmi = json['KDV_DAHILMI'] as bool?
      ..remoteTempBelge = json['REMOTE_TEMP_BELGE'] as bool?
      ..tempBelgeMi = json['TEMP_BELGE_MI'] as bool?
      ..cariModel = json['CARI_MODEL'] == null
          ? null
          : CariListesiModel.fromJson(
              json['CARI_MODEL'] as Map<String, dynamic>)
      ..islemeBaslamaTarihi = json['ISLEME_BASLAMA_TARIHI'] == null
          ? null
          : DateTime.parse(json['ISLEME_BASLAMA_TARIHI'] as String)
      ..istenilenTeslimTarihi = json['ISTENILEN_TESLIM_TARIHI'] == null
          ? null
          : DateTime.parse(json['ISTENILEN_TESLIM_TARIHI'] as String)
      ..kayittarihi = json['KAYITTARIHI'] == null
          ? null
          : DateTime.parse(json['KAYITTARIHI'] as String)
      ..kosulTarihi = json['KOSUL_TARIHI'] == null
          ? null
          : DateTime.parse(json['KOSUL_TARIHI'] as String)
      ..tarih =
          json['TARIH'] == null ? null : DateTime.parse(json['TARIH'] as String)
      ..teslimTarihi = json['TESLIM_TARIHI'] == null
          ? null
          : DateTime.parse(json['TESLIM_TARIHI'] as String)
      ..vadeTarihi = json['VADE_TARIHI'] == null
          ? null
          : DateTime.parse(json['VADE_TARIHI'] as String)
      ..araToplam = (json['ARA_TOPLAM'] as num?)?.toDouble()
      ..ekMaliyet1Tutari = (json['EK_MALIYET1_TUTARI'] as num?)?.toDouble()
      ..ekMaliyet2Tutari = (json['EK_MALIYET2_TUTARI'] as num?)?.toDouble()
      ..ekMaliyet3Tutari = (json['EK_MALIYET3_TUTARI'] as num?)?.toDouble()
      ..genelIskonto1 = (json['GENEL_ISKONTO1'] as num?)?.toDouble()
      ..genelIskonto2 = (json['GENEL_ISKONTO2'] as num?)?.toDouble()
      ..genelIskonto3 = (json['GENEL_ISKONTO3'] as num?)?.toDouble()
      ..genelToplam = (json['GENEL_TOPLAM'] as num?)?.toDouble()
      ..genIsk1O = (json['GEN_ISK1_O'] as num?)?.toDouble()
      ..genIsk1T = (json['GEN_ISK1_T'] as num?)?.toDouble()
      ..genIsk2O = (json['GEN_ISK2_O'] as num?)?.toDouble()
      ..genIsk2T = (json['GEN_ISK2_T'] as num?)?.toDouble()
      ..genIsk3O = (json['GEN_ISK3_O'] as num?)?.toDouble()
      ..genIsk3T = (json['GEN_ISK3_T'] as num?)?.toDouble()
      ..kdv = (json['KDV'] as num?)?.toDouble()
      ..belgeTipi = json['BELGE_TIPI'] as int?
      ..cikisDepoKodu = json['CIKIS_DEPO_KODU'] as int?
      ..genisk1Tipi = json['GENISK1_TIPI'] as int?
      ..genisk2Tipi = json['GENISK2_TIPI'] as int?
      ..genisk3Tipi = json['GENISK3_TIPI'] as int?
      ..kalemModelAdedi = json['KALEM_MODEL_ADEDI'] as int?
      ..tempBelgeId = json['TEMP_BELGE_ID'] as int?
      ..tempKayitTipi = json['TEMP_KAYIT_TIPI'] as int?
      ..tipi = json['TIPI'] as int?
      ..topluDepo = json['TOPLU_DEPO'] as int?
      ..vadeGunu = json['VADE_GUNU'] as int?
      ..tempSipList = json['TEMP_SIP_LIST'] as List<dynamic>?
      ..kalemList = (json['KALEM_LIST'] as List<dynamic>?)
          ?.map((e) => KalemModel.fromJson(e as Map<String, dynamic>))
          .toList()
      ..kalemModeller = (json['KALEM_MODELLER'] as List<dynamic>?)
          ?.map((e) => KalemModel.fromJson(e as Map<String, dynamic>))
          .toList()
      ..kalemModelList = (json['KALEM_MODEL_LIST'] as List<dynamic>?)
          ?.map((e) => KalemModel.fromJson(e as Map<String, dynamic>))
          .toList()
      ..acik1 = json['ACIK1'] as String?
      ..acik10 = json['ACIK10'] as String?
      ..acik11 = json['ACIK11'] as String?
      ..acik12 = json['ACIK12'] as String?
      ..acik13 = json['ACIK13'] as String?
      ..acik14 = json['ACIK14'] as String?
      ..acik15 = json['ACIK15'] as String?
      ..acik16 = json['ACIK16'] as String?
      ..acik2 = json['ACIK2'] as String?
      ..acik3 = json['ACIK3'] as String?
      ..acik4 = json['ACIK4'] as String?
      ..acik5 = json['ACIK5'] as String?
      ..acik6 = json['ACIK6'] as String?
      ..acik7 = json['ACIK7'] as String?
      ..acik8 = json['ACIK8'] as String?
      ..acik9 = json['ACIK9'] as String?
      ..belgeKodu = json['BELGE_KODU'] as String?
      ..belgeNo = json['BELGE_NO'] as String?
      ..belgeTuru = json['BELGE_TURU'] as String?
      ..cariAdi = json['CARI_ADI'] as String?
      ..cariKodu = json['CARI_KODU'] as String?
      ..ekAcik1 = json['EK_ACIK1'] as String?
      ..ekAcik10 = json['EK_ACIK10'] as String?
      ..ekAcik11 = json['EK_ACIK11'] as String?
      ..ekAcik12 = json['EK_ACIK12'] as String?
      ..ekAcik13 = json['EK_ACIK13'] as String?
      ..ekAcik14 = json['EK_ACIK14'] as String?
      ..ekAcik15 = json['EK_ACIK15'] as String?
      ..ekAcik16 = json['EK_ACIK16'] as String?
      ..ekAcik2 = json['EK_ACIK2'] as String?
      ..ekAcik3 = json['EK_ACIK3'] as String?
      ..ekAcik4 = json['EK_ACIK4'] as String?
      ..ekAcik5 = json['EK_ACIK5'] as String?
      ..ekAcik6 = json['EK_ACIK6'] as String?
      ..ekAcik7 = json['EK_ACIK7'] as String?
      ..ekAcik8 = json['EK_ACIK8'] as String?
      ..ekAcik9 = json['EK_ACIK9'] as String?
      ..ekAciklama = json['EK_ACIKLAMA'] as String?
      ..islemId = json['ISLEM_ID'] as String?
      ..kayityapankul = json['KAYITYAPANKUL'] as String?
      ..kdvDahil = json['KDV_DAHIL'] as String?
      ..kosulKodu = json['KOSUL_KODU'] as String?
      ..mevcutBelgeNo = json['MEVCUT_BELGE_NO'] as String?
      ..mevcutCariKodu = json['MEVCUT_CARI_KODU'] as String?
      ..odemeKodu = json['ODEME_KODU'] as String?
      ..ozelKod1 = json['OZEL_KOD1'] as String?
      ..ozelKod2 = json['OZEL_KOD2'] as String?
      ..pickerBelgeTuru = json['PICKER_BELGE_TURU'] as String?
      ..plasiyerKodu = json['PLASIYER_KODU'] as String?
      ..projeKodu = json['PROJE_KODU'] as String?
      ..remoteTempBelgeEtiketi = json['REMOTE_TEMP_BELGE_ETIKETI'] as String?
      ..tag = json['TAG'] as String?
      ..kalemler = (json['KALEMLER'] as List<dynamic>?)
          ?.map((e) => KalemModel.fromJson(e as Map<String, dynamic>))
          .toList()
      ..irsaliyelesti = json['IRSALIYELESTI'] as String?
      ..irslesenSayi = json['IRSLESEN_SAYI'] as int?
      ..faturalasti = json['FATURALASTI'] as String?
      ..dovizTipi = json['DOVIZ_TIPI'] as int?
      ..dovizAdi = json['DOVIZ_ADI'] as String?
      ..kapatilmis = json['KAPATILMIS'] as String?
      ..aciklama = json['ACIKLAMA'] as String?
      ..dovizTutari = (json['DOVIZ_TUTARI'] as num?)?.toDouble()
      ..teslimCari = json['TESLIM_CARI'] as String?
      ..fYedek4 = (json['F_YEDEK4'] as num?)?.toDouble();

Map<String, dynamic> _$BaseSiparisEditModelToJson(
    BaseSiparisEditModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DUZELTMETARIHI', instance.duzeltmetarihi?.toIso8601String());
  writeNotNull('KALEM_ADEDI', instance.kalemAdedi);
  writeNotNull('CARI_EFATURAMI', instance.cariEfaturami);
  writeNotNull('C_YEDEK6', instance.cYedek6);
  writeNotNull('DUZELTMEYAPANKUL', instance.duzeltmeyapankul);
  writeNotNull('PLASIYER_ACIKLAMA', instance.plasiyerAciklama);
  writeNotNull('PROJE_ACIKLAMA', instance.projeAciklama);
  writeNotNull('TEMP_JSON_DATA', instance.tempJsonData);
  writeNotNull('TESLIM_CARI_ADI', instance.teslimCariAdi);
  writeNotNull('KDV_DAHILMI', instance.kdvDahilmi);
  writeNotNull('REMOTE_TEMP_BELGE', instance.remoteTempBelge);
  writeNotNull('TEMP_BELGE_MI', instance.tempBelgeMi);
  writeNotNull('CARI_MODEL', instance.cariModel);
  writeNotNull(
      'ISLEME_BASLAMA_TARIHI', instance.islemeBaslamaTarihi?.toIso8601String());
  writeNotNull('ISTENILEN_TESLIM_TARIHI',
      instance.istenilenTeslimTarihi?.toIso8601String());
  writeNotNull('KAYITTARIHI', instance.kayittarihi?.toIso8601String());
  writeNotNull('KOSUL_TARIHI', instance.kosulTarihi?.toIso8601String());
  writeNotNull('TARIH', instance.tarih?.toIso8601String());
  writeNotNull('TESLIM_TARIHI', instance.teslimTarihi?.toIso8601String());
  writeNotNull('VADE_TARIHI', instance.vadeTarihi?.toIso8601String());
  writeNotNull('ARA_TOPLAM', instance.araToplam);
  writeNotNull('EK_MALIYET1_TUTARI', instance.ekMaliyet1Tutari);
  writeNotNull('EK_MALIYET2_TUTARI', instance.ekMaliyet2Tutari);
  writeNotNull('EK_MALIYET3_TUTARI', instance.ekMaliyet3Tutari);
  writeNotNull('GENEL_ISKONTO1', instance.genelIskonto1);
  writeNotNull('GENEL_ISKONTO2', instance.genelIskonto2);
  writeNotNull('GENEL_ISKONTO3', instance.genelIskonto3);
  writeNotNull('GENEL_TOPLAM', instance.genelToplam);
  writeNotNull('GEN_ISK1_O', instance.genIsk1O);
  writeNotNull('GEN_ISK1_T', instance.genIsk1T);
  writeNotNull('GEN_ISK2_O', instance.genIsk2O);
  writeNotNull('GEN_ISK2_T', instance.genIsk2T);
  writeNotNull('GEN_ISK3_O', instance.genIsk3O);
  writeNotNull('GEN_ISK3_T', instance.genIsk3T);
  writeNotNull('KDV', instance.kdv);
  writeNotNull('BELGE_TIPI', instance.belgeTipi);
  writeNotNull('CIKIS_DEPO_KODU', instance.cikisDepoKodu);
  writeNotNull('GENISK1_TIPI', instance.genisk1Tipi);
  writeNotNull('GENISK2_TIPI', instance.genisk2Tipi);
  writeNotNull('GENISK3_TIPI', instance.genisk3Tipi);
  writeNotNull('KALEM_MODEL_ADEDI', instance.kalemModelAdedi);
  writeNotNull('TEMP_BELGE_ID', instance.tempBelgeId);
  writeNotNull('TEMP_KAYIT_TIPI', instance.tempKayitTipi);
  writeNotNull('TIPI', instance.tipi);
  writeNotNull('TOPLU_DEPO', instance.topluDepo);
  writeNotNull('VADE_GUNU', instance.vadeGunu);
  writeNotNull('TEMP_SIP_LIST', instance.tempSipList);
  writeNotNull('KALEM_LIST', instance.kalemList);
  writeNotNull('KALEM_MODELLER', instance.kalemModeller);
  writeNotNull('KALEM_MODEL_LIST', instance.kalemModelList);
  writeNotNull('ACIK1', instance.acik1);
  writeNotNull('ACIK10', instance.acik10);
  writeNotNull('ACIK11', instance.acik11);
  writeNotNull('ACIK12', instance.acik12);
  writeNotNull('ACIK13', instance.acik13);
  writeNotNull('ACIK14', instance.acik14);
  writeNotNull('ACIK15', instance.acik15);
  writeNotNull('ACIK16', instance.acik16);
  writeNotNull('ACIK2', instance.acik2);
  writeNotNull('ACIK3', instance.acik3);
  writeNotNull('ACIK4', instance.acik4);
  writeNotNull('ACIK5', instance.acik5);
  writeNotNull('ACIK6', instance.acik6);
  writeNotNull('ACIK7', instance.acik7);
  writeNotNull('ACIK8', instance.acik8);
  writeNotNull('ACIK9', instance.acik9);
  writeNotNull('BELGE_KODU', instance.belgeKodu);
  writeNotNull('BELGE_NO', instance.belgeNo);
  writeNotNull('BELGE_TURU', instance.belgeTuru);
  writeNotNull('CARI_ADI', instance.cariAdi);
  writeNotNull('CARI_KODU', instance.cariKodu);
  writeNotNull('EK_ACIK1', instance.ekAcik1);
  writeNotNull('EK_ACIK10', instance.ekAcik10);
  writeNotNull('EK_ACIK11', instance.ekAcik11);
  writeNotNull('EK_ACIK12', instance.ekAcik12);
  writeNotNull('EK_ACIK13', instance.ekAcik13);
  writeNotNull('EK_ACIK14', instance.ekAcik14);
  writeNotNull('EK_ACIK15', instance.ekAcik15);
  writeNotNull('EK_ACIK16', instance.ekAcik16);
  writeNotNull('EK_ACIK2', instance.ekAcik2);
  writeNotNull('EK_ACIK3', instance.ekAcik3);
  writeNotNull('EK_ACIK4', instance.ekAcik4);
  writeNotNull('EK_ACIK5', instance.ekAcik5);
  writeNotNull('EK_ACIK6', instance.ekAcik6);
  writeNotNull('EK_ACIK7', instance.ekAcik7);
  writeNotNull('EK_ACIK8', instance.ekAcik8);
  writeNotNull('EK_ACIK9', instance.ekAcik9);
  writeNotNull('EK_ACIKLAMA', instance.ekAciklama);
  writeNotNull('ISLEM_ID', instance.islemId);
  writeNotNull('KAYITYAPANKUL', instance.kayityapankul);
  writeNotNull('KDV_DAHIL', instance.kdvDahil);
  writeNotNull('KOSUL_KODU', instance.kosulKodu);
  writeNotNull('MEVCUT_BELGE_NO', instance.mevcutBelgeNo);
  writeNotNull('MEVCUT_CARI_KODU', instance.mevcutCariKodu);
  writeNotNull('ODEME_KODU', instance.odemeKodu);
  writeNotNull('OZEL_KOD1', instance.ozelKod1);
  writeNotNull('OZEL_KOD2', instance.ozelKod2);
  writeNotNull('PICKER_BELGE_TURU', instance.pickerBelgeTuru);
  writeNotNull('PLASIYER_KODU', instance.plasiyerKodu);
  writeNotNull('PROJE_KODU', instance.projeKodu);
  writeNotNull('REMOTE_TEMP_BELGE_ETIKETI', instance.remoteTempBelgeEtiketi);
  writeNotNull('TAG', instance.tag);
  writeNotNull('KALEMLER', instance.kalemler);
  writeNotNull('IRSALIYELESTI', instance.irsaliyelesti);
  writeNotNull('IRSLESEN_SAYI', instance.irslesenSayi);
  writeNotNull('FATURALASTI', instance.faturalasti);
  writeNotNull('DOVIZ_TIPI', instance.dovizTipi);
  writeNotNull('DOVIZ_ADI', instance.dovizAdi);
  writeNotNull('KAPATILMIS', instance.kapatilmis);
  writeNotNull('ACIKLAMA', instance.aciklama);
  writeNotNull('DOVIZ_TUTARI', instance.dovizTutari);
  writeNotNull('TESLIM_CARI', instance.teslimCari);
  writeNotNull('F_YEDEK4', instance.fYedek4);
  return val;
}

KalemModel _$KalemModelFromJson(Map<String, dynamic> json) => KalemModel(
      iskonto1OranMi: json['ISKONTO1_ORAN_MI'] as bool?,
      tarih: json['TARIH'] == null
          ? null
          : DateTime.parse(json['TARIH'] as String),
      teslimTarihi: json['TESLIM_TARIHI'] == null
          ? null
          : DateTime.parse(json['TESLIM_TARIHI'] as String),
      brutFiyat: (json['BRUT_FIYAT'] as num?)?.toDouble(),
      depoKodu: json['DEPO_KODU'] as int?,
      kdvOrani: (json['KDV_ORANI'] as num?)?.toDouble(),
      miktar: (json['MIKTAR'] as num?)?.toDouble(),
      olcuBirimKodu: json['OLCU_BIRIM_KODU'] as int?,
      sira: json['SIRA'] as int?,
      hucreList: json['HUCRE_LIST'] as List<dynamic>?,
      kalemModelHucreList: json['KALEM_MODEL_HUCRE_LIST'] as List<dynamic>?,
      seriList: json['SERI_LIST'] as List<dynamic>?,
      tempBarkodList: json['TEMP_BARKOD_LIST'] as List<dynamic>?,
      belgeNo: json['BELGE_NO'] as String?,
      belgeTipi: json['BELGE_TIPI'] as String?,
      cariKodu: json['CARI_KODU'] as String?,
      depoTanimi: json['DEPO_TANIMI'] as String?,
      olcuBirimAdi: json['OLCU_BIRIM_ADI'] as String?,
      stokAdi: json['STOK_ADI'] as String?,
      stokKodu: json['STOK_KODU'] as String?,
      stokOlcuBirimi: json['STOK_OLCU_BIRIMI'] as String?,
      dovizKuru: (json['DOVIZ_KURU'] as num?)?.toDouble(),
      dovizTipi: json['DOVIZ_TIPI'] as int?,
      dovizliFiyat: (json['DOVIZLI_FIYAT'] as num?)?.toDouble(),
      aciklama1: json['ACIKLAMA1'] as String?,
      aciklama10: json['ACIKLAMA10'] as String?,
      aciklama2: json['ACIKLAMA2'] as String?,
      aciklama3: json['ACIKLAMA3'] as String?,
      aciklama4: json['ACIKLAMA4'] as String?,
      aciklama5: json['ACIKLAMA5'] as String?,
      aciklama6: json['ACIKLAMA6'] as String?,
      aciklama7: json['ACIKLAMA7'] as String?,
      aciklama8: json['ACIKLAMA8'] as String?,
      aciklama9: json['ACIKLAMA9'] as String?,
      ekalan1: json['EKALAN1'] as String?,
      ekalan2: json['EKALAN2'] as String?,
      isk1Tipi: json['ISK1_TIPI'] as int?,
      isk2Tipi: json['ISK2_TIPI'] as int?,
      isk3Tipi: json['ISK3_TIPI'] as int?,
      iskonto1: (json['ISKONTO1'] as num?)?.toDouble(),
      iskonto2: (json['ISKONTO2'] as num?)?.toDouble(),
      iskonto3: (json['ISKONTO3'] as num?)?.toDouble(),
      malfazIskAdedi: (json['MALFAZ_ISK_ADEDI'] as num?)?.toDouble(),
      miktar2: (json['MIKTAR2'] as num?)?.toDouble(),
      projeKodu: json['PROJE_KODU'] as String?,
      satisFiyati: (json['SATIS_FIYATI'] as num?)?.toDouble(),
      dovizKodu: json['DOVIZ_KODU'] as int?,
      dovizFiyati: (json['DOVIZ_FIYATI'] as num?)?.toDouble(),
      malfazCevrimliMiktar:
          (json['MALFAZ_CEVRIMLI_MIKTAR'] as num?)?.toDouble(),
      malFazlasiMiktar: (json['MAL_FAZLASI_MIKTAR'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$KalemModelToJson(KalemModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ISKONTO1_ORAN_MI', instance.iskonto1OranMi);
  writeNotNull('TARIH', instance.tarih?.toIso8601String());
  writeNotNull('TESLIM_TARIHI', instance.teslimTarihi?.toIso8601String());
  writeNotNull('BRUT_FIYAT', instance.brutFiyat);
  writeNotNull('DEPO_KODU', instance.depoKodu);
  writeNotNull('KDV_ORANI', instance.kdvOrani);
  writeNotNull('MIKTAR', instance.miktar);
  writeNotNull('OLCU_BIRIM_KODU', instance.olcuBirimKodu);
  writeNotNull('SIRA', instance.sira);
  writeNotNull('HUCRE_LIST', instance.hucreList);
  writeNotNull('KALEM_MODEL_HUCRE_LIST', instance.kalemModelHucreList);
  writeNotNull('SERI_LIST', instance.seriList);
  writeNotNull('TEMP_BARKOD_LIST', instance.tempBarkodList);
  writeNotNull('BELGE_NO', instance.belgeNo);
  writeNotNull('BELGE_TIPI', instance.belgeTipi);
  writeNotNull('CARI_KODU', instance.cariKodu);
  writeNotNull('DEPO_TANIMI', instance.depoTanimi);
  writeNotNull('OLCU_BIRIM_ADI', instance.olcuBirimAdi);
  writeNotNull('STOK_ADI', instance.stokAdi);
  writeNotNull('STOK_KODU', instance.stokKodu);
  writeNotNull('STOK_OLCU_BIRIMI', instance.stokOlcuBirimi);
  writeNotNull('DOVIZ_KURU', instance.dovizKuru);
  writeNotNull('DOVIZ_TIPI', instance.dovizTipi);
  writeNotNull('DOVIZLI_FIYAT', instance.dovizliFiyat);
  writeNotNull('ACIKLAMA1', instance.aciklama1);
  writeNotNull('ACIKLAMA10', instance.aciklama10);
  writeNotNull('ACIKLAMA2', instance.aciklama2);
  writeNotNull('ACIKLAMA3', instance.aciklama3);
  writeNotNull('ACIKLAMA4', instance.aciklama4);
  writeNotNull('ACIKLAMA5', instance.aciklama5);
  writeNotNull('ACIKLAMA6', instance.aciklama6);
  writeNotNull('ACIKLAMA7', instance.aciklama7);
  writeNotNull('ACIKLAMA8', instance.aciklama8);
  writeNotNull('ACIKLAMA9', instance.aciklama9);
  writeNotNull('EKALAN1', instance.ekalan1);
  writeNotNull('EKALAN2', instance.ekalan2);
  writeNotNull('ISK1_TIPI', instance.isk1Tipi);
  writeNotNull('ISK2_TIPI', instance.isk2Tipi);
  writeNotNull('ISK3_TIPI', instance.isk3Tipi);
  writeNotNull('ISKONTO1', instance.iskonto1);
  writeNotNull('ISKONTO2', instance.iskonto2);
  writeNotNull('ISKONTO3', instance.iskonto3);
  writeNotNull('MALFAZ_ISK_ADEDI', instance.malfazIskAdedi);
  writeNotNull('MIKTAR2', instance.miktar2);
  writeNotNull('PROJE_KODU', instance.projeKodu);
  writeNotNull('SATIS_FIYATI', instance.satisFiyati);
  writeNotNull('DOVIZ_KODU', instance.dovizKodu);
  writeNotNull('DOVIZ_FIYATI', instance.dovizFiyati);
  writeNotNull('MALFAZ_CEVRIMLI_MIKTAR', instance.malfazCevrimliMiktar);
  writeNotNull('MAL_FAZLASI_MIKTAR', instance.malFazlasiMiktar);
  return val;
}
