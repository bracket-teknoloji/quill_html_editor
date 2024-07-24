// import "dart:convert";

// import "package:json_annotation/json_annotation.dart";
// import "../../../../../../core/base/model/base_network_mixin.dart";

// import "../../../../../../core/base/model/base_grup_kodu_model.dart";

// part "stok_bottom_sheet_model.g.dart";

// @JsonSerializable(fieldRename: FieldRename.pascal)
// class StokBottomSheetModel with NetworkManagerMixin {
//   int? sayfa;
//   String? bakiyeDurumu;
//   String? menuKodu;
//   String? resimleriGoster;
//   String? siralama;
//   String? searchText;
//   String? belgeNo;
//   String? belgeTarihi;
//   String? belgeTipi;
//   String? cariKodu;
//   String? ekranTipi;
//   int? faturaTipi;
//   String? resimGoster;
//   bool? kisitYok;
//   String? stokKodu;
//   bool? okutuldu;
//   List<BaseGrupKoduModel>? arrGrupKodu = [];
//   List<BaseGrupKoduModel>? arrKod1 = [];
//   List<BaseGrupKoduModel>? arrKod2 = [];
//   List<BaseGrupKoduModel>? arrKod3 = [];
//   List<BaseGrupKoduModel>? arrKod4 = [];
//   List<BaseGrupKoduModel>? arrKod5 = [];

//   //lazy  singleton
//   static StokBottomSheetModel _instance = StokBottomSheetModel._init();
//   static StokBottomSheetModel get instance => _instance;
//   StokBottomSheetModel._init();

//   StokBottomSheetModel(
//       {this.sayfa,
//       this.bakiyeDurumu,
//       this.menuKodu,
//       this.resimleriGoster,
//       this.siralama,
//       this.searchText,
//       this.arrGrupKodu,
//       this.arrKod1,
//       this.arrKod2,
//       this.arrKod3,
//       this.arrKod4,
//       this.arrKod5,
//       this.belgeNo,
//       this.belgeTarihi,
//       this.belgeTipi,
//       this.cariKodu,
//       this.ekranTipi,
//       this.faturaTipi,
//       this.resimGoster,
//       this.stokKodu,
//       this.kisitYok,
//       this.okutuldu});
//   //setter for singleton
//   void setSingleton(StokBottomSheetModel value) => _instance = value;
//   @override
//   fromJson(Map<String, dynamic> json) => _$StokBottomSheetModelFromJson(json);

//   @override
//   Map<String, dynamic> toJson(){
//     final data = _$StokBottomSheetModelToJson(this);
//     if (data["ArrGrupKodu"] != null) {
//       data["ArrGrupKodu"] = jsonEncode(data["ArrGrupKodu"]);
//     }
//     if (data["ArrKod1"] != null) {
//       data["ArrKod1"] = jsonEncode(data["ArrKod1"]);
//     }
//     if (data["ArrKod2"] != null) {
//       data["ArrKod2"] = jsonEncode(data["ArrKod2"]);
//     }
//     if (data["ArrKod3"] != null) {
//       data["ArrKod3"] = jsonEncode(data["ArrKod3"]);
//     }
//     if (data["ArrKod4"] != null) {
//       data["ArrKod4"] = jsonEncode(data["ArrKod4"]);
//     }
//     if (data["ArrKod5"] != null) {
//       data["ArrKod5"] = jsonEncode(data["ArrKod5"]);
//     }
//     return data;
//   }
// }
import "package:freezed_annotation/freezed_annotation.dart";
import "package:picker/view/main_page/alt_sayfalar/sayim/sayim_listesi/model/sayim_listesi_model.dart";

import "../../../../../../core/base/model/base_grup_kodu_model.dart";
import "../../../../../../core/base/model/base_network_mixin.dart";

part "stok_bottom_sheet_model.freezed.dart";
part "stok_bottom_sheet_model.g.dart";

@unfreezed
class StokBottomSheetModel with _$StokBottomSheetModel, NetworkManagerMixin {
  StokBottomSheetModel._();
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
    @Default("R") String? ekranTipi,
    int? faturaTipi,
    String? resimGoster,
    bool? kisitYok,
    String? stokKodu,
    bool? okutuldu,
    String? seriTakibiVar,
    @Default([]) List<BaseGrupKoduModel>? arrGrupKodu,
    @Default([]) List<BaseGrupKoduModel>? arrKod1,
    @Default([]) List<BaseGrupKoduModel>? arrKod2,
    @Default([]) List<BaseGrupKoduModel>? arrKod3,
    @Default([]) List<BaseGrupKoduModel>? arrKod4,
    @Default([]) List<BaseGrupKoduModel>? arrKod5,
    bool? receteliStoklar,
  }) = _StokBottomSheetModel;

  factory StokBottomSheetModel.fromJson(Map<String, dynamic> json) => _$StokBottomSheetModelFromJson(json);

  @override
  StokBottomSheetModel fromJson(Map<String, dynamic> json) => _$StokBottomSheetModelFromJson(json);

  factory StokBottomSheetModel.fromSayimFiltreModel(SayimFiltreModel model) => StokBottomSheetModel(
        arrGrupKodu: model.arrGrupKodu?.map((e) => BaseGrupKoduModel(grupKodu: e)).toList(),
        arrKod1: model.arrKod1?.map((e) => BaseGrupKoduModel(grupKodu: e)).toList(),
        arrKod2: model.arrKod2?.map((e) => BaseGrupKoduModel(grupKodu: e)).toList(),
        arrKod3: model.arrKod3?.map((e) => BaseGrupKoduModel(grupKodu: e)).toList(),
        arrKod4: model.arrKod4?.map((e) => BaseGrupKoduModel(grupKodu: e)).toList(),
        arrKod5: model.arrKod5?.map((e) => BaseGrupKoduModel(grupKodu: e)).toList(),
      );

  Map<String, dynamic> toJsonWithList() {
    final data = toJson();
    if (data["ArrGrupKodu"] != null) {
      data["ArrGrupKodu"] = data["ArrGrupKodu"].map((e) => e["GRUP_KODU"]).toList();
    }
    if (data["ArrKod1"] != null) {
      data["ArrKod1"] = data["ArrKod1"].map((e) => e["KOD1"] ?? e["GRUP_KODU"]).toList();
    }
    if (data["ArrKod2"] != null) {
      data["ArrKod2"] = data["ArrKod2"].map((e) => e["KOD2"] ?? e["GRUP_KODU"]).toList();
    }
    if (data["ArrKod3"] != null) {
      data["ArrKod3"] = data["ArrKod3"].map((e) => e["KOD3"] ?? e["GRUP_KODU"]).toList();
    }
    if (data["ArrKod4"] != null) {
      data["ArrKod4"] = data["ArrKod4"].map((e) => e["KOD4"] ?? e["GRUP_KODU"]).toList();
    }
    if (data["ArrKod5"] != null) {
      data["ArrKod5"] = data["ArrKod5"].map((e) => e["KOD5"] ?? e["GRUP_KODU"]).toList();
    }
    return data;
  }
}
