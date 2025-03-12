import "package:freezed_annotation/freezed_annotation.dart";
import "package:kartal/kartal.dart";

import "../../../../../../core/base/model/base_grup_kodu_model.dart";
import "../../../../../../core/base/model/base_network_mixin.dart";
import "../../../../model/param_model.dart";
import "../../../sayim/sayim_listesi/model/sayim_listesi_model.dart";

part "stok_bottom_sheet_model.freezed.dart";
part "stok_bottom_sheet_model.g.dart";

@unfreezed
class StokBottomSheetModel with _$StokBottomSheetModel, NetworkManagerMixin {
  @JsonSerializable(fieldRename: FieldRename.pascal)
  factory StokBottomSheetModel({
    int? sayfa,
    String? bakiyeDurumu,
    String? menuKodu,
    String? resimleriGoster,
    @Default("AZ") String? siralama,
    String? searchText,
    String? belgeNo,
    String? belgeTarihi,
    String? belgeTipi,
    String? cariKodu,
    int? faturaDepoKodu,
    @Default("R") String? ekranTipi,
    int? faturaTipi,
    String? resimGoster,
    bool? kisitYok,
    String? stokKodu,
    bool? okutuldu,
    String? seriTakibiVar,
    String? fiyatGrubu,
    String? ozelKod1,
    String? ozelKod2,
    List<StokDetayliAramaAlanlar>? searchList,
    @Default([]) List<BaseGrupKoduModel>? arrGrupKodu,
    @Default([]) List<BaseGrupKoduModel>? arrKod1,
    @Default([]) List<BaseGrupKoduModel>? arrKod2,
    @Default([]) List<BaseGrupKoduModel>? arrKod3,
    @Default([]) List<BaseGrupKoduModel>? arrKod4,
    @Default([]) List<BaseGrupKoduModel>? arrKod5,
    bool? receteliStoklar,
  }) = _StokBottomSheetModel;

  factory StokBottomSheetModel.fromSayimFiltreModel(SayimFiltreModel model) => StokBottomSheetModel(
    arrGrupKodu: model.arrGrupKodu?.map((e) => BaseGrupKoduModel(grupKodu: e)).toList(),
    arrKod1: model.arrKod1?.map((e) => BaseGrupKoduModel(grupKodu: e)).toList(),
    arrKod2: model.arrKod2?.map((e) => BaseGrupKoduModel(grupKodu: e)).toList(),
    arrKod3: model.arrKod3?.map((e) => BaseGrupKoduModel(grupKodu: e)).toList(),
    arrKod4: model.arrKod4?.map((e) => BaseGrupKoduModel(grupKodu: e)).toList(),
    arrKod5: model.arrKod5?.map((e) => BaseGrupKoduModel(grupKodu: e)).toList(),
  );
  StokBottomSheetModel._();

  factory StokBottomSheetModel.fromJson(Map<String, dynamic> json) => _$StokBottomSheetModelFromJson(json);

  @override
  StokBottomSheetModel fromJson(Map<String, dynamic> json) => _$StokBottomSheetModelFromJson(json);

  Map<String, dynamic> toJsonWithList() {
    final data = toJson();
    if (arrGrupKodu?.map((e) => e.grupKodu).toList().ext.isNotNullOrEmpty ?? false) {
      data["ArrGrupKodu"] = arrGrupKodu?.map((e) => e.grupKodu).toList();
    }
    if (arrKod1?.map((e) => e.kod1).toList().ext.isNotNullOrEmpty ?? false) {
      data["ArrKod1"] = arrKod1?.map((e) => e.kod1).toList();
    }
    if (arrKod2?.map((e) => e.kod2).toList().ext.isNotNullOrEmpty ?? false) {
      data["ArrKod2"] = arrKod2?.map((e) => e.kod2).toList();
    }
    if (arrKod3?.map((e) => e.kod3).toList().ext.isNotNullOrEmpty ?? false) {
      data["ArrKod3"] = arrKod3?.map((e) => e.kod3).toList();
    }
    if (arrKod4?.map((e) => e.kod4).toList().ext.isNotNullOrEmpty ?? false) {
      data["ArrKod4"] = arrKod4?.map((e) => e.kod4).toList();
    }
    if (arrKod5?.map((e) => e.kod5).toList().ext.isNotNullOrEmpty ?? false) {
      data["ArrKod5"] = arrKod5?.map((e) => e.kod5).toList();
    }
    return data;
  }
}
