import 'package:json_annotation/json_annotation.dart';
import 'package:picker/core/base/model/base_network_mixin.dart';

part 'pdf_viewer_model.g.dart';

@JsonSerializable(createToJson: true, fieldRename: FieldRename.screamingSnake, createFactory: true, includeIfNull: false, explicitToJson: true)
class PdfModel with NetworkManagerMixin {
  PdfModel({this.raporOzelKod, this.standart, this.dicParams});
  String? raporOzelKod;
  bool? standart;
  @JsonKey(includeToJson: true)
  DicParams? dicParams;

  @override
  fromJson(Map<String, dynamic> json) => _$PdfModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$PdfModelToJson(this);

  @override
  toString() => toJson().toString();
}

@JsonSerializable(createToJson: true, fieldRename: FieldRename.screamingSnake, includeIfNull: false)
class DicParams {
  DicParams(
      {this.cariKodu,
      this.tlHarDokulsun,
      this.dovizTipi,
      this.bastar,
      this.bittar,
      this.grupKodu,
      this.borcAlacak,
      this.refTarih,
      this.tarihTipi,
      this.kod1,
      this.kod2,
      this.kod3,
      this.kod4,
      this.kod5,
      this.plasiyerKodu,
      this.aralikTipi,
      this.sirala,
      this.bakiyeDurumu});

  String? cariKodu;
  String? tlHarDokulsun;
  String? dovizTipi;
  String? bastar;
  String? bittar;
  String? grupKodu;
  String? borcAlacak;
  String? refTarih;
  String? tarihTipi;
  String? kod1;
  String? kod2;
  String? kod3;
  String? kod4;
  String? kod5;
  String? plasiyerKodu;
  String? aralikTipi;
  String? sirala;
  String? bakiyeDurumu;

  factory DicParams.fromJson(Map<String, dynamic> json) => _$DicParamsFromJson(json);

  Map<String, dynamic> toJson() => _$DicParamsToJson(this);

  @override
  toString() => toJson().toString();
}
