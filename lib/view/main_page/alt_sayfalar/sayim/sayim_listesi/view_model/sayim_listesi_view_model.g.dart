// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sayim_listesi_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SayimListesiViewModel on _SayimListesiViewModelBase, Store {
  late final _$sayimListAtom =
      Atom(name: '_SayimListesiViewModelBase.sayimList', context: context);

  @override
  ObservableList<SayimListesiModel>? get sayimList {
    _$sayimListAtom.reportRead();
    return super.sayimList;
  }

  @override
  set sayimList(ObservableList<SayimListesiModel>? value) {
    _$sayimListAtom.reportWrite(value, super.sayimList, () {
      super.sayimList = value;
    });
  }

  late final _$getDataAsyncAction =
      AsyncAction('_SayimListesiViewModelBase.getData', context: context);

  @override
  Future<void> getData() {
    return _$getDataAsyncAction.run(() => super.getData());
  }

  late final _$_SayimListesiViewModelBaseActionController =
      ActionController(name: '_SayimListesiViewModelBase', context: context);

  @override
  void setSayimList(List<SayimListesiModel>? value) {
    final _$actionInfo = _$_SayimListesiViewModelBaseActionController
        .startAction(name: '_SayimListesiViewModelBase.setSayimList');
    try {
      return super.setSayimList(value);
    } finally {
      _$_SayimListesiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
sayimList: ${sayimList}
    ''';
  }
}
