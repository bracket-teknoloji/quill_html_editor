// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_siparis_editing_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BaseSiparisEditingViewModel on _BaseSiparisEditingViewModelBase, Store {
  Computed<int>? _$getKalemCountComputed;

  @override
  int get getKalemCount =>
      (_$getKalemCountComputed ??= Computed<int>(() => super.getKalemCount,
              name: '_BaseSiparisEditingViewModelBase.getKalemCount'))
          .value;

  late final _$pageIndexAtom = Atom(
      name: '_BaseSiparisEditingViewModelBase.pageIndex', context: context);

  @override
  int get pageIndex {
    _$pageIndexAtom.reportRead();
    return super.pageIndex;
  }

  @override
  set pageIndex(int value) {
    _$pageIndexAtom.reportWrite(value, super.pageIndex, () {
      super.pageIndex = value;
    });
  }

  late final _$isValidAtom =
      Atom(name: '_BaseSiparisEditingViewModelBase.isValid', context: context);

  @override
  bool get isValid {
    _$isValidAtom.reportRead();
    return super.isValid;
  }

  @override
  set isValid(bool value) {
    _$isValidAtom.reportWrite(value, super.isValid, () {
      super.isValid = value;
    });
  }

  late final _$isLastPageAtom = Atom(
      name: '_BaseSiparisEditingViewModelBase.isLastPage', context: context);

  @override
  bool get isLastPage {
    _$isLastPageAtom.reportRead();
    return super.isLastPage;
  }

  @override
  set isLastPage(bool value) {
    _$isLastPageAtom.reportWrite(value, super.isLastPage, () {
      super.isLastPage = value;
    });
  }

  late final _$isBaseSiparisEmptyAtom = Atom(
      name: '_BaseSiparisEditingViewModelBase.isBaseSiparisEmpty',
      context: context);

  @override
  bool get isBaseSiparisEmpty {
    _$isBaseSiparisEmptyAtom.reportRead();
    return super.isBaseSiparisEmpty;
  }

  @override
  set isBaseSiparisEmpty(bool value) {
    _$isBaseSiparisEmptyAtom.reportWrite(value, super.isBaseSiparisEmpty, () {
      super.isBaseSiparisEmpty = value;
    });
  }

  late final _$yeniKaydaHazirlaMiAtom = Atom(
      name: '_BaseSiparisEditingViewModelBase.yeniKaydaHazirlaMi',
      context: context);

  @override
  bool get yeniKaydaHazirlaMi {
    _$yeniKaydaHazirlaMiAtom.reportRead();
    return super.yeniKaydaHazirlaMi;
  }

  @override
  set yeniKaydaHazirlaMi(bool value) {
    _$yeniKaydaHazirlaMiAtom.reportWrite(value, super.yeniKaydaHazirlaMi, () {
      super.yeniKaydaHazirlaMi = value;
    });
  }

  late final _$_BaseSiparisEditingViewModelBaseActionController =
      ActionController(
          name: '_BaseSiparisEditingViewModelBase', context: context);

  @override
  void changeIsValid() {
    final _$actionInfo = _$_BaseSiparisEditingViewModelBaseActionController
        .startAction(name: '_BaseSiparisEditingViewModelBase.changeIsValid');
    try {
      return super.changeIsValid();
    } finally {
      _$_BaseSiparisEditingViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void changePageIndex(int value) {
    final _$actionInfo = _$_BaseSiparisEditingViewModelBaseActionController
        .startAction(name: '_BaseSiparisEditingViewModelBase.changePageIndex');
    try {
      return super.changePageIndex(value);
    } finally {
      _$_BaseSiparisEditingViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void changeIsLastPage(bool value) {
    final _$actionInfo = _$_BaseSiparisEditingViewModelBaseActionController
        .startAction(name: '_BaseSiparisEditingViewModelBase.changeIsLastPage');
    try {
      return super.changeIsLastPage(value);
    } finally {
      _$_BaseSiparisEditingViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void changeIsBaseSiparisEmpty(bool value) {
    final _$actionInfo =
        _$_BaseSiparisEditingViewModelBaseActionController.startAction(
            name: '_BaseSiparisEditingViewModelBase.changeIsBaseSiparisEmpty');
    try {
      return super.changeIsBaseSiparisEmpty(value);
    } finally {
      _$_BaseSiparisEditingViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void changeFuture() {
    final _$actionInfo = _$_BaseSiparisEditingViewModelBaseActionController
        .startAction(name: '_BaseSiparisEditingViewModelBase.changeFuture');
    try {
      return super.changeFuture();
    } finally {
      _$_BaseSiparisEditingViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void changeYeniKaydaHazirlaMi() {
    final _$actionInfo =
        _$_BaseSiparisEditingViewModelBaseActionController.startAction(
            name: '_BaseSiparisEditingViewModelBase.changeYeniKaydaHazirlaMi');
    try {
      return super.changeYeniKaydaHazirlaMi();
    } finally {
      _$_BaseSiparisEditingViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
pageIndex: ${pageIndex},
isValid: ${isValid},
isLastPage: ${isLastPage},
isBaseSiparisEmpty: ${isBaseSiparisEmpty},
yeniKaydaHazirlaMi: ${yeniKaydaHazirlaMi},
getKalemCount: ${getKalemCount}
    ''';
  }
}
