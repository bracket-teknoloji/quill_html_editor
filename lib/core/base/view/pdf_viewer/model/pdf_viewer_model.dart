import "package:freezed_annotation/freezed_annotation.dart";

import "../../../model/base_network_mixin.dart";

part "pdf_viewer_model.freezed.dart";
part "pdf_viewer_model.g.dart";

@unfreezed
abstract class PdfModel with _$PdfModel, NetworkManagerMixin {
  PdfModel._();
  @JsonSerializable(createFactory: true, explicitToJson: true, createToJson: true)
  factory PdfModel({
    String? raporOzelKod,
    bool? standart,
    DicParams? dicParams,
    int? dizaynId,
    int? etiketSayisi,
  }) = _PdfModel;
  // String? raporOzelKod;
  // bool? standart;
  // int? dizaynId;
  // int? etiketSayisi;
  // @JsonKey(includeToJson: true)
  // DicParams? dicParams;
  factory PdfModel.fromJson(Map<String, dynamic> json) => _$PdfModelFromJson(json);
  @override
  fromJson(Map<String, dynamic> json) => _$PdfModelFromJson(json);

  @override
  toString() => toJson().toString();
}

// @JsonSerializable()
// class DicParams {
//   DicParams(
//       {this.cariKodu,
//       this.stokKodu,
//       this.sifirHaric,
//       this.maliyetTipi,
//       this.tlHarDokulsun,
//       this.depoKodlari,
//       this.haricStokKodlari,
//       this.haricStokGrupKodlari,
//       this.dovizTipi,
//       this.bastar,
//       this.bittar,
//       this.grupKodu,
//       this.borcAlacak,
//       this.refTarih,
//       this.tarihTipi,
//       this.kod1,
//       this.kod2,
//       this.kod3,
//       this.kod4,
//       this.kod5,
//       this.plasiyerKodu,
//       this.aralikTipi,
//       this.sirala,
//       this.bakiyeDurumu,
//       this.caharInckey,
//       this.belgeTipi,
//       this.belgeNo,
//       this.isemriNo,
//       this.dinamikParam,
//       this.kasaharInckey});

//   String? cariKodu;
//   String? stokKodu;
//   String? sifirHaric;
//   String? maliyetTipi;
//   String? tlHarDokulsun;
//   String? depoKodlari;
//   String? haricStokKodlari;
//   String? haricStokGrupKodlari;
//   String? dovizTipi;
//   String? bastar;
//   String? bittar;
//   String? grupKodu;
//   String? borcAlacak;
//   String? refTarih;
//   String? tarihTipi;
//   String? kod1;
//   String? kod2;
//   String? kod3;
//   String? kod4;
//   String? kod5;
//   String? plasiyerKodu;
//   String? aralikTipi;
//   String? sirala;
//   String? bakiyeDurumu;
//   String? caharInckey;
//   String? belgeTipi;
//   String? belgeNo;
//   String? isemriNo;
//   String? dinamikParam;
//   String? kasaharInckey;

//   factory DicParams.fromJson(Map<String, dynamic> json) => _$DicParamsFromJson(json);

//   Map<String, dynamic> toJson() => _$DicParamsToJson(this);

//   @override
//   toString() => toJson().toString();
// }
@unfreezed
class DicParams with _$DicParams {
  @JsonSerializable(createFactory: true, explicitToJson: true, createToJson: true)
  factory DicParams({
    String? cariKodu,
    String? stokKodu,
    String? sifirHaric,
    String? maliyetTipi,
    String? tlHarDokulsun,
    String? depoKodlari,
    String? haricStokKodlari,
    String? haricStokGrupKodlari,
    String? dovizTipi,
    String? bastar,
    String? bittar,
    String? grupKodu,
    String? borcAlacak,
    String? refTarih,
    String? tarihTipi,
    String? kod1,
    String? kod2,
    String? kod3,
    String? kod4,
    String? kod5,
    String? kapali,
    String? durum,
    String? vergiNo,
    String? plasiyerKodu,
    String? aralikTipi,
    String? sirala,
    String? bakiyeDurumu,
    String? caharInckey,
    String? belgeTipi,
    String? belgeNo,
    String? isemriNo,
    String? dinamikParam,
    String? kasaharInckey,
    String? uretimFiyatiDahil,
    String? fiyatTipi,
    String? tblnfStokfiyatgecmisiId,
    String? gorunecekAlanlar,
    int? miktar,
    String? yapkod,
    String? kasaKodu,
    String? muhasebeKodu,
  }) = _DicParams;
  factory DicParams.fromJson(Map<String, dynamic> json) => _$DicParamsFromJson(json);
}
