import "package:mobx/mobx.dart";

import "../../../../../../../core/base/view/pdf_viewer/model/pdf_viewer_model.dart";

part "cari_borc_alacak_dokumu_raporu_view_model.g.dart";

final class CariBorcAlacakDokumuRaporuViewModel = _CariBorcAlacakDokumuRaporuViewModelBase
    with _$CariBorcAlacakDokumuRaporuViewModel;

abstract class _CariBorcAlacakDokumuRaporuViewModelBase with Store {
  final Map<String, String> siralaMap = {
    "Cari Kodu": "CARI_KODU",
    "Cari Adı": "CARI_ADI",
    "Bakiye (Artan)": "BAKIYE",
    "Bakiye (Azalan)": "BAKIYE_DESC",
  };

  @observable
  PdfModel pdfModel = PdfModel(
    raporOzelKod: "Rapor_CariBorcAlacakDokumu",
    standart: true,
    dicParams: DicParams(belgeNo: "")..sirala = "BAKIYE",
  );

  @observable
  ObservableFuture<bool?> futureController = ObservableFuture(Future.error(false));

  @action
  void setFuture() => futureController = ObservableFuture.value(true);

  @action
  void resetFuture() => futureController = ObservableFuture.value(false);

  @action
  void setSirala(String? value) => pdfModel = pdfModel.copyWith(dicParams: pdfModel.dicParams?.copyWith(sirala: value));

  @action
  void setPlasiyer(String? value) =>
      pdfModel = pdfModel.copyWith(dicParams: pdfModel.dicParams?.copyWith(plasiyerKodu: value));

  @action
  void setBastar(String? value) => pdfModel = pdfModel.copyWith(dicParams: pdfModel.dicParams?.copyWith(bastar: value));

  @action
  void setBittar(String? value) => pdfModel = pdfModel.copyWith(dicParams: pdfModel.dicParams?.copyWith(bittar: value));
}
