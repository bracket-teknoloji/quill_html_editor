import "package:freezed_annotation/freezed_annotation.dart";

part "evrak_edit_model.freezed.dart";
part "evrak_edit_model.g.dart";

@unfreezed
class EvrakEditModel with _$EvrakEditModel {
  EvrakEditModel._();
  factory EvrakEditModel({
    String? aciklama,
    String? base64Data,
    String? belgeNo,
    String? belgeTipi,
    int? boyutByte,
    int? islemKodu,
  }) = _EvrakEditModel;

  factory EvrakEditModel.fromJson(Map<String, dynamic> json) => _$EvrakEditModelFromJson(json);
}
