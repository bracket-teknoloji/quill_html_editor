import "package:freezed_annotation/freezed_annotation.dart";

import "../../../../../../../core/base/model/base_network_mixin.dart";

part "evraklar_model.freezed.dart";
part "evraklar_model.g.dart";

@unfreezed
sealed class EvraklarModel with _$EvraklarModel, NetworkManagerMixin {
  factory EvraklarModel({
    int? id,
    String? belgeNo,
    String? aciklama,
    String? belgeTipi,
    String? resimUrl,
    String? resimUrlKucuk,
    int? boyutByte,
    int? islemKodu,
  }) = _EvraklarModel;
  EvraklarModel._();

  factory EvraklarModel.fromJson(Map<String, dynamic> json) => _$EvraklarModelFromJson(json);

  factory EvraklarModel.forDelete(EvraklarModel model) => EvraklarModel(
    belgeNo: model.belgeNo,
    id: model.id,
    boyutByte: model.boyutByte,
    belgeTipi: model.belgeTipi,
    islemKodu: 2,
  );

  @override
  EvraklarModel fromJson(Map<String, dynamic> json) => _$EvraklarModelFromJson(json);
}
