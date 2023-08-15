import "package:json_annotation/json_annotation.dart";

import "../../../../../../core/base/model/base_network_mixin.dart";

part "fiyat_gecmisi_model.g.dart";

@JsonSerializable(fieldRename: FieldRename.pascal)
class FiyatGecmisiModel with NetworkManagerMixin {
  String? alisSatis;
  String? baslamaTarihi;
  String? bitisTarihi;
  String? ekranTipi;
  String? sirala;
  String? yazdirildi;
  String? fiyatTipi;

  @override
  fromJson(Map<String, dynamic> json) => _$FiyatGecmisiModelFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$FiyatGecmisiModelToJson(this);
}
