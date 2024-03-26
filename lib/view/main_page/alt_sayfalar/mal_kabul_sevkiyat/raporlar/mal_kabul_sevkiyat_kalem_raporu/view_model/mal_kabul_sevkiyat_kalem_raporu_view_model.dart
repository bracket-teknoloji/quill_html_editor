import "package:mobx/mobx.dart";
import "package:picker/core/base/view/pdf_viewer/model/pdf_viewer_model.dart";

part "mal_kabul_sevkiyat_kalem_raporu_view_model.g.dart";

class MalKabulSevkiyatKalemRaporuViewModel = _MalKabulSevkiyatKalemRaporuViewModelBase with _$MalKabulSevkiyatKalemRaporuViewModel;

abstract class _MalKabulSevkiyatKalemRaporuViewModelBase with Store {
  //* Model
  //*
  @observable
  PdfModel pdfModel = PdfModel(
    raporOzelKod: "Rapor_CariDovizBakiye",
    standart: true,
    dicParams: DicParams(),
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
