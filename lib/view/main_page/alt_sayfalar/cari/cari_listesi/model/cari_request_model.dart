import "package:freezed_annotation/freezed_annotation.dart";
import "package:picker/view/main_page/alt_sayfalar/cari/cari_listesi/model/cari_listesi_model.dart";
import "package:picker/view/main_page/alt_sayfalar/siparis/base_siparis_edit/model/base_siparis_edit_model.dart";

import "../../../../../../core/base/model/base_network_mixin.dart";

part "cari_request_model.freezed.dart";
part "cari_request_model.g.dart";

@unfreezed
class CariRequestModel with _$CariRequestModel, NetworkManagerMixin {
  CariRequestModel._();

  @JsonSerializable(fieldRename: FieldRename.pascal)
  factory CariRequestModel({
    String? filterText,
    List<String>? kod,
    int? sayfa,
    String? ilce,
    String? cariTipi,
    @JsonKey(name: "SIRALAMA") String? siralama,
    String? menuKodu,
    bool? eFaturaGoster,
    @JsonKey(name: "FILTER_BAKIYE") String? filterBakiye,
    List<String?>? arrGrupKodu,
    List<String?>? arrKod1,
    List<String?>? arrKod2,
    List<String?>? arrKod3,
    List<String?>? arrKod4,
    List<String?>? arrKod5,
    List<String?>? arrSehir,
    @JsonKey(name: "ArrPlasiyerKodu") List<String>? arrPlasiyerKodu,
    bool? plasiyerKisitiYok,
    String? belgeTuru,
    String? vergiNo,
  }) = _CariRequestModel;

  factory CariRequestModel.fromJson(Map<String, dynamic> json) => _$CariRequestModelFromJson(json);

  @override
  CariRequestModel fromJson(Map<String, dynamic> json) => _$CariRequestModelFromJson(json);

  factory CariRequestModel.fromBaseSiparisEditModel(BaseSiparisEditModel model) => CariRequestModel(
        filterText: "",
        kod: [model.cariKodu??""],
        sayfa: 1,
        eFaturaGoster: true,
        plasiyerKisitiYok: true,
        belgeTuru: model.belgeTuru,
      );

      factory CariRequestModel.fromCariListesiModel(CariListesiModel model) => CariRequestModel(
        filterText: "",
        kod: [model.cariKodu??""],
        sayfa: 1,
        eFaturaGoster: true,
        plasiyerKisitiYok: true,
        // belgeTuru: model,
      );
}
