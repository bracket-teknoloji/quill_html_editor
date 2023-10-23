// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_fatura_edit_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BaseFaturaEditViewModel on _BaseFaturaEditViewModelBase, Store {
  late final _$isLastPageAtom = Atom(name: '_BaseFaturaEditViewModelBase.isLastPage', context: context);

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

  late final _$isLoadedAtom = Atom(name: '_BaseFaturaEditViewModelBase.isLoaded', context: context);

  @override
  bool get isLoaded {
    _$isLoadedAtom.reportRead();
    return super.isLoaded;
  }

  @override
  set isLoaded(bool value) {
    _$isLoadedAtom.reportWrite(value, super.isLoaded, () {
      super.isLoaded = value;
    });
  }

  late final _$_BaseFaturaEditViewModelBaseActionController = ActionController(name: '_BaseFaturaEditViewModelBase', context: context);

  @override
  void changeIsLastPage(bool value) {
    final _$actionInfo = _$_BaseFaturaEditViewModelBaseActionController.startAction(name: '_BaseFaturaEditViewModelBase.changeIsLastPage');
    try {
      return super.changeIsLastPage(value);
    } finally {
      _$_BaseFaturaEditViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeIsLoaded(bool value) {
    final _$actionInfo = _$_BaseFaturaEditViewModelBaseActionController.startAction(name: '_BaseFaturaEditViewModelBase.changeIsLoaded');
    try {
      return super.changeIsLoaded(value);
    } finally {
      _$_BaseFaturaEditViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLastPage: ${isLastPage},
isLoaded: ${isLoaded}
    ''';
  }
}
