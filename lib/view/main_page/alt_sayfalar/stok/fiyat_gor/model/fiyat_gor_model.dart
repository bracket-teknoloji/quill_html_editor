import "package:json_annotation/json_annotation.dart";
import "package:picker/core/base/model/base_network_mixin.dart";

part "fiyat_gor_model.g.dart";

@JsonSerializable()
class FiyatGorModel with NetworkManagerMixin {
  String? stokKodu;
  String? aS;
  int? dovizTipi;
  double? fiyat1;
  double? fiyat2;
  double? fiyat3;
  double? fiyat4;
  double? kdvOrani;
  @override
  fromJson(Map<String, dynamic> json) => _$FiyatGorModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$FiyatGorModelToJson(this);
}
