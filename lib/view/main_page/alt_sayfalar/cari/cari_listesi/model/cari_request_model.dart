import "dart:convert";

import "package:freezed_annotation/freezed_annotation.dart";
import "package:picker/core/constants/enum/edit_tipi_enum.dart";
import "package:picker/view/main_page/alt_sayfalar/cari/cari_listesi/model/cari_listesi_model.dart";
import "package:picker/view/main_page/alt_sayfalar/siparis/base_siparis_edit/model/base_siparis_edit_model.dart";

import "../../../../../../core/base/model/base_network_mixin.dart";
import "../../../../../../core/base/model/tahsilat_request_model.dart";
import "../../../finans/cek_senet/cek_senet_tahsilati/model/save_cek_senet_model.dart";

part "cari_request_model.freezed.dart";
part "cari_request_model.g.dart";

@unfreezed
class CariRequestModel with _$CariRequestModel, NetworkManagerMixin {
  @JsonSerializable(fieldRename: FieldRename.pascal)
  factory CariRequestModel({
    @Default("") String? filterText,
    List<String>? kod,
    int? sayfa,
    String? ilce,
    String? cariTipi,
    @JsonKey(name: "SIRALAMA") String? siralama,
    String? menuKodu,
    bool? eFaturaGoster,
    String? bagliCariKodu,
    @JsonKey(name: "FILTER_BAKIYE") String? filterBakiye,
    List<String>? arrGrupKodu,
    List<String>? arrKod1,
    List<String>? arrKod2,
    List<String>? arrKod3,
    List<String>? arrKod4,
    List<String>? arrKod5,
    List<String>? arrSehir,
    @JsonKey(name: "ArrPlasiyerKodu") List<String>? arrPlasiyerKodu,
    bool? plasiyerKisitiYok,
    String? belgeTuru,
    String? vergiNo,
    String? siparisKarsilanmaDurumu,
    bool? kisitYok,
    String? secildi,
    String? teslimCari,
    String? rotaDisi,
  }) = _CariRequestModel;

  factory CariRequestModel.fromBaseSiparisEditModel(BaseSiparisEditModel model) => CariRequestModel(
    kod: [model.cariKodu ?? ""],
    sayfa: 1,
    eFaturaGoster: true,
    plasiyerKisitiYok: true,
    belgeTuru: model.getEditTipiEnum?.rawValue,
  );

  factory CariRequestModel.fromCariListesiModel(CariListesiModel model) => CariRequestModel(
    kod: [model.cariKodu ?? ""],
    // sayfa: 1,
    eFaturaGoster: true,
    secildi: "E",
    plasiyerKisitiYok: true,
    // belgeTuru: model,
  );

  factory CariRequestModel.fromTahsilatRequestModel(TahsilatRequestModel model) => CariRequestModel(
    kod: [model.hesapKodu ?? ""],
    // sayfa: 1,
    eFaturaGoster: true,
    plasiyerKisitiYok: true,
    // belgeTuru: model,
  );

  factory CariRequestModel.fromSaveCekSenetModel(SaveCekSenetModel model) => CariRequestModel(
    kod: [model.cariKodu ?? ""],
    // sayfa: 1,
    eFaturaGoster: true,
    plasiyerKisitiYok: true,
    // belgeTuru: model,
  );
  CariRequestModel._();

  factory CariRequestModel.fromJson(Map<String, dynamic> json) => _$CariRequestModelFromJson(json);

  @override
  CariRequestModel fromJson(Map<String, dynamic> json) => _$CariRequestModelFromJson(json);

  Map<String, dynamic> toJsonWithArray() =>
      toJson()
        ..["KOD"] = null
        ..["KOD"] = jsonEncode(kod);
}
