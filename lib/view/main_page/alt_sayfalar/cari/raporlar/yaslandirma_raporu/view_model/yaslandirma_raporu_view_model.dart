import 'package:mobx/mobx.dart';

import '../../../../../../../core/base/view/pdf_viewer/model/pdf_viewer_model.dart';

part 'yaslandirma_raporu_view_model.g.dart';

class YaslandirmaRaporuViewModel = _YaslandirmaRaporuViewModelBase with _$YaslandirmaRaporuViewModel;

abstract class _YaslandirmaRaporuViewModelBase with Store {
  //* Model
  //*
  @observable
  PdfModel pdfModel = PdfModel(raporOzelKod: "Rapor_CariYaslandirma", standart: true, dicParams: DicParams());

  //* Cari Kodu
  //*
  @action
  void changeCariKodu(value) => pdfModel.dicParams!.cariKodu = value;

  //* Future
  //*
  @observable
  ObservableFuture<bool?> futureController = ObservableFuture(Future.error(false));

  @action
  void setFuture() => futureController = ObservableFuture.value(true);

  @action
  void resetFuture() => futureController = ObservableFuture.value(false);
}
