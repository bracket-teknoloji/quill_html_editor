import "package:freezed_annotation/freezed_annotation.dart";

import "../../../../../../../core/base/model/base_network_mixin.dart";
import "../../../../../../../core/base/model/base_stok_mixin.dart";
import "../../cek_senet_listesi/model/cek_senet_listesi_model.dart";

part "evraklar_request_model.freezed.dart";
part "evraklar_request_model.g.dart";

@unfreezed
class EvraklarRequestModel with _$EvraklarRequestModel, NetworkManagerMixin {
  EvraklarRequestModel._();
  @JsonSerializable(fieldRename: FieldRename.pascal)
  factory EvraklarRequestModel({
    String? belgeTipi,
    String? urlGetir,
    String? belgeNo,
  }) = _EvraklarRequestModel;

  factory EvraklarRequestModel.fromJson(Map<String, dynamic> json) => _$EvraklarRequestModelFromJson(json);

  @override
  EvraklarRequestModel fromJson(Map<String, dynamic> json) => _$EvraklarRequestModelFromJson(json);

  factory EvraklarRequestModel.fromCekSenetListesiModel(CekSenetListesiModel model) => EvraklarRequestModel(belgeTipi: model.belgeTipi, urlGetir: "E", belgeNo: model.belgeNo);

  factory EvraklarRequestModel.fromStokModel(BaseStokMixin model) => EvraklarRequestModel(belgeTipi: "STOK", urlGetir: "E", belgeNo: model.stokKodu);
}
