import "package:json_annotation/json_annotation.dart";

import "../../../../../core/base/model/base_network_mixin.dart";

part "temsilci_profil_model.g.dart";

@JsonSerializable(createToJson: true, fieldRename: FieldRename.screamingSnake, includeIfNull: false)
class TemsilciProfilModel with NetworkManagerMixin {
    String? tabloTipi;
    String? kayitTipi;
    int? ayKodu;
    String? plasiyerKodu;
    String? plasiyerAciklama;
    double? tutar;
    
      @override
      fromJson(Map<String, dynamic> json) => _$TemsilciProfilModelFromJson(json);
    
      @override
      Map<String, dynamic> toJson() => _$TemsilciProfilModelToJson(this);

}