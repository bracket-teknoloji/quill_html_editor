import "package:mobx/mobx.dart";

import "../../../../../../../core/base/view/pdf_viewer/model/pdf_viewer_model.dart";
import "../../../../../../../core/constants/extensions/number_extensions.dart";

part "stok_ekstre_view_model.g.dart";

class StokEkstreViewModel = _StokEkstreViewModelBase with _$StokEkstreViewModel;

abstract class _StokEkstreViewModelBase with Store {
  @observable
  PdfModel pdfModel = PdfModel(raporOzelKod: "Rapor_CariStokEkstre", standart: true, dicParams: DicParams());

  //* Cari Kodu
  //*
  @action
  void changeCariKodu(value) => pdfModel.dicParams!.cariKodu = value;

  @action
  void changeDovizTipi(int value) => pdfModel.dicParams!.dovizTipi = value.toStringIfNotNull;

  //* Future
  //*
  @observable
  ObservableFuture<bool?> futureController = ObservableFuture(Future.error(false));

  @action
  void setFuture() => futureController = ObservableFuture.value(true);

  @action
  void resetFuture() => futureController = ObservableFuture.value(false);
}
