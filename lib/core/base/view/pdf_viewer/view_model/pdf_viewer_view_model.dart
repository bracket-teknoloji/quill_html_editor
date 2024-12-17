import "dart:io";

import "package:mobx/mobx.dart";
import "package:picker/core/base/model/base_pdf_model.dart";

part "pdf_viewer_view_model.g.dart";

class PdfViewerViewModel = _PdfViewerViewModelBase with _$PdfViewerViewModel;

abstract class _PdfViewerViewModelBase with Store {
  @observable
  int currentPage = 0;

  @observable
  int pageCounter = 0;

  @observable
  File? pdfFile;

  @observable
  BasePdfModel? pdfModel;

  @action
  void changePdfFile(File? value) => pdfFile = value;

  @observable
  ObservableFuture<bool?> futureController = ObservableFuture(Future.value(false));

  @computed
  String get getPageCounter => "Sayfa: ${currentPage + 1} / $pageCounter";

  @action
  void changeCurrentPage(int value) => currentPage = value;

  @action
  void setPdfModel(BasePdfModel? value) => pdfModel = value;

  @action
  void changePageCounter(int value) => pageCounter = value;

  @action
  void setFuture(bool? value) {
    futureController = ObservableFuture.value(value);
  }

  @action
  void resetFuture() => futureController = ObservableFuture(Future.value());
}
