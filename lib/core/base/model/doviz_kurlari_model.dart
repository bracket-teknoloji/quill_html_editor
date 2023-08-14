

import "package:json_annotation/json_annotation.dart";
import "package:picker/core/base/model/base_network_mixin.dart";

part "doviz_kurlari_model.g.dart";

@JsonSerializable( explicitToJson: true, fieldRename: FieldRename.screamingSnake, createToJson: true, includeIfNull: false)
class DovizKurlariModel with NetworkManagerMixin{
    DateTime? tarih;
    int? sira;
    int? dovizTipi;
    double? dovAlis;
    double? dovSatis;
    String? dovizAdi;
    double? effAlis;
    double? effSatis;
    
      @override
      fromJson(Map<String, dynamic> json) => _$DovizKurlariModelFromJson(json);
    
      @override
      Map<String, dynamic> toJson() => _$DovizKurlariModelToJson(this);
}
