import 'package:json_annotation/json_annotation.dart';

import '../../../../../../core/base/model/base_network_mixin.dart';

part 'cari_listesi_model.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.screamingSnake, createToJson: true)
class CariListesiModel with NetworkManagerMixin {
  CariListesiModel();

      String? cariKodu;
    String? cariAdi;
    String? bagliCari;
    String? bagliCariAdi;
    String? cariTip;
    String? cariTipAciklama;
    String? kilit;
    int? vadeGunu;
    String? odemeTipi;
    String? hesaptutmasekli;
    String? plasiyerKodu;
    String? plasiyerAciklama;
    double? borcToplami;
    double? alacakToplami;
    int? genisk1Orani;
    String? ulkeKodu;
    String? ulkeAdi;
    String? cariIl;
    String? cariIlce;
    String? cariTel;
    String? postakodu;
    String? email;
    String? web;
    String? cariAdres;
    String? vergiDairesi;
    String? vergiNumarasi;
    String? grupKodu;
    String? grupTanimi;
    String? kod1;
    String? kod1Tanimi;
    String? kod2;
    String? kod2Tanimi;
    String? kod3;
    String? kod3Tanimi;
    String? kayityapankul;
    String? kayittarihi;
    String? duzeltmeyapankul;
    String? duzeltmetarihi;
    bool? efaturaMi;
    String? efaturaTipi;
    String? efatGecisTarihi;
    bool? efatAktif;
    String? riskTakibi;
    String? efaturaCarisi;
    double? bakiye;
    double? enlem;
    double? boylam;
    String? kull1S;
    String? kull2S;
    String? kull3S;
    String? kull4S;
    String? kull5S;
    String? kull6S;
    String? kull7S;
    String? kull8S;
    int? kull1N;
    int? kull2N;
    int? kull3N;
    int? kull4N;
    int? kull5N;
    int? kull6N;
    int? kull7N;
    int? kull8N;
    String? fax;
    bool? sahisFirmasiMi;
    bool? dovizli;
    int? dovizKodu;
    String? dovizAdi;
    int? subeKodu;
    String? kosulKodu;
    String? fiyatGrubu;
  @override
  fromJson(Map<String, dynamic> json) {
    return _$CariListesiModelFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$CariListesiModelToJson(this);
  }
}
