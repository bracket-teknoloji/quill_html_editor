


import "package:json_annotation/json_annotation.dart";

import "../../../../../../../core/base/model/base_network_mixin.dart";

part "urun_grubuna_gore_satis_grafigi_request_model.g.dart";

@JsonSerializable(fieldRename: FieldRename.pascal, explicitToJson: true, createToJson: true, includeIfNull: false)
class UrunGrubunaGoreSatisGrafigiRequestModel with NetworkManagerMixin{
    List<String>? arrPlasiyerKodu;
    String? baslamaTarihi;
    String? bitisTarihi;
    String? cariKodu;
    String? donemTipi;
    int? grupNo;
    String? irsDahil;
    String? projeKodu;

    UrunGrubunaGoreSatisGrafigiRequestModel({
        this.arrPlasiyerKodu,
        this.baslamaTarihi,
        this.bitisTarihi,
        this.cariKodu,
        this.donemTipi,
        this.grupNo,
        this.irsDahil,
        this.projeKodu,
    });
    
      @override
      fromJson(Map<String, dynamic> json) => _$UrunGrubunaGoreSatisGrafigiRequestModelFromJson(json);
      @override
      Map<String, dynamic> toJson() => _$UrunGrubunaGoreSatisGrafigiRequestModelToJson(this);

    
}
