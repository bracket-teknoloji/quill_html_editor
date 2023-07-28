import 'package:json_annotation/json_annotation.dart';

import '../../../../../../core/base/model/base_network_mixin.dart';

part 'base_siparis_edit_model.g.dart';

@JsonSerializable(createToJson: true, fieldRename: FieldRename.screamingSnake, createFactory: true)
class BaseSiparisEditModel with NetworkManagerMixin {
  String? islemId;
  int? tempKayitTipi;
  int? tempBelgeId;
  bool? tempBelgeMi;
  bool? remoteTempBelge;
  String? remoteTempBelgeEtiketi;
  CariModel? cariModel;
  List<dynamic>? tempSipList;
  List<KalemModel>? kalemModelList;
  DateTime? tarih;
  DateTime? teslimTarihi;
  DateTime? istenilenTeslimTarihi;
  String? belgeNo;
  String? belgeTuru;
  String? belgeKodu;
  String? acik1;
  String? acik2;
  String? acik7;
  String? acik8;
  int? kalemModelAdedi;
  String? cariKodu;
  String? cariAdi;
  int? tipi;
  DateTime? vadeTarihi;
  String? kdvDahil;
  String? kayityapankul;
  DateTime? kayittarihi;
  double? kdv;
  double? genelToplam;
  List<KalemModel>? kalemModeller;

  BaseSiparisEditModel();
  //singleton
  static BaseSiparisEditModel? _instance;
  static BaseSiparisEditModel get instance {
    _instance ??= BaseSiparisEditModel._init();
    return _instance!;
  }

  BaseSiparisEditModel._init();

  //setter for singleton
  static void setInstance(BaseSiparisEditModel instance) => _instance = instance;

  @override
  fromJson(Map<String, dynamic> json) => _$BaseSiparisEditModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$BaseSiparisEditModelToJson(this);
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
