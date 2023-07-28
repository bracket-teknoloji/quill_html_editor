import 'package:json_annotation/json_annotation.dart';

import '../../../../../../core/base/model/base_network_mixin.dart';

part 'base_siparis_edit_model.g.dart';

@JsonSerializable(createToJson: true, fieldRename: FieldRename.screamingSnake, createFactory: true)
class BaseSiparisEditModel with NetworkManagerMixin {
  //singleton
  static BaseSiparisEditModel? _instance;
  static BaseSiparisEditModel get instance {
    _instance ??= BaseSiparisEditModel._init();
    return _instance!;
  }


  bool? kdvDahilmi;
  bool? remoteTempBelge;
  bool? tempBelgeMi;
  CariModel? cariModel;
  DateTime? islemeBaslamaTarihi;
  DateTime? istenilenTeslimTarihi;
  DateTime? kayittarihi;
  DateTime? kosulTarihi;
  DateTime? tarih;
  DateTime? teslimTarihi;
  DateTime? vadeTarihi;
  double? araToplam;
  double? ekMaliyet2Tutari;
  double? genelIskonto1;
  double? genelIskonto2;
  double? genelIskonto3;
  double? genelToplam;
  double? genIsk1O;
  double? genIsk1T;
  double? genIsk2O;
  double? genIsk2T;
  double? genIsk3O;
  double? genIsk3T;
  double? kdv;
  int? belgeTipi;
  int? cikisDepoKodu;
  double? ekMaliyet1Tutari;
  double? ekMaliyet3Tutari;
  int? genisk1Tipi;
  int? genisk2Tipi;
  int? genisk3Tipi;
  int? kalemModelAdedi;
  int? tempBelgeId;
  int? tempKayitTipi;
  int? tipi;
  int? topluDepo;
  int? vadeGunu;
  List<dynamic>? tempSipList;
  List<KalemModel>? kalemModeller;
  List<KalemModel>? kalemModelList;
  String? acik1;
  String? acik10;
  String? acik11;
  String? acik12;
  String? acik13;
  String? acik14;
  String? acik15;
  String? acik16;
  String? acik2;
  String? acik3;
  String? acik4;
  String? acik5;
  String? acik6;
  String? acik7;
  String? acik8;
  String? acik9;
  String? belgeKodu;
  String? belgeNo;
  String? belgeTuru;
  String? cariAdi;
  String? cariKodu;
  String? ekAcik1;
  String? ekAcik10;
  String? ekAcik11;
  String? ekAcik12;
  String? ekAcik13;
  String? ekAcik14;
  String? ekAcik15;
  String? ekAcik16;
  String? ekAcik2;
  String? ekAcik3;
  String? ekAcik4;
  String? ekAcik5;
  String? ekAcik6;
  String? ekAcik7;
  String? ekAcik8;
  String? ekAcik9;
  String? ekAciklama;
  String? islemId;
  String? kayityapankul;
  String? kdvDahil;
  String? kosulKodu;
  String? mevcutBelgeNo;
  String? mevcutCariKodu;
  String? odemeKodu;
  String? ozelKod1;
  String? ozelKod2;
  String? pickerBelgeTuru;
  String? plasiyerKodu;
  String? projeKodu;
  String? remoteTempBelgeEtiketi;
  String? tag;
    int? kalemAdedi;
    String? teslimCariAdi;
    String? projeAciklama;
    String? plasiyerAciklama;
    String? cYedek6;
    String? cariEfaturami;
  BaseSiparisEditModel();

  BaseSiparisEditModel._init();

  bool get isEmpty => this == BaseSiparisEditModel();

  @override
  //override ==
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BaseSiparisEditModel &&
        other.islemId == islemId &&
        other.tempKayitTipi == tempKayitTipi &&
        other.tempBelgeId == tempBelgeId &&
        other.tempBelgeMi == tempBelgeMi &&
        other.remoteTempBelge == remoteTempBelge &&
        other.remoteTempBelgeEtiketi == remoteTempBelgeEtiketi &&
        other.tempSipList == tempSipList &&
        other.tarih == tarih &&
        other.teslimTarihi == teslimTarihi &&
        other.istenilenTeslimTarihi == istenilenTeslimTarihi &&
        other.belgeNo == belgeNo &&
        other.belgeTuru == belgeTuru &&
        other.belgeKodu == belgeKodu &&
        other.acik1 == acik1 &&
        other.acik2 == acik2 &&
        other.acik7 == acik7 &&
        other.acik8 == acik8 &&
        other.kalemModelAdedi == kalemModelAdedi &&
        other.cariKodu == cariKodu &&
        other.cariAdi == cariAdi &&
        other.tipi == tipi &&
        other.vadeTarihi == vadeTarihi &&
        other.kdvDahil == kdvDahil &&
        other.kayityapankul == kayityapankul &&
        other.kayittarihi == kayittarihi &&
        other.kdv == kdv &&
        other.genelToplam == genelToplam &&
        other.kalemModeller == kalemModeller;
  }

  @override
  fromJson(Map<String, dynamic> json) => _$BaseSiparisEditModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$BaseSiparisEditModelToJson(this);

  //reset singleton
  static void resetInstance() => _instance = BaseSiparisEditModel();

  //setter for singleton
  static void setInstance(BaseSiparisEditModel instance) => _instance = instance;
}

@JsonSerializable(createToJson: true, fieldRename: FieldRename.screamingSnake, includeIfNull: false, createFactory: true)
class CariModel {
  String? cariKodu;
  String? cariAdi;
  String? cariTip;
  String? cariTipAciklama;
  String? kilit;
  String? odemeTipi;
  String? hesaptutmasekli;
  int? subeKodu;
  String? plasiyerKodu;
  String? plasiyerAciklama;
  double? borcToplami;
  double? alacakToplami;
  double? bakiye;
  String? kosulKodu;
  String? ulkeKodu;
  String? ulkeAdi;
  String? cariIl;
  String? cariIlce;
  String? cariTel;
  String? fax;
  String? email;
  String? web;
  String? cariAdres;
  String? vergiDairesi;
  String? vergiNumarasi;
  String? kayityapankul;
  DateTime? kayittarihi;
  String? duzeltmeyapankul;
  DateTime? duzeltmetarihi;
  String? efaturaTipi;
  double? enlem;
  double? boylam;
  String? kull1S;
  String? kull2S;
  String? riskTakibi;
  String? efaturaCarisi;

  CariModel();

  factory CariModel.fromJson(Map<String, dynamic> json) => _$CariModelFromJson(json);

  Map<String, dynamic> toJson() => _$CariModelToJson(this);
}

@JsonSerializable(createToJson: true, fieldRename: FieldRename.screamingSnake, includeIfNull: false, createFactory: true)
class KalemModel {
  List<dynamic>? tempBarkodList;
  int? sira;
  DateTime? tarih;
  DateTime? teslimTarihi;
  String? belgeNo;
  String? belgeTipi;
  String? stokKodu;
  String? stokAdi;
  String? cariKodu;
  int? depoKodu;
  String? depoTanimi;
  int? miktar;
  List<dynamic>? seriList;
  int? kdvOrani;
  int? brutFiyat;
  bool? iskonto1OranMi;
  int? olcuBirimKodu;
  String? olcuBirimAdi;
  String? stokOlcuBirimi;
  List<dynamic>? kalemModelHucreList;
  List<dynamic>? hucreList;

  KalemModel();

  factory KalemModel.fromJson(Map<String, dynamic> json) => _$KalemModelFromJson(json);

  Map<String, dynamic> toJson() => _$KalemModelToJson(this);
}
