import "package:json_annotation/json_annotation.dart";

import "../../../../../../core/base/model/base_network_mixin.dart";

part "cari_save_request_model.g.dart";

@JsonSerializable(fieldRename: FieldRename.screamingSnake, createToJson: true)
class CariSaveRequestModel with NetworkManagerMixin {
  //singleton
  static CariSaveRequestModel? _instance;
  static CariSaveRequestModel get instance {
    _instance ??= CariSaveRequestModel._init();
    return _instance!;
  }

  //setter for singleton
  static void setInstance(CariSaveRequestModel? instance) => _instance = instance;

  CariSaveRequestModel._init();
  CariSaveRequestModel();
  int? requestVersion;
  int? islemKodu;
  @JsonKey(name: "_YeniKayit")
  bool? yeniKayit;
  bool? sahisFirmasi;
  int? subeKodu;
  String? kodu;
  String? tipi;
  String? adi;
  String? ulkeKodu;
  String? sehir;
  String? ilce;
  String? adres;
  String? telefon;
  String? eposta;
  double? enlem;
  double? boylam;
  String? postaKodu;
  String? website;
  String? vergiDairesi;
  String? vergiNo;
  String? plasiyerKodu;
  bool? dovizli;
  int? dovizKodu;
  String? grupKodu;
  String? kod1;
  String? kod2;
  String? kod3;
  String? kod4;
  String? kod5;
  String? bilgi;
  String? kilit;
  String? bagliCari;
  String? kosulKodu;
  String? muhasebeKodu;
  String? kurfarkiborcKodu;
  String? kurfarkialacakKodu;
  int? vadeGunu;
  String? odemeTipi;
  bool? muhtelifCari;
  String? muhtelifBelgeTipi;
  String? muhtelifBelgeNo;
  String? efaturaSenaryo;
  String? kull1s;
  String? kull2s;
  String? kull3s;
  String? kull4s;
  String? kull5s;
  String? kull6s;
  String? kull7s;
  String? kull8s;
  double? kull1n;
  double? kull2n;
  double? kull3n;
  double? kull4n;
  double? kull5n;
  double? kull6n;
  double? kull7n;
  double? kull8n;
  String? aciklama1;
  String? aciklama2;
  String? aciklama3;

  @override
  fromJson(Map<String, dynamic> json) {
    return _$CariSaveRequestModelFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$CariSaveRequestModelToJson(this);
  }
}
