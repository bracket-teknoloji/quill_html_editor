import "package:freezed_annotation/freezed_annotation.dart";
import "package:picker/core/base/model/base_network_mixin.dart";

part "ozel_hesap_kapatma_save_model.freezed.dart";
part "ozel_hesap_kapatma_save_model.g.dart";

@unfreezed
class OzelHesapKapatmaSaveModel with _$OzelHesapKapatmaSaveModel, NetworkManagerMixin {
  factory OzelHesapKapatmaSaveModel({List<int>? arrHedefInckeyno, String? cariKodu, int? kaynakInckeyno}) =
      _OzelHesapKapatmaSaveModel;
  OzelHesapKapatmaSaveModel._();

  factory OzelHesapKapatmaSaveModel.fromJson(Map<String, dynamic> json) => _$OzelHesapKapatmaSaveModelFromJson(json);

  @override
  NetworkManagerMixin? fromJson(Map<String, dynamic> json) => OzelHesapKapatmaSaveModel.fromJson(json);
}
