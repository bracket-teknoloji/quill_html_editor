import "package:json_annotation/json_annotation.dart";

part "temsilci_profil_request_model.g.dart";

@JsonSerializable()
class TemsilciProfilRequestModel {
  TemsilciProfilRequestModel({
    this.cariKodu,
    this.donemTipi,
    this.satisIrsDahil,
    this.cariVKN,
    this.kdvDahil,
    this.iadeDurumu,
  });

  factory TemsilciProfilRequestModel.fromJson(Map<String, dynamic> json) => _$TemsilciProfilRequestModelFromJson(json);
  @JsonKey(name: "CariKodu")
  String? cariKodu;
  @JsonKey(name: "DonemTipi")
  String? donemTipi;
  @JsonKey(name: "SATIS_IRS_DAHIL")
  String? satisIrsDahil;
  @JsonKey(name: "CariVKN")
  String? cariVKN;
  @JsonKey(name: "KDVDahil")
  String? kdvDahil;
  @JsonKey(name: "IadeDurumu")
  String? iadeDurumu;

  Map<String, dynamic> toJson() => _$TemsilciProfilRequestModelToJson(this);
}
