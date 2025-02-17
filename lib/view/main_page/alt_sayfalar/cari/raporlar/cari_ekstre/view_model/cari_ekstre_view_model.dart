import "package:mobx/mobx.dart";

import "../../../../../../../core/base/view/pdf_viewer/model/pdf_viewer_model.dart";
import "../../../../../../../core/constants/extensions/number_extensions.dart";

part "cari_ekstre_view_model.g.dart";

final class CariEkstreViewModel = _CariEkstreViewModelBase with _$CariEkstreViewModel;

abstract class _CariEkstreViewModelBase with Store {
  //* Doviz Tipi
  //*
  @observable
  String? dovizValue;

  @action
  void changeDovizValue(String value) => dovizValue = value;

  @observable
  PdfModel pdfModel = PdfModel(raporOzelKod: "Rapor_CariEkstre", standart: true, dicParams: DicParams(belgeNo: ""));

  //* Cari Kodu
  //*
  @action
  void changeCariKodu(String? value) => pdfModel.dicParams!.cariKodu = value;

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
