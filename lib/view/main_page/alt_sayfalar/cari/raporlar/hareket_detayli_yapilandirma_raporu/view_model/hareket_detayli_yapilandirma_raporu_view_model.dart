import 'package:mobx/mobx.dart';

import '../../../../../../../core/base/view/pdf_viewer/model/pdf_viewer_model.dart';

part 'hareket_detayli_yapilandirma_raporu_view_model.g.dart';

class HareketDetayliYaslandirmaRaporuViewModel = _HareketDetayliYaslandirmaRaporuViewModelBase with _$HareketDetayliYaslandirmaRaporuViewModel;

abstract class _HareketDetayliYaslandirmaRaporuViewModelBase with Store {
  final List<String> bakiyeDurumuTitleList = ["Tahsil Edilecek", "Ödenecek"];
  final List<String> bakiyeDurumuListValue = ["B", "A"];

  @observable
  String? bakiyeDurumuGroupValue = "B";

  @action
  void changeBakiyeDurumu(int? index) => bakiyeDurumuGroupValue = bakiyeDurumuListValue[index!];

  @observable
  PdfModel pdfModel = PdfModel(raporOzelKod: "Rapor_CariDetayliYaslandirma", standart: true, dicParams: DicParams()..sirala = "ADI");

  //* Future
  //*
  @observable
  ObservableFuture<bool?> futureController = ObservableFuture(Future.error(false));

  @action
  void setFuture() => futureController = ObservableFuture.value(true);

  @action
  void resetFuture() => futureController = ObservableFuture.value(false);
}
