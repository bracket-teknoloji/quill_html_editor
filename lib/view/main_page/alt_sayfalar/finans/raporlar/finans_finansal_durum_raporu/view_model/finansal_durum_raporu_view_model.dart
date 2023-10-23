import "package:mobx/mobx.dart";

import "../../../../../../../core/base/view/pdf_viewer/model/pdf_viewer_model.dart";

part "finansal_durum_raporu_view_model.g.dart";

class FinansalDurumRaporuViewModel = _FinansalDurumRaporuViewModelBase with _$FinansalDurumRaporuViewModel;

abstract class _FinansalDurumRaporuViewModelBase with Store {
  final Map<String, String> gorunecekAlanlarMap = {
    "Kasa": "KASA",
    "Banka": "BANKA",
    "Çek": "CEK",
    "Senet": "SENET",
    "Cari": "CARI",
    "İrsaliye": "IRS",
    "Sipariş": "SIP",
    "Stok": "STOK",
  };

  //* Model
  //*
  @observable
  PdfModel pdfModel = PdfModel(raporOzelKod: "Rapor_FinansalDurum", standart: true, dicParams: DicParams());

  //* Future
  //*
  @observable
  ObservableFuture<bool?> futureController = ObservableFuture(Future.error(false));

  @action
  void setFuture() => futureController = ObservableFuture.value(true);

  @action
  void resetFuture() => futureController = ObservableFuture.value(false);

  @action
  void changeGorunecekAlanlar(String? value) => pdfModel.dicParams?.gorunecekAlanlar = value;
}
