import "package:json_annotation/json_annotation.dart";

import "base_network_mixin.dart";

part "siradaki_belge_no_model.g.dart";

@JsonSerializable(fieldRename: FieldRename.pascal, createFactory: true)
final class SiradakiBelgeNoModel with NetworkManagerMixin {
  SiradakiBelgeNoModel({this.seri, this.belgeTipi, this.eIrsaliye, this.cariKodu, this.belgeNo});
  String? seri;
  String? belgeTipi;
  String? eIrsaliye;
  String? cariKodu;
  String? belgeNo;

  @override
  SiradakiBelgeNoModel fromJson(Map<String, dynamic> json) => _$SiradakiBelgeNoModelFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$SiradakiBelgeNoModelToJson(this);
}
