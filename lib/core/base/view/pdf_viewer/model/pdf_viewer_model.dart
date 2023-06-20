import 'package:json_annotation/json_annotation.dart';

import '../../../model/base_network_mixin.dart';

part 'pdf_viewer_model.g.dart';

@JsonSerializable(createToJson: true, fieldRename: FieldRename.screamingSnake, createFactory: true, includeIfNull: false, explicitToJson: true)
class PdfModel with NetworkManagerMixin {
  PdfModel({this.raporOzelKod, this.standart, this.dicParams, this.dizaynId, this.etiketSayisi});
  String? raporOzelKod;
  bool? standart;
  int? dizaynId;
  int? etiketSayisi;
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
      this.stokKodu,
      this.sifirHaric,
      this.maliyetTipi,
      this.tlHarDokulsun,
      this.depoKodlari,
      this.haricStokKodlari,
      this.haricStokGrupKodlari,
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
      this.bakiyeDurumu,
      this.caharInckey,
      this.belgeTipi,
      this.belgeNo,
      this.isemriNo, this.dinamikParam});

  String? cariKodu;
  String? stokKodu;
  String? sifirHaric;
  String? maliyetTipi;
  String? tlHarDokulsun;
  String? depoKodlari;
  String? haricStokKodlari;
  String? haricStokGrupKodlari;
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
  String? caharInckey;
  String? belgeTipi;
  String? belgeNo;
  String? isemriNo;
  String? dinamikParam;

  factory DicParams.fromJson(Map<String, dynamic> json) => _$DicParamsFromJson(json);

  Map<String, dynamic> toJson() => _$DicParamsToJson(this);

  @override
  toString() => toJson().toString();
}
