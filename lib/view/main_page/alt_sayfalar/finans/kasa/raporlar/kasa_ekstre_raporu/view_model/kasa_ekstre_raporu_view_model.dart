import "package:mobx/mobx.dart";

import "../../../../../../../../core/base/view/pdf_viewer/model/pdf_viewer_model.dart";

part "kasa_ekstre_raporu_view_model.g.dart";

final class KasaEkstreRaporuViewModel = _KasaEkstreRaporuViewModelBase with _$KasaEkstreRaporuViewModel;

abstract class _KasaEkstreRaporuViewModelBase with Store {
  //* Model
  //*
  @observable
  PdfModel pdfModel = PdfModel(
    raporOzelKod: "Rapor_KasaEkstre",
    standart: true,
    dicParams: DicParams(belgeNo: ""),
  );

  @action
  void setBittar(String? value) => pdfModel.dicParams = pdfModel.dicParams!.copyWith(bittar: value);

  @action
  void setBastar(String? value) => pdfModel.dicParams = pdfModel.dicParams!.copyWith(bastar: value);

  @action
  void setKasaKodu(String? value) => pdfModel.dicParams = pdfModel.dicParams!.copyWith(kasaKodu: value);

  //* Future
  //*
  @observable
  ObservableFuture<bool?> futureController = ObservableFuture(Future.error(false));

  @action
  void setFuture() => futureController = ObservableFuture.value(true);

  @action
  void resetFuture() => futureController = ObservableFuture.value(false);
}
