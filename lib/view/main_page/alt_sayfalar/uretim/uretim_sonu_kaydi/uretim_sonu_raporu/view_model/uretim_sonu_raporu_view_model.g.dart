// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'uretim_sonu_raporu_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UretimSonuRaporuViewModel on _UretimSonuRaporuViewModelBase, Store {
  late final _$observableListAtom = Atom(
    name: '_UretimSonuRaporuViewModelBase.observableList',
    context: context,
  );

  @override
  ObservableList<StokHareketleriModel>? get observableList {
    _$observableListAtom.reportRead();
    return super.observableList;
  }

  @override
  set observableList(ObservableList<StokHareketleriModel>? value) {
    _$observableListAtom.reportWrite(value, super.observableList, () {
      super.observableList = value;
    });
  }

  late final _$getDataAsyncAction = AsyncAction(
    '_UretimSonuRaporuViewModelBase.getData',
    context: context,
  );

  @override
  Future<void> getData() {
    return _$getDataAsyncAction.run(() => super.getData());
  }

  late final _$_UretimSonuRaporuViewModelBaseActionController = ActionController(
    name: '_UretimSonuRaporuViewModelBase',
    context: context,
  );

  @override
  void setObservableList(List<StokHareketleriModel>? list) {
    final _$actionInfo = _$_UretimSonuRaporuViewModelBaseActionController.startAction(
      name: '_UretimSonuRaporuViewModelBase.setObservableList',
    );
    try {
      return super.setObservableList(list);
    } finally {
      _$_UretimSonuRaporuViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
observableList: ${observableList}
    ''';
  }
}
