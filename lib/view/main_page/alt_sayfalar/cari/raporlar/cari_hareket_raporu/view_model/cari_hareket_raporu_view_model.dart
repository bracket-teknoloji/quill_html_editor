import "package:get/get.dart";
import "package:mobx/mobx.dart";

import "../../../../../../../core/base/view/pdf_viewer/model/pdf_viewer_model.dart";
import "../../../../../../../core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart";

part "cari_hareket_raporu_view_model.g.dart";

class CariHareketRaporuViewModel = _CariHareketRaporuViewModelBase
    with _$CariHareketRaporuViewModel;

abstract class _CariHareketRaporuViewModelBase with Store {
  final List<BottomSheetModel> siralaBottomSheetList = [
    BottomSheetModel(
        title: "Kayıt No (Artan)", onTap: () => Get.back(result: "INC"),),
    BottomSheetModel(
        title: "Kayıt No (Azalan)", onTap: () => Get.back(result: "INC_DESC"),),
    BottomSheetModel(
        title: "Tarih (Artan)", onTap: () => Get.back(result: "TARIH"),),
    BottomSheetModel(
        title: "Tarih (Azalan)", onTap: () => Get.back(result: "TARIH_DESC"),),
  ];
  //* Model
  //*
  @observable
  PdfModel pdfModel = PdfModel(
      raporOzelKod: "Rapor_CariHareket",
      standart: true,
      dicParams: DicParams()..sirala = "ADI",);

  //* Future
  //*
  @observable
  ObservableFuture<bool?> futureController =
      ObservableFuture(Future.error(false));

  @action
  void setFuture() => futureController = ObservableFuture.value(true);

  @action
  void resetFuture() => futureController = ObservableFuture.value(false);
}
