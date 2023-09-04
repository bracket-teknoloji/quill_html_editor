import 'package:mobx/mobx.dart';

import "../../../../../../../core/base/view/pdf_viewer/model/pdf_viewer_model.dart";
part 'siparis_karlilik_raporu_view_model.g.dart';

class SiparisKarlilikRaporuViewModel = _SiparisKarlilikRaporuViewModelBase with _$SiparisKarlilikRaporuViewModel;

abstract class _SiparisKarlilikRaporuViewModelBase with Store {
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
  void setUretimFiyatiDahilMi(String? value) {
    uretimFiyatiDahilMi = value == "E";
    pdfModel.dicParams = pdfModel.dicParams?.copyWith(uretimFiyatiDahil: value);
  }
  @action
  void setBaslangicTarihi(String? value) => pdfModel.dicParams = pdfModel.dicParams?.copyWith(bastar: value);
  @action
  void setBitisTarihi(String? value) =>   pdfModel.dicParams = pdfModel.dicParams?.copyWith(bittar: value);
  //* Future
  //*
  @observable
  ObservableFuture<bool?> futureController = ObservableFuture(Future.error(false));

  @action
  void setFuture() => futureController = ObservableFuture.value(true);

  @action
  void resetFuture() => futureController = ObservableFuture.value(false);
  
}