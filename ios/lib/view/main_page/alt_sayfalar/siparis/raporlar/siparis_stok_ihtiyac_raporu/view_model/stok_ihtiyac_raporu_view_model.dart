import "package:mobx/mobx.dart";

import "../../../../../../../core/base/view/pdf_viewer/model/pdf_viewer_model.dart";

part "stok_ihtiyac_raporu_view_model.g.dart";

class StokIhtiyacRaporuViewModel = _StokIhtiyacRaporuViewModelBase with _$StokIhtiyacRaporuViewModel;

abstract class _StokIhtiyacRaporuViewModelBase with Store {
  final Map<String, String> siralaMap = {
    "Stok Kodu": "KODU",
    "Stok Adı": "ADI",
    "İhtiyaç (Artan)": "IHTIYAC",
    "İhtiyaç (Azalan)": "IHTIYAC_DESC",
  };
  @observable
  bool sadeceIhtiyaclarMi = false;

  @action
  void setSadeceIhtiyaclarMi(bool value) {
    sadeceIhtiyaclarMi = value;
    if (value) {
      pdfModel.dicParams = pdfModel.dicParams?.copyWith(sifirHaric: "E");
    } else {
      pdfModel.dicParams = pdfModel.dicParams?.copyWith(sifirHaric: null);
    }
  }

  //* Model
  //*
  @observable
  PdfModel pdfModel = PdfModel(raporOzelKod: "Rapor_StokIhtiyac", standart: true, dicParams: DicParams(sirala: "IHTIYAC_DESC"));

  @action
  void setSirala(String? value) => pdfModel.dicParams = pdfModel.dicParams?.copyWith(sirala: value);
  @action
  void setStokKodu(String? value) => pdfModel.dicParams = pdfModel.dicParams?.copyWith(stokKodu: value);
  @action
  void setCariKodu(String? value) => pdfModel.dicParams = pdfModel.dicParams?.copyWith(cariKodu: value);
  @action
  void setBelgeNo(String? value) => pdfModel.dicParams = pdfModel.dicParams?.copyWith(belgeNo: value);
  //* Future
  //*
  @observable
  ObservableFuture<bool?> futureController = ObservableFuture(Future.error(false));

  @action
  void setFuture() => futureController = ObservableFuture.value(true);

  @action
  void resetFuture() => futureController = ObservableFuture.value(false);
}
