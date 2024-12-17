import "package:freezed_annotation/freezed_annotation.dart";

import "base_network_mixin.dart";

part "doviz_kurlari_model.freezed.dart";
part "doviz_kurlari_model.g.dart";

@unfreezed
abstract class DovizKurlariModel with _$DovizKurlariModel, NetworkManagerMixin {
  @JsonSerializable(
    createFactory: true,
    explicitToJson: true,
    createToJson: true,
  )
  factory DovizKurlariModel({
    DateTime? tarih,
    int? sira,
    int? dovizTipi,
    double? dovAlis,
    double? dovSatis,
    String? dovizAdi,
    double? effAlis,
    double? effSatis,
  }) = _DovizKurlariModel;
  DovizKurlariModel._();
  factory DovizKurlariModel.fromJson(Map<String, dynamic> json) => _$DovizKurlariModelFromJson(json);
  @override
  DovizKurlariModel fromJson(Map<String, dynamic> json) => _$DovizKurlariModelFromJson(json);

  @override
  String toString() => toJson().toString();
}

@unfreezed
abstract class DovizKurlariRequestModel with _$DovizKurlariRequestModel, NetworkManagerMixin {
  @JsonSerializable(
    createFactory: true,
    explicitToJson: true,
    createToJson: true,
    fieldRename: FieldRename.pascal,
  )
  factory DovizKurlariRequestModel({
    DateTime? tarih,
    int? sira,
    int? dovizTipi,
    double? alis,
    double? satis,
    String? dovizAdi,
    double? eFAlis,
    double? eFSatis,
  }) = _DovizKurlariRequestModel;
  DovizKurlariRequestModel._();
  factory DovizKurlariRequestModel.fromJson(Map<String, dynamic> json) => _$DovizKurlariRequestModelFromJson(json);
  factory DovizKurlariRequestModel.fromDovizKurlariModel(
    DovizKurlariModel model,
  ) =>
      DovizKurlariRequestModel(
        alis: model.dovAlis,
        satis: model.dovSatis,
        dovizAdi: model.dovizAdi,
        dovizTipi: model.dovizTipi,
        eFAlis: model.effAlis,
        eFSatis: model.effSatis,
        sira: model.sira,
        tarih: model.tarih,
      );
  @override
  DovizKurlariRequestModel fromJson(Map<String, dynamic> json) => _$DovizKurlariRequestModelFromJson(json);

  @override
  String toString() => toJson().toString();
}
