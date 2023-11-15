import "package:freezed_annotation/freezed_annotation.dart";
import "../../../../../../core/base/model/base_network_mixin.dart";

part "e_belge_pdf_model.freezed.dart";
part "e_belge_pdf_model.g.dart";

@unfreezed
class EBelgePdfModel with _$EBelgePdfModel, NetworkManagerMixin {
  EBelgePdfModel._();
  factory EBelgePdfModel({
    int? islemKodu,
    @JsonKey(name: "FileModel") FileModel? fileModel,
  }) = _EBelgePdfModel;

  factory EBelgePdfModel.fromJson(Map<String, dynamic> json) => _$EBelgePdfModelFromJson(json);

  @override
  EBelgePdfModel fromJson(Map<String, dynamic> json) => _$EBelgePdfModelFromJson(json);
}


@freezed
class FileModel with _$FileModel {
    const factory FileModel({
        String? byteData,
        String? uzanti,
        DateTime? dosyaTarihi,
        String? dosyaAdi,
    }) = _FileModel;

    factory FileModel.fromJson(Map<String, dynamic> json) => _$FileModelFromJson(json);
}
