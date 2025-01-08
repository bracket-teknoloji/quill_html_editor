import "package:mobx/mobx.dart";

import "../../../../../../../core/base/view/pdf_viewer/model/pdf_viewer_model.dart";
import "../../../../../../../core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart";

part "cari_hareket_raporu_view_model.g.dart";

final class CariHareketRaporuViewModel = _CariHareketRaporuViewModelBase with _$CariHareketRaporuViewModel;

abstract class _CariHareketRaporuViewModelBase with Store {
  final List<BottomSheetModel<String>> siralaBottomSheetList = [
    BottomSheetModel(
      title: "Kayıt No (Artan)",
      value: "INC",
    ),
    BottomSheetModel(
      title: "Kayıt No (Azalan)",
      value: "INC_DESC",
    ),
    BottomSheetModel(
      title: "Tarih (Artan)",
      value: "TARIH",
    ),
    BottomSheetModel(
      title: "Tarih (Azalan)",
      value: "TARIH_DESC",
    ),
  ];
  //* Model
  //*
  @observable
  PdfModel pdfModel = PdfModel(
    raporOzelKod: "Rapor_CariHareket",
    standart: true,
    dicParams: DicParams(belgeNo: "")..sirala = "ADI",
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
