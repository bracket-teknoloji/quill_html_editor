// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'e_belge_pdf_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$EBelgePdfViewModel on _EBelgePdfViewModelBase, Store {
  Computed<String>? _$getPageCounterComputed;

  @override
  String get getPageCounter =>
      (_$getPageCounterComputed ??= Computed<String>(() => super.getPageCounter,
              name: '_EBelgePdfViewModelBase.getPageCounter'))
          .value;

  late final _$currentPageAtom =
      Atom(name: '_EBelgePdfViewModelBase.currentPage', context: context);

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
      Atom(name: '_EBelgePdfViewModelBase.pageCounter', context: context);

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
      Atom(name: '_EBelgePdfViewModelBase.pdfFile', context: context);

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
      Atom(name: '_EBelgePdfViewModelBase.futureController', context: context);

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

  late final _$modelAtom =
      Atom(name: '_EBelgePdfViewModelBase.model', context: context);

  @override
  EBelgePdfRequestModel get model {
    _$modelAtom.reportRead();
    return super.model;
  }

  @override
  set model(EBelgePdfRequestModel value) {
    _$modelAtom.reportWrite(value, super.model, () {
      super.model = value;
    });
  }

  late final _$eBelgePdfModelAtom =
      Atom(name: '_EBelgePdfViewModelBase.eBelgePdfModel', context: context);

  @override
  EBelgePdfModel? get eBelgePdfModel {
    _$eBelgePdfModelAtom.reportRead();
    return super.eBelgePdfModel;
  }

  @override
  set eBelgePdfModel(EBelgePdfModel? value) {
    _$eBelgePdfModelAtom.reportWrite(value, super.eBelgePdfModel, () {
      super.eBelgePdfModel = value;
    });
  }

  late final _$getFileAsyncAction =
      AsyncAction('_EBelgePdfViewModelBase.getFile', context: context);

  @override
  Future<void> getFile() {
    return _$getFileAsyncAction.run(() => super.getFile());
  }

  late final _$getDataAsyncAction =
      AsyncAction('_EBelgePdfViewModelBase.getData', context: context);

  @override
  Future<void> getData() {
    return _$getDataAsyncAction.run(() => super.getData());
  }

  late final _$_EBelgePdfViewModelBaseActionController =
      ActionController(name: '_EBelgePdfViewModelBase', context: context);

  @override
  void changePdfFile(File? value) {
    final _$actionInfo = _$_EBelgePdfViewModelBaseActionController.startAction(
        name: '_EBelgePdfViewModelBase.changePdfFile');
    try {
      return super.changePdfFile(value);
    } finally {
      _$_EBelgePdfViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeCurrentPage(int value) {
    final _$actionInfo = _$_EBelgePdfViewModelBaseActionController.startAction(
        name: '_EBelgePdfViewModelBase.changeCurrentPage');
    try {
      return super.changeCurrentPage(value);
    } finally {
      _$_EBelgePdfViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changePageCounter(int value) {
    final _$actionInfo = _$_EBelgePdfViewModelBaseActionController.startAction(
        name: '_EBelgePdfViewModelBase.changePageCounter');
    try {
      return super.changePageCounter(value);
    } finally {
      _$_EBelgePdfViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeEBelgePdfModel(EBelgePdfModel? value) {
    final _$actionInfo = _$_EBelgePdfViewModelBaseActionController.startAction(
        name: '_EBelgePdfViewModelBase.changeEBelgePdfModel');
    try {
      return super.changeEBelgePdfModel(value);
    } finally {
      _$_EBelgePdfViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentPage: ${currentPage},
pageCounter: ${pageCounter},
pdfFile: ${pdfFile},
futureController: ${futureController},
model: ${model},
eBelgePdfModel: ${eBelgePdfModel},
getPageCounter: ${getPageCounter}
    ''';
  }
}
