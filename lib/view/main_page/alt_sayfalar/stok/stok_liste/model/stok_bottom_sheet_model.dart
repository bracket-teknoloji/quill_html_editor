import 'package:picker/view/main_page/alt_sayfalar/cari/cari_listesi/model/cari_listesi_grup_kodu_model.dart';

class StokBottomSheetModel {
  List<CariGrupKoduModel>? grupKodu = [];
  List<CariGrupKoduModel>? kod1 = [];
  List<CariGrupKoduModel>? kod2 = [];
  List<CariGrupKoduModel>? kod3 = [];
  List<CariGrupKoduModel>? kod4 = [];
  List<CariGrupKoduModel>? kod5 = [];

  //lazy  singleton
  static StokBottomSheetModel _instance = StokBottomSheetModel._init();
  static StokBottomSheetModel get instance => _instance;
  StokBottomSheetModel._init();

  StokBottomSheetModel();
  //setter for singleton
  void setSingleton(StokBottomSheetModel value) => _instance = value;
  //an operator that returns if 2 objects values are equal
  @override
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
