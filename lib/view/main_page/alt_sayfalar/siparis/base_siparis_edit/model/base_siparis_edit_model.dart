import 'package:json_annotation/json_annotation.dart';

import '../../../../../../core/base/model/base_network_mixin.dart';

part 'base_siparis_edit_model.g.dart';

@JsonSerializable(createToJson: true, fieldRename: FieldRename.screamingSnake, createFactory: true, includeIfNull: false)
class BaseSiparisEditModel with NetworkManagerMixin {
  //singleton
  static BaseSiparisEditModel? _instance;
  static BaseSiparisEditModel get instance {
    _instance ??= BaseSiparisEditModel._init();
    return _instance!;
  }

  DateTime? duzeltmetarihi;
  int? kalemAdedi;
  String? cariEfaturami;
  String? cYedek6;
  String? duzeltmeyapankul;
  String? plasiyerAciklama;
  String? projeAciklama;
  @JsonKey(
    includeFromJson: false,
  )
  String? tempJsonData;
  String? teslimCariAdi;
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
  double? ekMaliyet1Tutari;
  double? ekMaliyet2Tutari;
  double? ekMaliyet3Tutari;
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
  List<KalemModel>? kalemList;
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
  BaseSiparisEditModel();

  BaseSiparisEditModel._init();

  bool get isEmpty => this == BaseSiparisEditModel();

  double get getToplamIskonto => (genelIskonto1 ?? 0) + (genelIskonto2 ?? 0) + (genelIskonto3 ?? 0);
  double get getBrutTutar => kalemList?.map((e) => e.brutFiyat).toList().fold(0, (a, b) => (a ?? 0) + (b ?? 0)) ?? 0;

  @override
  //override ==
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BaseSiparisEditModel &&
        other.acik1 == acik1 &&
        other.acik2 == acik2 &&
        other.acik7 == acik7 &&
        other.acik8 == acik8 &&
        other.belgeKodu == belgeKodu &&
        other.belgeNo == belgeNo &&
        other.belgeTuru == belgeTuru &&
        other.cariAdi == cariAdi &&
        other.cariKodu == cariKodu &&
        other.genelToplam == genelToplam &&
        other.islemId == islemId &&
        other.istenilenTeslimTarihi == istenilenTeslimTarihi &&
        other.kalemModelAdedi == kalemModelAdedi &&
        other.kalemModeller == kalemModeller &&
        other.kayittarihi == kayittarihi &&
        other.kayityapankul == kayityapankul &&
        other.kdv == kdv &&
        other.kdvDahil == kdvDahil &&
        other.remoteTempBelge == remoteTempBelge &&
        other.remoteTempBelgeEtiketi == remoteTempBelgeEtiketi &&
        other.tarih == tarih &&
        other.tempBelgeId == tempBelgeId &&
        other.tempBelgeMi == tempBelgeMi &&
        other.tempKayitTipi == tempKayitTipi &&
        other.tempSipList == tempSipList &&
        other.teslimTarihi == teslimTarihi &&
        other.tipi == tipi &&
        other.vadeTarihi == vadeTarihi;
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
  DateTime? duzeltmetarihi;
  DateTime? kayittarihi;
  double? alacakToplami;
  double? bakiye;
  double? borcToplami;
  double? boylam;
  double? enlem;
  int? subeKodu;
  String? cariAdi;
  String? cariAdres;
  String? cariIl;
  String? cariIlce;
  String? cariKodu;
  String? cariTel;
  String? cariTip;
  String? cariTipAciklama;
  String? duzeltmeyapankul;
  String? efaturaCarisi;
  String? efaturaTipi;
  String? email;
  String? fax;
  String? hesaptutmasekli;
  String? kayityapankul;
  String? kilit;
  String? kosulKodu;
  String? kull1S;
  String? kull2S;
  String? odemeTipi;
  String? plasiyerAciklama;
  String? plasiyerKodu;
  String? riskTakibi;
  String? ulkeAdi;
  String? ulkeKodu;
  String? vergiDairesi;
  String? vergiNumarasi;
  String? web;

  CariModel();

  factory CariModel.fromJson(Map<String, dynamic> json) => _$CariModelFromJson(json);

  Map<String, dynamic> toJson() => _$CariModelToJson(this);
}

@JsonSerializable(createToJson: true, fieldRename: FieldRename.screamingSnake, includeIfNull: false, createFactory: true)
class KalemModel {
  bool? iskonto1OranMi;
  DateTime? tarih;
  DateTime? teslimTarihi;
  double? brutFiyat;
  int? depoKodu;
  double? kdvOrani;
  double? miktar;
  int? olcuBirimKodu;
  int? sira;
  List<dynamic>? hucreList;
  List<dynamic>? kalemModelHucreList;
  List<dynamic>? seriList;
  List<dynamic>? tempBarkodList;
  String? belgeNo;
  String? belgeTipi;
  String? cariKodu;
  String? depoTanimi;
  String? olcuBirimAdi;
  String? stokAdi;
  String? stokKodu;
  String? stokOlcuBirimi;

  KalemModel();

  factory KalemModel.fromJson(Map<String, dynamic> json) => _$KalemModelFromJson(json);

  Map<String, dynamic> toJson() => _$KalemModelToJson(this);
}
