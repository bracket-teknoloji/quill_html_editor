import "package:freezed_annotation/freezed_annotation.dart";

import "base_network_mixin.dart";

part "tcmb_bankalar_model.freezed.dart";
part "tcmb_bankalar_model.g.dart";

@unfreezed
class TcmbBankalarModel with _$TcmbBankalarModel, NetworkManagerMixin {
  TcmbBankalarModel._();
  factory TcmbBankalarModel({
    String? bankakodu,
    String? bankaadi,
    String? subekodu,
    String? subeadi,
    String? sehiradi,
  }) = _TcmbBankalarModel;

  factory TcmbBankalarModel.fromJson(Map<String, dynamic> json) => _$TcmbBankalarModelFromJson(json);

  @override
  TcmbBankalarModel fromJson(Map<String, dynamic> json) => TcmbBankalarModel.fromJson(json);
}
