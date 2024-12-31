import "package:get/get.dart";
import "package:mobx/mobx.dart";

import "../../../../../../../core/base/view/pdf_viewer/model/pdf_viewer_model.dart";
import "../../../../../../../core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart";

part "ambar_maliyet_raporu_view_model.g.dart";

class AmbarMaliyetRaporuViewModel = _AmbarMaliyetRaporuViewModelBase with _$AmbarMaliyetRaporuViewModel;

abstract class _AmbarMaliyetRaporuViewModelBase with Store {
  @observable
  PdfModel pdfModel = PdfModel(
    raporOzelKod: "Rapor_StokAmbarMaliyet",
    standart: true,
    dicParams: DicParams(belgeNo: "")..sifirHaric = "H",
  );
  @observable
  bool sifirHaricValue = false;

  @action
  void setSifirHaric(bool value) {
    sifirHaricValue = value;
    value ? pdfModel.dicParams!.sifirHaric = "E" : pdfModel.dicParams!.sifirHaric = "H";
  }

  List<BottomSheetModel> maliyetTipiList = [
    BottomSheetModel(
      title: "Son Giriş Net Fiyat",
      onTap: () => Get.back(result: "SGF"),
    ),
    BottomSheetModel(
      title: "Alış Fiyatı 1",
      onTap: () => Get.back(result: "AF1"),
    ),
    BottomSheetModel(
      title: "Alış Fiyatı 2",
      onTap: () => Get.back(result: "AF2"),
    ),
    BottomSheetModel(
      title: "Alış Fiyatı 3",
      onTap: () => Get.back(result: "AF3"),
    ),
    BottomSheetModel(
      title: "Alış Fiyatı 4",
      onTap: () => Get.back(result: "AF4"),
    ),
    BottomSheetModel(
      title: "Satış Fiyatı 1",
      onTap: () => Get.back(result: "SF1"),
    ),
    BottomSheetModel(
      title: "Satış Fiyatı 2",
      onTap: () => Get.back(result: "SF2"),
    ),
    BottomSheetModel(
      title: "Satış Fiyatı 3",
      onTap: () => Get.back(result: "SF3"),
    ),
    BottomSheetModel(
      title: "Satış Fiyatı 4",
      onTap: () => Get.back(result: "SF4"),
    ),
  ];

  //* Future
  //*
  @observable
  ObservableFuture<bool?> futureController = ObservableFuture(Future.error(false));

  @action
  void setFuture() => futureController = ObservableFuture.value(true);

  @action
  void resetFuture() => futureController = ObservableFuture.value(false);
}
