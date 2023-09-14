// import "package:json_annotation/json_annotation.dart";

// import "../view/pdf_viewer/model/pdf_viewer_model.dart";
// import "base_network_mixin.dart";

// part "print_model.g.dart";

// @JsonSerializable()
// class PrintModel with NetworkManagerMixin {
//   int? dizaynId;
//   int? etiketSayisi;
//   String? raporOzelKod;
//   bool? yazdir;
//   String? yaziciAdi;
//   String? yaziciTipi;
//   DicParams? dicParams;

//   PrintModel({
//     this.dizaynId,
//     this.etiketSayisi,
//     this.raporOzelKod,
//     this.yazdir,
//     this.yaziciAdi,
//     this.yaziciTipi,
//     this.dicParams,
//   });

//   @override
//   fromJson(Map<String, dynamic> json) => _$PrintModelFromJson(json);

//   @override
//   Map<String, dynamic> toJson() => _$PrintModelToJson(this);
// }
import "package:freezed_annotation/freezed_annotation.dart";
import "package:picker/core/base/model/base_network_mixin.dart";

import "../view/pdf_viewer/model/pdf_viewer_model.dart";

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
  fromJson(Map<String, dynamic> json) => _$PrintModelFromJson(json);
}
