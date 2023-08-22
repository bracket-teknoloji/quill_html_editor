import "../../components/dialog/bottom_sheet/model/bottom_sheet_model.dart";

extension YetkiKontrol on BottomSheetModel {
  BottomSheetModel? yetkiKontrol(bool yetki) => yetki ? this : null;
}
