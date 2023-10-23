import "package:freezed_annotation/freezed_annotation.dart";

import "../view/pdf_viewer/model/pdf_viewer_model.dart";
import "base_network_mixin.dart";

part "print_model.freezed.dart";
part "print_model.g.dart";

@freezed
class PrintModel with _$PrintModel, NetworkManagerMixin {
  PrintModel._();
  factory PrintModel({
    int? dizaynId,
    int? etiketSayisi,
    required String raporOzelKod,
    @Default(true) bool? yazdir,
    String? yaziciAdi,
    String? yaziciTipi,
    DicParams? dicParams,
    bool? standart,
  }) = _PrintModel;

  factory PrintModel.fromJson(Map<String, dynamic> json) => _$PrintModelFromJson(json);

  @override
  PrintModel fromJson(Map<String, dynamic> json) => _$PrintModelFromJson(json);
}
