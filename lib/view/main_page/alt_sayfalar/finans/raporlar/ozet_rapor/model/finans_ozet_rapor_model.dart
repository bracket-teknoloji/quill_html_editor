import "package:freezed_annotation/freezed_annotation.dart";

import "../../../../../../../core/base/model/base_network_mixin.dart";

part "finans_ozet_rapor_model.freezed.dart";
part "finans_ozet_rapor_model.g.dart";

@unfreezed
sealed class FinansOzetRaporModel with _$FinansOzetRaporModel, NetworkManagerMixin {
  factory FinansOzetRaporModel({String? tabloTipi, String? belgeTipi, int? ayKodu, double? tutar1, double? tutar2}) =
      _FinansOzetRaporModel;
  FinansOzetRaporModel._();

  factory FinansOzetRaporModel.fromJson(Map<String, dynamic> json) => _$FinansOzetRaporModelFromJson(json);

  @override
  FinansOzetRaporModel fromJson(Map<String, dynamic> json) => _$FinansOzetRaporModelFromJson(json);
}
