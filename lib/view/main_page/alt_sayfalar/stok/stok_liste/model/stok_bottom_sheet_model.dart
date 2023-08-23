import "package:json_annotation/json_annotation.dart";
import "package:picker/core/base/model/base_network_mixin.dart";

import "../../../../../../core/base/model/base_grup_kodu_model.dart";

part "stok_bottom_sheet_model.g.dart";

@JsonSerializable(fieldRename: FieldRename.pascal)
class StokBottomSheetModel with NetworkManagerMixin {
  int? sayfa;
  String? bakiyeDurumu;
  String? menuKodu;
  String? resimleriGoster;
  String? siralama;
  String? searchText;
  String? belgeNo;
  String? belgeTarihi;
  String? belgeTipi;
  String? cariKodu;
  String? ekranTipi;
  int? faturaTipi;
  String? resimGoster;
  List<BaseGrupKoduModel>? arrGrupKodu = [];
  List<BaseGrupKoduModel>? arrKod1 = [];
  List<BaseGrupKoduModel>? arrKod2 = [];
  List<BaseGrupKoduModel>? arrKod3 = [];
  List<BaseGrupKoduModel>? arrKod4 = [];
  List<BaseGrupKoduModel>? arrKod5 = [];

  //lazy  singleton
  static StokBottomSheetModel _instance = StokBottomSheetModel._init();
  static StokBottomSheetModel get instance => _instance;
  StokBottomSheetModel._init();

  StokBottomSheetModel(
      {this.sayfa,
      this.bakiyeDurumu,
      this.menuKodu,
      this.resimleriGoster,
      this.siralama,
      this.searchText,
      this.arrGrupKodu,
      this.arrKod1,
      this.arrKod2,
      this.arrKod3,
      this.arrKod4,
      this.arrKod5,
      this.belgeNo,
      this.belgeTarihi,
      this.belgeTipi,
      this.cariKodu,
      this.ekranTipi,
      this.faturaTipi,
      this.resimGoster});
  //setter for singleton
  void setSingleton(StokBottomSheetModel value) => _instance = value;
  @override
  fromJson(Map<String, dynamic> json) => _$StokBottomSheetModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$StokBottomSheetModelToJson(this);
}
