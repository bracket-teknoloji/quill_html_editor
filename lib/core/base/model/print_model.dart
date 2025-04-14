import "package:freezed_annotation/freezed_annotation.dart";

import "../view/pdf_viewer/model/pdf_viewer_model.dart";
import "base_network_mixin.dart";

part "print_model.freezed.dart";
part "print_model.g.dart";

@freezed
abstract class PrintModel with _$PrintModel, NetworkManagerMixin {
  factory PrintModel({
    required String raporOzelKod,
    int? dizaynId,
    int? etiketSayisi,
    @Default(true) bool? yazdir,
    String? yaziciAdi,
    String? yaziciTipi,
    DicParams? dicParams,
    bool? standart,
    String? exportTipi,
  }) = _PrintModel;
  PrintModel._();

  // TODO export tipi bluetooth ise "IMG" olacak
  factory PrintModel.fromJson(Map<String, dynamic> json) => _$PrintModelFromJson(json);

  @override
  PrintModel fromJson(Map<String, dynamic> json) => _$PrintModelFromJson(json);
}
