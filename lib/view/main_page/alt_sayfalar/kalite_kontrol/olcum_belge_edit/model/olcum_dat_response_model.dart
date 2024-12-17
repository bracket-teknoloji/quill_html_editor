import "package:freezed_annotation/freezed_annotation.dart";

import "../../../../../../core/base/model/base_network_mixin.dart";

part "olcum_dat_response_model.freezed.dart";
part "olcum_dat_response_model.g.dart";

@freezed
class OlcumDatResponseModel with _$OlcumDatResponseModel, NetworkManagerMixin {
  const factory OlcumDatResponseModel({
    String? girisDepo,
    String? cikisDepo,
    String? stokKodu,
    String? seriNo,
    double? miktar,
  }) = _OlcumDatResponseModel;
  const OlcumDatResponseModel._();

  factory OlcumDatResponseModel.fromJson(Map<String, dynamic> json) => _$OlcumDatResponseModelFromJson(json);

  @override
  OlcumDatResponseModel fromJson(Map<String, dynamic> json) => _$OlcumDatResponseModelFromJson(json);
}
