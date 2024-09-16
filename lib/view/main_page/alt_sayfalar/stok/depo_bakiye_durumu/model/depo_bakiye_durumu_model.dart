import "package:freezed_annotation/freezed_annotation.dart";
import "../../../../../../core/base/model/base_network_mixin.dart";

part "depo_bakiye_durumu_model.freezed.dart";
part "depo_bakiye_durumu_model.g.dart";

@freezed
class DepoBakiyeDurumuModel with _$DepoBakiyeDurumuModel, NetworkManagerMixin {
  const DepoBakiyeDurumuModel._();
  const factory DepoBakiyeDurumuModel({
    int? subeKodu,
    int? depoKodu,
    String? stokKodu,
    double? giris,
    double? cikis,
    double? bakiye,
    String? subeAdi,
    String? stokAdi,
    String? depoAdi,
  }) = _DepoBakiyeDurumuModel;

  factory DepoBakiyeDurumuModel.fromJson(Map<String, dynamic> json) => _$DepoBakiyeDurumuModelFromJson(json);

  @override
  DepoBakiyeDurumuModel fromJson(Map<String, dynamic> json) => _$DepoBakiyeDurumuModelFromJson(json);
}
