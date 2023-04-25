import 'package:json_annotation/json_annotation.dart';

import '../../../../../../core/base/model/base_network_mixin.dart';

part 'cari_listesi_model.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.screamingSnake, createToJson: true)
class CariListesiModel with NetworkManagerMixin{
  CariListesiModel();

  String? cariKodu;
  String? cariAdi;
  String? cariTip;
  String? cariTipAciklama;
  String? kilit;
  String? odemeTipi;
  String? hesaptutmasekli;
  int? subeKodu;
  String? plasiyerKodu;
  String? muhKodu;
  String? ulkeKodu;
  String? ulkeAdi;
  String? cariIl;
  String? cariIlce;
  String? vergiNumarasi;
  String? kayityapankul;
  String? kayittarihi;
  String? duzeltmetarihi;
  String? riskTakibi;
  
  @override
  fromJson(Map<String, dynamic> json) {
    return _$CariListesiModelFromJson(json);
  }
  
  @override
  Map<String, dynamic> toJson() {
    return _$CariListesiModelToJson(this);
  }


}
