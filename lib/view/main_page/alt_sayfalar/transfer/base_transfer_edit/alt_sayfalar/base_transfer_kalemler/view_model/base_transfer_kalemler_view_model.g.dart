// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_transfer_kalemler_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BaseTransferKalemlerViewModel
    on BaseTransferKalemlerViewModelBase, Store {
  late final _$kalemListAtom = Atom(
    name: 'BaseTransferKalemlerViewModelBase.kalemList',
    context: context,
  );

  @override
  ObservableList<KalemModel>? get kalemList {
    _$kalemListAtom.reportRead();
    return super.kalemList;
  }

  @override
  set kalemList(ObservableList<KalemModel>? value) {
    _$kalemListAtom.reportWrite(value, super.kalemList, () {
      super.kalemList = value;
    });
  }

  late final _$BaseTransferKalemlerViewModelBaseActionController =
      ActionController(
        name: 'BaseTransferKalemlerViewModelBase',
        context: context,
      );

  @override
  void removeAtKalemList(int index) {
    final _$actionInfo = _$BaseTransferKalemlerViewModelBaseActionController
        .startAction(
          name: 'BaseTransferKalemlerViewModelBase.removeAtKalemList',
        );
    try {
      return super.removeAtKalemList(index);
    } finally {
      _$BaseTransferKalemlerViewModelBaseActionController.endAction(
        _$actionInfo,
      );
    }
  }

  @override
  void updateKalemList() {
    final _$actionInfo = _$BaseTransferKalemlerViewModelBaseActionController
        .startAction(name: 'BaseTransferKalemlerViewModelBase.updateKalemList');
    try {
      return super.updateKalemList();
    } finally {
      _$BaseTransferKalemlerViewModelBaseActionController.endAction(
        _$actionInfo,
      );
    }
  }

  @override
  String toString() {
    return '''
kalemList: ${kalemList}
    ''';
  }
}
