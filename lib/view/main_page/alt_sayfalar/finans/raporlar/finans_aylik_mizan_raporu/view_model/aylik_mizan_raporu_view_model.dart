import "package:mobx/mobx.dart";

import "../../../../../../../core/base/view/pdf_viewer/model/pdf_viewer_model.dart";

part "aylik_mizan_raporu_view_model.g.dart";

class AylikMizanRaporuViewModel = _AylikMizanRaporuViewModelBase with _$AylikMizanRaporuViewModel;

abstract class _AylikMizanRaporuViewModelBase with Store {
  //* Model
  //*
  @observable
  PdfModel pdfModel = PdfModel(raporOzelKod: "Rapor_FinansAylikMizan", standart: true, dicParams: DicParams(belgeNo: ""));

  //* Future
  //*
  @observable
  ObservableFuture<bool?> futureController = ObservableFuture(Future.error(false));

  @action
  void setFuture() => futureController = ObservableFuture.value(true);

  @action
  void resetFuture() => futureController = ObservableFuture.value(false);

  @action
  void changeMuhasebeKodu(String? value) => pdfModel.dicParams?.muhasebeKodu = value;
}
