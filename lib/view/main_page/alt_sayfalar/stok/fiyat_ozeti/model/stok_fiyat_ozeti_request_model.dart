import "package:freezed_annotation/freezed_annotation.dart";

import "../../stok_liste/model/stok_listesi_model.dart";

part "stok_fiyat_ozeti_request_model.freezed.dart";
part "stok_fiyat_ozeti_request_model.g.dart";

@unfreezed
class StokFiyatOzetiRequestModel with _$StokFiyatOzetiRequestModel {
  @JsonSerializable(fieldRename: FieldRename.pascal)
  factory StokFiyatOzetiRequestModel({String? yapKod, String? cariKodu, String? stokKodu}) =
      _StokFiyatOzetiRequestModel;

  factory StokFiyatOzetiRequestModel.fromJson(Map<String, dynamic> json) => _$StokFiyatOzetiRequestModelFromJson(json);

  factory StokFiyatOzetiRequestModel.fromStokListesiModel(StokListesiModel model) =>
      StokFiyatOzetiRequestModel(yapKod: model.yapkod, stokKodu: model.stokKodu);
}
