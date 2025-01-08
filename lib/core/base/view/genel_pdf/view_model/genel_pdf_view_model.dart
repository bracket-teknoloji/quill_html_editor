import "dart:io";

import "package:mobx/mobx.dart";

part "genel_pdf_view_model.g.dart";

final class GenelPdfViewModel = _GenelPdfViewModelBase with _$GenelPdfViewModel;

abstract class _GenelPdfViewModelBase with Store {
  @observable
  int currentPage = 0;

  @observable
  int pageCounter = 0;

  @observable
  File? pdfFile;

  @action
  void changePdfFile(File? value) => pdfFile = value;

  @observable
  ObservableFuture<bool?> futureController = ObservableFuture(Future.value(false));

  @computed
  String get getPageCounter => "Sayfa: ${currentPage + 1} / $pageCounter";

  @action
  void changeCurrentPage(int value) => currentPage = value;

  @action
  void changePageCounter(int value) => pageCounter = value;
}
