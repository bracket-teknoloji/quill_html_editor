// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'genel_pdf_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$GenelPdfViewModel on _GenelPdfViewModelBase, Store {
  Computed<String>? _$getPageCounterComputed;

  @override
  String get getPageCounter =>
      (_$getPageCounterComputed ??= Computed<String>(() => super.getPageCounter,
              name: '_GenelPdfViewModelBase.getPageCounter'))
          .value;

  late final _$currentPageAtom =
      Atom(name: '_GenelPdfViewModelBase.currentPage', context: context);

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

  late final _$pageCounterAtom =
      Atom(name: '_GenelPdfViewModelBase.pageCounter', context: context);

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

  late final _$pdfFileAtom =
      Atom(name: '_GenelPdfViewModelBase.pdfFile', context: context);

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

  late final _$futureControllerAtom =
      Atom(name: '_GenelPdfViewModelBase.futureController', context: context);

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

  late final _$_GenelPdfViewModelBaseActionController =
      ActionController(name: '_GenelPdfViewModelBase', context: context);

  @override
  void changePdfFile(File? value) {
    final _$actionInfo = _$_GenelPdfViewModelBaseActionController.startAction(
        name: '_GenelPdfViewModelBase.changePdfFile');
    try {
      return super.changePdfFile(value);
    } finally {
      _$_GenelPdfViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeCurrentPage(int value) {
    final _$actionInfo = _$_GenelPdfViewModelBaseActionController.startAction(
        name: '_GenelPdfViewModelBase.changeCurrentPage');
    try {
      return super.changeCurrentPage(value);
    } finally {
      _$_GenelPdfViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changePageCounter(int value) {
    final _$actionInfo = _$_GenelPdfViewModelBaseActionController.startAction(
        name: '_GenelPdfViewModelBase.changePageCounter');
    try {
      return super.changePageCounter(value);
    } finally {
      _$_GenelPdfViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentPage: ${currentPage},
pageCounter: ${pageCounter},
pdfFile: ${pdfFile},
futureController: ${futureController},
getPageCounter: ${getPageCounter}
    ''';
  }
}
