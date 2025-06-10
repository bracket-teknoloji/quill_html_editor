// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stok_detayli_arama_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$StokDetayliAramaViewModel on _StokDetayliAramaViewModelBase, Store {
  late final _$observableListAtom = Atom(
    name: '_StokDetayliAramaViewModelBase.observableList',
    context: context,
  );

  @override
  ObservableList<StokDetayliAramaAlanlar>? get observableList {
    _$observableListAtom.reportRead();
    return super.observableList;
  }

  @override
  set observableList(ObservableList<StokDetayliAramaAlanlar>? value) {
    _$observableListAtom.reportWrite(value, super.observableList, () {
      super.observableList = value;
    });
  }

  late final _$_StokDetayliAramaViewModelBaseActionController =
      ActionController(
        name: '_StokDetayliAramaViewModelBase',
        context: context,
      );

  @override
  void setObservableList(List<StokDetayliAramaAlanlar>? list) {
    final _$actionInfo = _$_StokDetayliAramaViewModelBaseActionController
        .startAction(name: '_StokDetayliAramaViewModelBase.setObservableList');
    try {
      return super.setObservableList(list);
    } finally {
      _$_StokDetayliAramaViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setKriter(int index, ({String adi, String kodu}) sekli) {
    final _$actionInfo = _$_StokDetayliAramaViewModelBaseActionController
        .startAction(name: '_StokDetayliAramaViewModelBase.setKriter');
    try {
      return super.setKriter(index, sekli);
    } finally {
      _$_StokDetayliAramaViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSearchText(int index, String? value) {
    final _$actionInfo = _$_StokDetayliAramaViewModelBaseActionController
        .startAction(name: '_StokDetayliAramaViewModelBase.setSearchText');
    try {
      return super.setSearchText(index, value);
    } finally {
      _$_StokDetayliAramaViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
observableList: ${observableList}
    ''';
  }
}
