// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_stok_edit_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BaseStokEditingViewModel on _BaseStokEditingViewModelBase, Store {
  late final _$stokListesiModelAtom = Atom(
    name: '_BaseStokEditingViewModelBase.stokListesiModel',
    context: context,
  );

  @override
  StokListesiModel? get stokListesiModel {
    _$stokListesiModelAtom.reportRead();
    return super.stokListesiModel;
  }

  @override
  set stokListesiModel(StokListesiModel? value) {
    _$stokListesiModelAtom.reportWrite(value, super.stokListesiModel, () {
      super.stokListesiModel = value;
    });
  }

  late final _$isSuccessAtom = Atom(
    name: '_BaseStokEditingViewModelBase.isSuccess',
    context: context,
  );

  @override
  bool get isSuccess {
    _$isSuccessAtom.reportRead();
    return super.isSuccess;
  }

  @override
  set isSuccess(bool value) {
    _$isSuccessAtom.reportWrite(value, super.isSuccess, () {
      super.isSuccess = value;
    });
  }

  late final _$getDataAsyncAction = AsyncAction(
    '_BaseStokEditingViewModelBase.getData',
    context: context,
  );

  @override
  Future<void> getData() {
    return _$getDataAsyncAction.run(() => super.getData());
  }

  late final _$_BaseStokEditingViewModelBaseActionController = ActionController(
    name: '_BaseStokEditingViewModelBase',
    context: context,
  );

  @override
  void setStokListesiModel(StokListesiModel? value) {
    final _$actionInfo = _$_BaseStokEditingViewModelBaseActionController
        .startAction(name: '_BaseStokEditingViewModelBase.setStokListesiModel');
    try {
      return super.setStokListesiModel(value);
    } finally {
      _$_BaseStokEditingViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIsSuccess(bool value) {
    final _$actionInfo = _$_BaseStokEditingViewModelBaseActionController
        .startAction(name: '_BaseStokEditingViewModelBase.setIsSuccess');
    try {
      return super.setIsSuccess(value);
    } finally {
      _$_BaseStokEditingViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
stokListesiModel: ${stokListesiModel},
isSuccess: ${isSuccess}
    ''';
  }
}
