// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pdf_viewer_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PdfViewerViewModel on _PdfViewerViewModelBase, Store {
  Computed<String>? _$getPageCounterComputed;

  @override
  String get getPageCounter => (_$getPageCounterComputed ??= Computed<String>(
    () => super.getPageCounter,
    name: '_PdfViewerViewModelBase.getPageCounter',
  )).value;

  late final _$currentPageAtom = Atom(name: '_PdfViewerViewModelBase.currentPage', context: context);

  @override
  int get currentPage {
    _$currentPageAtom.reportRead();
    return super.currentPage;
  }

  @override
  set currentPage(int value) {
    _$currentPageAtom.reportWrite(value, super.currentPage, () {
      super.currentPage = value;
    });
  }

  late final _$pageCounterAtom = Atom(name: '_PdfViewerViewModelBase.pageCounter', context: context);

  @override
  int get pageCounter {
    _$pageCounterAtom.reportRead();
    return super.pageCounter;
  }

  @override
  set pageCounter(int value) {
    _$pageCounterAtom.reportWrite(value, super.pageCounter, () {
      super.pageCounter = value;
    });
  }

  late final _$pdfFileAtom = Atom(name: '_PdfViewerViewModelBase.pdfFile', context: context);

  @override
  File? get pdfFile {
    _$pdfFileAtom.reportRead();
    return super.pdfFile;
  }

  @override
  set pdfFile(File? value) {
    _$pdfFileAtom.reportWrite(value, super.pdfFile, () {
      super.pdfFile = value;
    });
  }

  late final _$pdfModelAtom = Atom(name: '_PdfViewerViewModelBase.pdfModel', context: context);

  @override
  BasePdfModel? get pdfModel {
    _$pdfModelAtom.reportRead();
    return super.pdfModel;
  }

  @override
  set pdfModel(BasePdfModel? value) {
    _$pdfModelAtom.reportWrite(value, super.pdfModel, () {
      super.pdfModel = value;
    });
  }

  late final _$futureControllerAtom = Atom(name: '_PdfViewerViewModelBase.futureController', context: context);

  @override
  ObservableFuture<bool?> get futureController {
    _$futureControllerAtom.reportRead();
    return super.futureController;
  }

  @override
  set futureController(ObservableFuture<bool?> value) {
    _$futureControllerAtom.reportWrite(value, super.futureController, () {
      super.futureController = value;
    });
  }

  late final _$_PdfViewerViewModelBaseActionController = ActionController(
    name: '_PdfViewerViewModelBase',
    context: context,
  );

  @override
  void changePdfFile(File? value) {
    final _$actionInfo = _$_PdfViewerViewModelBaseActionController.startAction(
      name: '_PdfViewerViewModelBase.changePdfFile',
    );
    try {
      return super.changePdfFile(value);
    } finally {
      _$_PdfViewerViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeCurrentPage(int value) {
    final _$actionInfo = _$_PdfViewerViewModelBaseActionController.startAction(
      name: '_PdfViewerViewModelBase.changeCurrentPage',
    );
    try {
      return super.changeCurrentPage(value);
    } finally {
      _$_PdfViewerViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPdfModel(BasePdfModel? value) {
    final _$actionInfo = _$_PdfViewerViewModelBaseActionController.startAction(
      name: '_PdfViewerViewModelBase.setPdfModel',
    );
    try {
      return super.setPdfModel(value);
    } finally {
      _$_PdfViewerViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changePageCounter(int value) {
    final _$actionInfo = _$_PdfViewerViewModelBaseActionController.startAction(
      name: '_PdfViewerViewModelBase.changePageCounter',
    );
    try {
      return super.changePageCounter(value);
    } finally {
      _$_PdfViewerViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setFuture(bool? value) {
    final _$actionInfo = _$_PdfViewerViewModelBaseActionController.startAction(
      name: '_PdfViewerViewModelBase.setFuture',
    );
    try {
      return super.setFuture(value);
    } finally {
      _$_PdfViewerViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetFuture() {
    final _$actionInfo = _$_PdfViewerViewModelBaseActionController.startAction(
      name: '_PdfViewerViewModelBase.resetFuture',
    );
    try {
      return super.resetFuture();
    } finally {
      _$_PdfViewerViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentPage: ${currentPage},
pageCounter: ${pageCounter},
pdfFile: ${pdfFile},
pdfModel: ${pdfModel},
futureController: ${futureController},
getPageCounter: ${getPageCounter}
    ''';
  }
}
