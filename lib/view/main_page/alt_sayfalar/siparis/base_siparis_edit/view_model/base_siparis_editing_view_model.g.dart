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

  late final _$_BaseSiparisEditingViewModelBaseActionController =
      ActionController(
          name: '_BaseSiparisEditingViewModelBase', context: context);

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
  String toString() {
    return '''
isLastPage: ${isLastPage},
getKalemCount: ${getKalemCount}
    ''';
  }
}
