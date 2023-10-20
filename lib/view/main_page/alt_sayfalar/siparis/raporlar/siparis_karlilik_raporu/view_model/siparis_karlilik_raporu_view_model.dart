import "package:mobx/mobx.dart";

import "../../../../../../../core/base/view/pdf_viewer/model/pdf_viewer_model.dart";

part "siparis_karlilik_raporu_view_model.g.dart";

class SiparisKarlilikRaporuViewModel = _SiparisKarlilikRaporuViewModelBase with _$SiparisKarlilikRaporuViewModel;

abstract class _SiparisKarlilikRaporuViewModelBase with Store {
  final Map<String, String> maliyetTipiList = <String, String>{
    "Son Giriş Net Fiyat": "SGF",
    "İlgili Tarihteki Giriş Fiyatı": "TGF",
    "Alış Fiyatını Bulmaya Çalış": "AGF",
    "Alış Fiyatı 1": "AF1",
    "Alış Fiyatı 2": "AF2",
    "Alış Fiyatı 3": "AF3",
    "Alış Fiyatı 4": "AF4",
    "Satış Fiyatı 1": "SF1",
    "Satış Fiyatı 2": "SF2",
    "Satış Fiyatı 3": "SF3",
    "Satış Fiyatı 4": "SF4",
  };
  @observable
  PdfModel pdfModel = PdfModel(raporOzelKod: "Rapor_SiparisKarlilik", standart: true, dicParams: DicParams());
  @observable
  bool uretimFiyatiDahilMi = false;

  @action
  void setCariKodu(String? value) => pdfModel.dicParams = pdfModel.dicParams?.copyWith(cariKodu: value);
  @action
  void setBelgeNo(String? value) => pdfModel.dicParams = pdfModel.dicParams?.copyWith(belgeNo: value);
  @action
  void setPlasiyer(String? value) => pdfModel.dicParams = pdfModel.dicParams?.copyWith(plasiyerKodu: value);
  @action
  void setMaliyetTipi(String? value) => pdfModel.dicParams = pdfModel.dicParams?.copyWith(maliyetTipi: value);
  @action
  void setUretimFiyatiDahilMi(String? value) {
    uretimFiyatiDahilMi = value == "E";
    pdfModel.dicParams = pdfModel.dicParams?.copyWith(uretimFiyatiDahil: value);
  }

  @action
  void setBaslangicTarihi(String? value) => pdfModel.dicParams = pdfModel.dicParams?.copyWith(bastar: value);
  @action
  void setBitisTarihi(String? value) => pdfModel.dicParams = pdfModel.dicParams?.copyWith(bittar: value);
  //* Future
  //*
  @observable
  ObservableFuture<bool?> futureController = ObservableFuture(Future.error(false));

  @action
  void setFuture() => futureController = ObservableFuture.value(true);

  @action
  void resetFuture() => futureController = ObservableFuture.value(false);
}
