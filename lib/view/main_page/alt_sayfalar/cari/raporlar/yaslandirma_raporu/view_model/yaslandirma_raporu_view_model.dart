import 'package:mobx/mobx.dart';

import '../../../../../../../core/base/view/pdf_viewer/model/pdf_viewer_model.dart';

part 'yaslandirma_raporu_view_model.g.dart';

class YaslandirmaRaporuViewModel = _YaslandirmaRaporuViewModelBase with _$YaslandirmaRaporuViewModel;

abstract class _YaslandirmaRaporuViewModelBase with Store {
  //* Süre Aralığı
  //*
  final List<String> sureAraligiList = ["Günlük", "Haftalık", "2 Hafta", "3 Hafta", "Aylık"];
  @observable
  String _sureAraligiGroupValue = "G";

  @computed
  String get sureAraligiGroupValue => _sureAraligiGroupValue;
  @observable
  ObservableList<String> sureAraligivalue = ["G", "H", "2H", "3H", "A"].asObservable();

  @action
  void changeSureAraligi(int? index) {
    _sureAraligiGroupValue = sureAraligivalue[index ?? 0];
    pdfModel.dicParams!.aralikTipi = _sureAraligiGroupValue;
  }

  //* Ödeme Tipi
  //*
  final List<String> odemeTipiList = ["Tahsil Edilecek", "Ödenecek"];
  @observable
  String _odemeTipiGroupValue = "B";

  @computed
  String get odemeTipiGroupValue => _odemeTipiGroupValue;
  @observable
  ObservableList<String> odemeTipiValue = ["B", "A"].asObservable();

  @action
  void changeOdemeTipi(int? index) {
    _odemeTipiGroupValue = odemeTipiValue[index ?? 0];
    pdfModel.dicParams!.borcAlacak = _odemeTipiGroupValue;
  }

  //* Model
  //*
  @observable
  PdfModel pdfModel = PdfModel(raporOzelKod: "Rapor_CariYaslandirma", standart: true, dicParams: DicParams());

  
  //* Future
  //*
  @observable
  ObservableFuture<bool?> futureController = ObservableFuture(Future.error(false));

  @action
  void setFuture() => futureController = ObservableFuture.value(true);

  @action
  void resetFuture() => futureController = ObservableFuture.value(false);
}
