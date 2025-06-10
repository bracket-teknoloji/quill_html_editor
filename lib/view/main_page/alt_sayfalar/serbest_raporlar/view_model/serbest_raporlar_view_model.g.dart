// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'serbest_raporlar_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SerbestRaporlarViewModel on _SerbestRaporlarViewModelBase, Store {
  Computed<DicParams>? _$dicParamsComputedComputed;

  @override
  DicParams get dicParamsComputed =>
      (_$dicParamsComputedComputed ??= Computed<DicParams>(
        () => super.dicParamsComputed,
        name: '_SerbestRaporlarViewModelBase.dicParamsComputed',
      )).value;

  late final _$serbestRaporResponseModelListAtom = Atom(
    name: '_SerbestRaporlarViewModelBase.serbestRaporResponseModelList',
    context: context,
  );

  @override
  List<SerbestRaporResponseModel>? get serbestRaporResponseModelList {
    _$serbestRaporResponseModelListAtom.reportRead();
    return super.serbestRaporResponseModelList;
  }

  @override
  set serbestRaporResponseModelList(List<SerbestRaporResponseModel>? value) {
    _$serbestRaporResponseModelListAtom.reportWrite(
      value,
      super.serbestRaporResponseModelList,
      () {
        super.serbestRaporResponseModelList = value;
      },
    );
  }

  late final _$textEditingControllerListAtom = Atom(
    name: '_SerbestRaporlarViewModelBase.textEditingControllerList',
    context: context,
  );

  @override
  List<TextEditingController>? get textEditingControllerList {
    _$textEditingControllerListAtom.reportRead();
    return super.textEditingControllerList;
  }

  @override
  set textEditingControllerList(List<TextEditingController>? value) {
    _$textEditingControllerListAtom.reportWrite(
      value,
      super.textEditingControllerList,
      () {
        super.textEditingControllerList = value;
      },
    );
  }

  late final _$pdfModelAtom = Atom(
    name: '_SerbestRaporlarViewModelBase.pdfModel',
    context: context,
  );

  @override
  PdfModel get pdfModel {
    _$pdfModelAtom.reportRead();
    return super.pdfModel;
  }

  @override
  set pdfModel(PdfModel value) {
    _$pdfModelAtom.reportWrite(value, super.pdfModel, () {
      super.pdfModel = value;
    });
  }

  late final _$dicParamsAtom = Atom(
    name: '_SerbestRaporlarViewModelBase.dicParams',
    context: context,
  );

  @override
  ObservableMap<String, dynamic> get dicParams {
    _$dicParamsAtom.reportRead();
    return super.dicParams;
  }

  @override
  set dicParams(ObservableMap<String, dynamic> value) {
    _$dicParamsAtom.reportWrite(value, super.dicParams, () {
      super.dicParams = value;
    });
  }

  late final _$futureControllerAtom = Atom(
    name: '_SerbestRaporlarViewModelBase.futureController',
    context: context,
  );

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

  late final _$_SerbestRaporlarViewModelBaseActionController = ActionController(
    name: '_SerbestRaporlarViewModelBase',
    context: context,
  );

  @override
  void changeSerbestRaporResponseModelList(
    List<SerbestRaporResponseModel> value,
  ) {
    final _$actionInfo = _$_SerbestRaporlarViewModelBaseActionController
        .startAction(
          name:
              '_SerbestRaporlarViewModelBase.changeSerbestRaporResponseModelList',
        );
    try {
      return super.changeSerbestRaporResponseModelList(value);
    } finally {
      _$_SerbestRaporlarViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeControllerText(String name, String value) {
    final _$actionInfo = _$_SerbestRaporlarViewModelBaseActionController
        .startAction(
          name: '_SerbestRaporlarViewModelBase.changeControllerText',
        );
    try {
      return super.changeControllerText(name, value);
    } finally {
      _$_SerbestRaporlarViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void dispose() {
    final _$actionInfo = _$_SerbestRaporlarViewModelBaseActionController
        .startAction(name: '_SerbestRaporlarViewModelBase.dispose');
    try {
      return super.dispose();
    } finally {
      _$_SerbestRaporlarViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeDicParams(
    String key,
    String value, {
    bool changeController = true,
    String? controllerValue,
  }) {
    final _$actionInfo = _$_SerbestRaporlarViewModelBaseActionController
        .startAction(name: '_SerbestRaporlarViewModelBase.changeDicParams');
    try {
      return super.changeDicParams(
        key,
        value,
        changeController: changeController,
        controllerValue: controllerValue,
      );
    } finally {
      _$_SerbestRaporlarViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setFuture() {
    final _$actionInfo = _$_SerbestRaporlarViewModelBaseActionController
        .startAction(name: '_SerbestRaporlarViewModelBase.setFuture');
    try {
      return super.setFuture();
    } finally {
      _$_SerbestRaporlarViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEtiketSayisi(int? sayi) {
    final _$actionInfo = _$_SerbestRaporlarViewModelBaseActionController
        .startAction(name: '_SerbestRaporlarViewModelBase.setEtiketSayisi');
    try {
      return super.setEtiketSayisi(sayi);
    } finally {
      _$_SerbestRaporlarViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDizaynId(int? sayi) {
    final _$actionInfo = _$_SerbestRaporlarViewModelBaseActionController
        .startAction(name: '_SerbestRaporlarViewModelBase.setDizaynId');
    try {
      return super.setDizaynId(sayi);
    } finally {
      _$_SerbestRaporlarViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetFuture() {
    final _$actionInfo = _$_SerbestRaporlarViewModelBaseActionController
        .startAction(name: '_SerbestRaporlarViewModelBase.resetFuture');
    try {
      return super.resetFuture();
    } finally {
      _$_SerbestRaporlarViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
serbestRaporResponseModelList: ${serbestRaporResponseModelList},
textEditingControllerList: ${textEditingControllerList},
pdfModel: ${pdfModel},
dicParams: ${dicParams},
futureController: ${futureController},
dicParamsComputed: ${dicParamsComputed}
    ''';
  }
}
