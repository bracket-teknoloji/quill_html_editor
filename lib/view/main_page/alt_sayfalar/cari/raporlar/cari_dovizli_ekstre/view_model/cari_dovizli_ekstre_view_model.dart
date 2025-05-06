import "package:mobx/mobx.dart";

import "../../../../../../../core/base/view/pdf_viewer/model/pdf_viewer_model.dart";
import "../../../../../../../core/constants/extensions/number_extensions.dart";

part "cari_dovizli_ekstre_view_model.g.dart";

final class CariDovizliEkstreViewModel = _CariDovizliEkstreViewModelBase with _$CariDovizliEkstreViewModel;

abstract class _CariDovizliEkstreViewModelBase with Store {
  @observable
  bool tlHareketleriDokulsun = true;

  @computed
  bool get getTlHareketleriDokulsun => tlHareketleriDokulsun;

  @action
  void changeTlHareketleriDokulsun() => tlHareketleriDokulsun = !tlHareketleriDokulsun;
  //* Doviz Tipi
  //*
  @observable
  String? dovizValue;

  @action
  void changeDovizValue(String? value) => dovizValue = value;

  @observable
  PdfModel pdfModel = PdfModel(
    raporOzelKod: "Rapor_CariDovizEkstre",
    standart: true,
    dicParams: DicParams(belgeNo: ""),
  );

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
