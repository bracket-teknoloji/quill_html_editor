import 'package:json_annotation/json_annotation.dart';
import 'package:picker/core/base/model/base_network_mixin.dart';

part "cari_kosullar_model.g.dart";

@JsonSerializable(fieldRename: FieldRename.screamingSnake, createToJson: true)
class CariKosullarModel with NetworkManagerMixin {
  String? kosulSabitAdi;
  String? kosulKodu;
  int? genisk1O;
  int? genisk2O;
  int? genisk3O;
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

  @override
  fromJson(Map<String, dynamic> json) => _$CariKosullarModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$CariKosullarModelToJson(this);
}
