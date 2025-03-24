import "package:mobx/mobx.dart";

import "../../../../../../../core/base/view/pdf_viewer/model/pdf_viewer_model.dart";

part "lokal_depo_bakiye_raporu_view_model.g.dart";

final class LokalDepoBakiyeRaporuViewModel = _LokalDepoBakiyeRaporuViewModelBase with _$LokalDepoBakiyeRaporuViewModel;

abstract class _LokalDepoBakiyeRaporuViewModelBase with Store {
  @observable
  PdfModel pdfModel = PdfModel(
    raporOzelKod: "Rapor_StokLokalDepo",
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

  //* Future
  //*
  @observable
  ObservableFuture<bool?> futureController = ObservableFuture(Future.error(false));

  @action
  void setFuture() => futureController = ObservableFuture.value(true);

  @action
  void resetFuture() => futureController = ObservableFuture.value(false);
}
