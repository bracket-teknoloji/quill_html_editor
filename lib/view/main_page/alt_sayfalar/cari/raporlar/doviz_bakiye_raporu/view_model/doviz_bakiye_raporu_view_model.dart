import "package:mobx/mobx.dart";

import "../../../../../../../core/base/view/pdf_viewer/model/pdf_viewer_model.dart";
import "../../../../../../../core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart";

part "doviz_bakiye_raporu_view_model.g.dart";

class DovizBakiyeRaporuViewModel = _DovizBakiyeRaporuViewModelBase with _$DovizBakiyeRaporuViewModel;

abstract class _DovizBakiyeRaporuViewModelBase with Store {
  final List<String> bakiyeDurumuTitleList = [
    "Tümü",
    "Eksi",
    "Artı",
    "Sıfır",
    "Bakiyeli",
  ];
  final List<String> bakiyeDurumuValueList = ["T", "E", "A", "S", "B"];
  final List<BottomSheetModel<String>> siralaBottomSheetList = [
    BottomSheetModel(
      title: "Cari Adı (A-Z)",
      value: "ADI",
    ),
    BottomSheetModel(
      title: "Cari Adı (Z-A)",
      value: "ADI_DESC",
    ),
    BottomSheetModel(
      title: "Cari Adı (A-Z)",
      value: "KODU",
    ),
    BottomSheetModel(
      title: "Cari Adı (Z-A)",
      value: "KODU_DESC",
    ),
  ];
  @observable
  String _bakiyeDurumuGroupValue = "T";

  @computed
  String get bakiyeDurumuGroupValue => _bakiyeDurumuGroupValue;

  @action
  void changeBakiyeDurumu(int? index) {
    _bakiyeDurumuGroupValue = bakiyeDurumuValueList[index ?? 0];
    pdfModel.dicParams!.bakiyeDurumu = _bakiyeDurumuGroupValue;
  }

  //* Model
  //*
  @observable
  PdfModel pdfModel = PdfModel(
    raporOzelKod: "Rapor_CariDovizBakiye",
    standart: true,
    dicParams: DicParams()..sirala = "ADI",
  );

  //* Future
  //*
  @observable
  ObservableFuture<bool?> futureController = ObservableFuture(Future.error(false));

  @action
  void setFuture() => futureController = ObservableFuture.value(true);

  @action
  void resetFuture() => futureController = ObservableFuture.value(false);
}
