// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fiyat_gor_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FiyatGorViewModel on _FiyatGorViewModelBase, Store {
  late final _$modelListAtom = Atom(
    name: '_FiyatGorViewModelBase.modelList',
    context: context,
  );

  @override
  List<FiyatGorModel?>? get modelList {
    _$modelListAtom.reportRead();
    return super.modelList;
  }

  @override
  set modelList(List<FiyatGorModel?>? value) {
    _$modelListAtom.reportWrite(value, super.modelList, () {
      super.modelList = value;
    });
  }

  late final _$stokListesiModelAtom = Atom(
    name: '_FiyatGorViewModelBase.stokListesiModel',
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

  late final _$_FiyatGorViewModelBaseActionController = ActionController(
    name: '_FiyatGorViewModelBase',
    context: context,
  );

  @override
  void setStokListesiModel(StokListesiModel? model) {
    final _$actionInfo = _$_FiyatGorViewModelBaseActionController.startAction(
      name: '_FiyatGorViewModelBase.setStokListesiModel',
    );
    try {
      return super.setStokListesiModel(model);
    } finally {
      _$_FiyatGorViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setModelList(List<FiyatGorModel?>? modelList) {
    final _$actionInfo = _$_FiyatGorViewModelBaseActionController.startAction(
      name: '_FiyatGorViewModelBase.setModelList',
    );
    try {
      return super.setModelList(modelList);
    } finally {
      _$_FiyatGorViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  double? getBilgi(int index, {bool isSatis = false}) {
    final _$actionInfo = _$_FiyatGorViewModelBaseActionController.startAction(
      name: '_FiyatGorViewModelBase.getBilgi',
    );
    try {
      return super.getBilgi(index, isSatis: isSatis);
    } finally {
      _$_FiyatGorViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
modelList: ${modelList},
stokListesiModel: ${stokListesiModel}
    ''';
  }
}
