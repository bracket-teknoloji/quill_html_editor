// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_stok_edit_fiyat_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BaseStokEditFiyatViewModel on _BaseStokEditFiyatViewModelBase, Store {
  Computed<Map<int, String>>? _$dovizListComputed;

  @override
  Map<int, String> get dovizList => (_$dovizListComputed ??= Computed<Map<int, String>>(() => super.dovizList, name: '_BaseStokEditFiyatViewModelBase.dovizList')).value;

  late final _$kdvOraniListAtom = Atom(name: '_BaseStokEditFiyatViewModelBase.kdvOraniList', context: context);

  @override
  ObservableList<double>? get kdvOraniList {
    _$kdvOraniListAtom.reportRead();
    return super.kdvOraniList;
  }

  @override
  set kdvOraniList(ObservableList<double>? value) {
    _$kdvOraniListAtom.reportWrite(value, super.kdvOraniList, () {
      super.kdvOraniList = value;
    });
  }

  late final _$_BaseStokEditFiyatViewModelBaseActionController = ActionController(name: '_BaseStokEditFiyatViewModelBase', context: context);

  @override
  void setKdvOraniList(List<double> value) {
    final _$actionInfo = _$_BaseStokEditFiyatViewModelBaseActionController.startAction(name: '_BaseStokEditFiyatViewModelBase.setKdvOraniList');
    try {
      return super.setKdvOraniList(value);
    } finally {
      _$_BaseStokEditFiyatViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
kdvOraniList: ${kdvOraniList},
dovizList: ${dovizList}
    ''';
  }
}
