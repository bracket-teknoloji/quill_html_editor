import '../../../../../../core/base/model/base_grup_kodu_model.dart';

class StokBottomSheetModel {
  List<BaseGrupKoduModel>? grupKodu = [];
  List<BaseGrupKoduModel>? kod1 = [];
  List<BaseGrupKoduModel>? kod2 = [];
  List<BaseGrupKoduModel>? kod3 = [];
  List<BaseGrupKoduModel>? kod4 = [];
  List<BaseGrupKoduModel>? kod5 = [];

  //lazy  singleton
  static StokBottomSheetModel _instance = StokBottomSheetModel._init();
  static StokBottomSheetModel get instance => _instance;
  StokBottomSheetModel._init();

  StokBottomSheetModel();
  //setter for singleton
  void setSingleton(StokBottomSheetModel value) => _instance = value;
  //an operator that returns if 2 objects values are equal
  @override
  // ignore: hash_and_equals
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StokBottomSheetModel &&
          runtimeType == other.runtimeType &&
          grupKodu == other.grupKodu &&
          kod1 == other.kod1 &&
          kod2 == other.kod2 &&
          kod3 == other.kod3 &&
          kod4 == other.kod4 &&
          kod5 == other.kod5;
}
