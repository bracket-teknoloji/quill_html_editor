// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transfer_mal_talebi_kalemler_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TransferMalTalebiKalemlerViewModel
    on _TransferMalTalebiKalemlerViewModelBase, Store {
  late final _$kalemListAtom = Atom(
      name: '_TransferMalTalebiKalemlerViewModelBase.kalemList',
      context: context);

  @override
  ObservableList<KalemModel> get kalemList {
    _$kalemListAtom.reportRead();
    return super.kalemList;
  }

  @override
  set kalemList(ObservableList<KalemModel> value) {
    _$kalemListAtom.reportWrite(value, super.kalemList, () {
      super.kalemList = value;
    });
  }

  late final _$removeKalemAsyncAction = AsyncAction(
      '_TransferMalTalebiKalemlerViewModelBase.removeKalem',
      context: context);

  @override
  Future<bool> removeKalem(KalemModel value) {
    return _$removeKalemAsyncAction.run(() => super.removeKalem(value));
  }

  late final _$saveKalemAsyncAction = AsyncAction(
      '_TransferMalTalebiKalemlerViewModelBase.saveKalem',
      context: context);

  @override
  Future<bool> saveKalem(KalemModel model) {
    return _$saveKalemAsyncAction.run(() => super.saveKalem(model));
  }

  late final _$_TransferMalTalebiKalemlerViewModelBaseActionController =
      ActionController(
          name: '_TransferMalTalebiKalemlerViewModelBase', context: context);

  @override
  void setKalemList(List<KalemModel> value) {
    final _$actionInfo =
        _$_TransferMalTalebiKalemlerViewModelBaseActionController.startAction(
            name: '_TransferMalTalebiKalemlerViewModelBase.setKalemList');
    try {
      return super.setKalemList(value);
    } finally {
      _$_TransferMalTalebiKalemlerViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void addKalem(KalemModel value) {
    final _$actionInfo =
        _$_TransferMalTalebiKalemlerViewModelBaseActionController.startAction(
            name: '_TransferMalTalebiKalemlerViewModelBase.addKalem');
    try {
      return super.addKalem(value);
    } finally {
      _$_TransferMalTalebiKalemlerViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void updateKalem(KalemModel value) {
    final _$actionInfo =
        _$_TransferMalTalebiKalemlerViewModelBaseActionController.startAction(
            name: '_TransferMalTalebiKalemlerViewModelBase.updateKalem');
    try {
      return super.updateKalem(value);
    } finally {
      _$_TransferMalTalebiKalemlerViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
kalemList: ${kalemList}
    ''';
  }
}
