import '../../../button/toggle_buttons/view/toggle_button.dart';

class BottomSheetResponseModel {
  //Sİngleton
  static final BottomSheetResponseModel _instance = BottomSheetResponseModel._init();
  static BottomSheetResponseModel get instance => _instance;
  BottomSheetResponseModel._init();

  String? filterBakiye = ToggleButton.selected;
  List? arrSehir;
  List? arrPlasiyer;
  List? arrGrupKodu;
  List? arrKod1;
  List? arrKod2;
  List? arrKod3;
  List? arrKod4;
  List? arrKod5;
  String? ilce;
  String? cariTipi;

  BottomSheetResponseModel();

  void clear() {
    filterBakiye = ToggleButton.selected;
    arrSehir = null;
    arrPlasiyer = null;
    arrGrupKodu = null;
    arrKod1 = null;
    arrKod2 = null;
    arrKod3 = null;
    arrKod4 = null;
    arrKod5 = null;
    ilce = null;
    cariTipi = null;
  }

  toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["filterBakiye"] = filterBakiye;
    data["arrSehir"] = arrSehir;
    data["arrPlasiyer"] = arrPlasiyer;
    data["arrGrupKodu"] = arrGrupKodu;
    data["arrKod1"] = arrKod1;
    data["arrKod2"] = arrKod2;
    data["arrKod3"] = arrKod3;
    data["arrKod4"] = arrKod4;
    data["arrKod5"] = arrKod5;
    data["ilce"] = ilce;
    data["cariTipi"] = cariTipi;
    return data;
  }
}
