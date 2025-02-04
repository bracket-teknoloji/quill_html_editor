import "package:mobx/mobx.dart";
import "package:picker/core/base/view/pdf_viewer/model/pdf_viewer_model.dart";
import "package:picker/core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart";

part "fatura_karlilik_raporu_view_model.g.dart";

typedef MaliyetTipi = ({
  String title,
  String value,
});

final class FaturaKarlilikRaporuViewModel = _FaturaKarlilikRaporuViewModelBase with _$FaturaKarlilikRaporuViewModel;

abstract class _FaturaKarlilikRaporuViewModelBase with Store {
  List<BottomSheetModel<MaliyetTipi>> maliyetTipiList = [
    BottomSheetModel(title: "Son Giriş Net Fiyat", value: (title: "Son Giriş Net Fiyat", value: "SGF"), groupValue: "SGF"),
    BottomSheetModel(title: "Alış Fiyatı 1", value: (title: "Alış Fiyatı 1", value: "AF1"), groupValue: "AF1"),
    BottomSheetModel(title: "Alış Fiyatı 2", value: (title: "Alış Fiyatı 2", value: "AF2"), groupValue: "AF2"),
    BottomSheetModel(title: "Alış Fiyatı 3", value: (title: "Alış Fiyatı 3", value: "AF3"), groupValue: "AF3"),
    BottomSheetModel(title: "Alış Fiyatı 4", value: (title: "Alış Fiyatı 4", value: "AF4"), groupValue: "AF4"),
    BottomSheetModel(title: "Satış Fiyatı 1", value: (title: "Satış Fiyatı 1", value: "SF1"), groupValue: "SF1"),
    BottomSheetModel(title: "Satış Fiyatı 2", value: (title: "Satış Fiyatı 2", value: "SF2"), groupValue: "SF2"),
    BottomSheetModel(title: "Satış Fiyatı 3", value: (title: "Satış Fiyatı 3", value: "SF3"), groupValue: "SF3"),
    BottomSheetModel(title: "Satış Fiyatı 4", value: (title: "Satış Fiyatı 4", value: "SF4"), groupValue: "SF4"),
  ];
  //* Model
  //*
  @observable
  PdfModel pdfModel = PdfModel(
    raporOzelKod: "Rapor_FaturaKarlilik",
    standart: true,
    dicParams: DicParams(
      belgeTipi: "SF",
      belgeNo: "",
    ),
  );

  //* Future
  //*
  @observable
  ObservableFuture<bool?> futureController = ObservableFuture(Future.error(false));

  @action
  void setIrsaliyeDahil(bool value) => pdfModel = pdfModel.copyWith(dicParams: pdfModel.dicParams!.copyWith(irsDahil: value ? "E" : null));

  @action
  void setUretimFiyatiDahil(bool value) => pdfModel = pdfModel.copyWith(dicParams: pdfModel.dicParams!.copyWith(uretimFiyatiDahil: value ? "E" : null));

  @action
  void setFuture() => futureController = ObservableFuture.value(true);

  @action
  void resetFuture() => futureController = ObservableFuture.value(false);
}
