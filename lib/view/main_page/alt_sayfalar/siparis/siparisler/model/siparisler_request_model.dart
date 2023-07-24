import 'package:json_annotation/json_annotation.dart';

part 'siparisler_request_model.g.dart';

// @JsonSerializable(includeIfNull: false, createToJson: true, createFactory: true, explicitToJson: true, fieldRename: FieldRename.pascal)
@JsonSerializable(createToJson: true, fieldRename: FieldRename.pascal)
class SiparislerRequestModel {
  String? pickerBelgeTuru;
  bool? iadeMi;
  String? cariKodu;
  String? ozelKod2;
  String? cariTipi;
  String? miktarGetir;
  String? siralama;
  String? siparisKarsilanmaDurumu;
  String? ozelKod1;
  String? kapaliBelgelerListelenmesin;
  String? projeKodu;
  bool? faturalasmaGoster;
  String? arrKod5;
  String? arrGrupKodu;
  String? arrKod4;
  String? arrKod3;
  String? arrKod2;
  String? arrPlasiyerKodu;
  String? arrKod1;
  String? ekranTipi;
  int? sayfa;
  String? baslamaTarihi;
  String? bitisTarihi;
  String? searchText;

  SiparislerRequestModel({
    this.pickerBelgeTuru,
    this.iadeMi,
    this.cariKodu,
    this.ozelKod2,
    this.cariTipi,
    this.miktarGetir,
    this.siralama,
    this.siparisKarsilanmaDurumu,
    this.ozelKod1,
    this.kapaliBelgelerListelenmesin,
    this.projeKodu,
    this.faturalasmaGoster,
    this.arrKod5,
    this.arrGrupKodu,
    this.arrKod4,
    this.arrKod3,
    this.arrKod2,
    this.arrPlasiyerKodu,
    this.arrKod1,
    this.ekranTipi,
    this.sayfa,
    this.baslamaTarihi,
    this.bitisTarihi,
    this.searchText,
  });
  Map<String, dynamic> toJson() => _$SiparislerRequestModelToJson(this);
}
