// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sayim_listesi_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SayimListesiViewModel on _SayimListesiViewModelBase, Store {
  late final _$sayimListAtom = Atom(
    name: '_SayimListesiViewModelBase.sayimList',
    context: context,
  );

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

  late final _$grupKoduListAtom = Atom(
    name: '_SayimListesiViewModelBase.grupKoduList',
    context: context,
  );

  @override
  ObservableList<BaseGrupKoduModel>? get grupKoduList {
    _$grupKoduListAtom.reportRead();
    return super.grupKoduList;
  }

  @override
  set grupKoduList(ObservableList<BaseGrupKoduModel>? value) {
    _$grupKoduListAtom.reportWrite(value, super.grupKoduList, () {
      super.grupKoduList = value;
    });
  }

  late final _$filtreModelAtom = Atom(
    name: '_SayimListesiViewModelBase.filtreModel',
    context: context,
  );

  @override
  SayimFiltreModel get filtreModel {
    _$filtreModelAtom.reportRead();
    return super.filtreModel;
  }

  @override
  set filtreModel(SayimFiltreModel value) {
    _$filtreModelAtom.reportWrite(value, super.filtreModel, () {
      super.filtreModel = value;
    });
  }

  late final _$getDataAsyncAction = AsyncAction(
    '_SayimListesiViewModelBase.getData',
    context: context,
  );

  @override
  Future<void> getData() {
    return _$getDataAsyncAction.run(() => super.getData());
  }

  late final _$postDataAsyncAction = AsyncAction(
    '_SayimListesiViewModelBase.postData',
    context: context,
  );

  @override
  Future<bool> postData() {
    return _$postDataAsyncAction.run(() => super.postData());
  }

  late final _$_SayimListesiViewModelBaseActionController = ActionController(
    name: '_SayimListesiViewModelBase',
    context: context,
  );

  @override
  void setSayimList(List<SayimListesiModel>? value) {
    final _$actionInfo = _$_SayimListesiViewModelBaseActionController.startAction(
      name: '_SayimListesiViewModelBase.setSayimList',
    );
    try {
      return super.setSayimList(value);
    } finally {
      _$_SayimListesiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
sayimList: ${sayimList},
grupKoduList: ${grupKoduList},
filtreModel: ${filtreModel}
    ''';
  }
}
