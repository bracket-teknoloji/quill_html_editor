import "package:json_annotation/json_annotation.dart";

import "../../../../../../core/base/model/base_network_mixin.dart";

part "cari_kosullar_model.g.dart";

@JsonSerializable()
final class CariKosullarModel with NetworkManagerMixin {
  CariKosullarModel();
  factory CariKosullarModel.fromJson(Map<String, dynamic> json) => _$CariKosullarModelFromJson(json);
  String? kosulSabitAdi;
  String? kosulKodu;
  int? genisk1o;
  int? genisk2o;
  int? genisk3o;
  String? genelKosulAdi;
  String? baslangictar;
  int? vadeGunu;
  int? genisk1Tipi;
  int? genisk2Tipi;
  int? genisk3Tipi;
  int? satisk1Tipi;
  int? satisk2Tipi;
  int? satisk3Tipi;
  int? satisk4Tipi;
  int? satisk5Tipi;
  int? satisk6Tipi;
  String? iskAraAktif;
  String? iskAraMiktut;
  double? iskAraDeger1;
  double? iskAraDeger2;
  double? iskAraDeger3;
  double? iskAraHangiIsk;
  double? iskAraIsk1;
  double? iskAraIsk2;
  double? iskAraIsk3;
  DateTime? fiyatTarihi;
  String? odemeKodu;
  @override
  CariKosullarModel fromJson(Map<String, dynamic> json) => _$CariKosullarModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$CariKosullarModelToJson(this);
}
