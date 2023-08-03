import 'package:json_annotation/json_annotation.dart';
import 'package:picker/core/base/model/base_network_mixin.dart';

import '../../../../../../core/base/model/base_grup_kodu_model.dart';


part 'stok_bottom_sheet_model.g.dart';

@JsonSerializable(createToJson: true, includeIfNull: false, fieldRename: FieldRename.pascal)
class StokBottomSheetModel with NetworkManagerMixin{
  int? sayfa;
  String? bakiyeDurumu;
  String? menuKodu;
  String? resimleriGoster;
  String? siralama;
  String? searchText;
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

  StokBottomSheetModel({
    this.sayfa,
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
  });
  //setter for singleton
  void setSingleton(StokBottomSheetModel value) => _instance = value;
            @override
            fromJson(Map<String, dynamic> json) => _$StokBottomSheetModelFromJson(json);
          
            @override
            Map<String, dynamic> toJson()  => _$StokBottomSheetModelToJson(this);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StokBottomSheetModel &&
          runtimeType == other.runtimeType &&
          arrGrupKodu == other.arrGrupKodu &&
          arrKod1 == other.arrKod1 &&
          arrKod2 == other.arrKod2 &&
          arrKod3 == other.arrKod3 &&
          arrKod4 == other.arrKod4 &&
          arrKod5 == other.arrKod5;
          
}
