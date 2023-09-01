import 'package:mobx/mobx.dart';

import "../../../../../../../core/base/view/pdf_viewer/model/pdf_viewer_model.dart";
part 'stok_ihtiyac_raporu_view_model.g.dart';

class StokIhtiyacRaporuViewModel = _StokIhtiyacRaporuViewModelBase with _$StokIhtiyacRaporuViewModel;

abstract class _StokIhtiyacRaporuViewModelBase with Store {
  //* Model
  //*
  @computed
  PdfModel get pdfModel => PdfModel(raporOzelKod: "Rapor_CariYaslandirma", standart: true, dicParams: dicParams);

  @observable
  DicParams dicParams = DicParams();

  @action
  void setStokKodu(String? value) => dicParams = dicParams.copyWith(stokKodu: value);
  @action
  void setCariKodu(String? value) => dicParams = dicParams.copyWith(cariKodu: value);
  @action
  void setBelgeNo(String? value) => dicParams = dicParams.copyWith(belgeNo: value);
  //* Future
  //*
  @observable
  ObservableFuture<bool?> futureController = ObservableFuture(Future.error(false));

  @action
  void setFuture() => futureController = ObservableFuture.value(true);

  @action
  void resetFuture() => futureController = ObservableFuture.value(false);
}