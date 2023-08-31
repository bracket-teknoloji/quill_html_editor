import "package:mobx/mobx.dart";

import "../../../../../../../core/base/view/pdf_viewer/model/pdf_viewer_model.dart";

part "musteri_siparisi_durum_raporu_view_model.g.dart";

class MusteriSiparisiDurumRaporuViewModel = _MusteriSiparisiDurumRaporuViewModelBase with _$MusteriSiparisiDurumRaporuViewModel;

abstract class _MusteriSiparisiDurumRaporuViewModelBase with Store {
  //* Model
  //*
  @observable
  PdfModel pdfModel = PdfModel(raporOzelKod: "Rapor_CariYaslandirma", standart: true, dicParams: DicParams());

  //* Future
  //*
  @observable
  ObservableFuture<bool?> futureController = ObservableFuture(Future.error(false));

  @action
  void setFuture() => futureController = ObservableFuture.value(true);

  @action
  void resetFuture() => futureController = ObservableFuture.value(false);
}
