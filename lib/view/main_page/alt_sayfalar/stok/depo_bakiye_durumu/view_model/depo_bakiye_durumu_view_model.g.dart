// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'depo_bakiye_durumu_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DepoBakiyeDurumuViewModel on _DepoBakiyeDurumuViewModelBase, Store {
  Computed<List<String>?>? _$subeAdiListComputed;

  @override
  List<String>? get subeAdiList => (_$subeAdiListComputed ??=
          Computed<List<String>?>(() => super.subeAdiList,
              name: '_DepoBakiyeDurumuViewModelBase.subeAdiList'))
      .value;

  late final _$depoBakiyeDurumuListAtom = Atom(
      name: '_DepoBakiyeDurumuViewModelBase.depoBakiyeDurumuList',
      context: context);

  @override
  ObservableList<DepoBakiyeDurumuModel>? get depoBakiyeDurumuList {
    _$depoBakiyeDurumuListAtom.reportRead();
    return super.depoBakiyeDurumuList;
  }

  @override
  set depoBakiyeDurumuList(ObservableList<DepoBakiyeDurumuModel>? value) {
    _$depoBakiyeDurumuListAtom.reportWrite(value, super.depoBakiyeDurumuList,
        () {
      super.depoBakiyeDurumuList = value;
    });
  }

  late final _$dicParamsAtom =
      Atom(name: '_DepoBakiyeDurumuViewModelBase.dicParams', context: context);

  @override
  DicParams get dicParams {
    _$dicParamsAtom.reportRead();
    return super.dicParams;
  }

  @override
  set dicParams(DicParams value) {
    _$dicParamsAtom.reportWrite(value, super.dicParams, () {
      super.dicParams = value;
    });
  }

  late final _$getDataAsyncAction =
      AsyncAction('_DepoBakiyeDurumuViewModelBase.getData', context: context);

  @override
  Future<void> getData() {
    return _$getDataAsyncAction.run(() => super.getData());
  }

  late final _$_DepoBakiyeDurumuViewModelBaseActionController =
      ActionController(
          name: '_DepoBakiyeDurumuViewModelBase', context: context);

  @override
  void setSifirHaric(bool? sifirHaric) {
    final _$actionInfo = _$_DepoBakiyeDurumuViewModelBaseActionController
        .startAction(name: '_DepoBakiyeDurumuViewModelBase.setSifirHaric');
    try {
      return super.setSifirHaric(sifirHaric);
    } finally {
      _$_DepoBakiyeDurumuViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setStokKodu(String? stokKodu) {
    final _$actionInfo = _$_DepoBakiyeDurumuViewModelBaseActionController
        .startAction(name: '_DepoBakiyeDurumuViewModelBase.setStokKodu');
    try {
      return super.setStokKodu(stokKodu);
    } finally {
      _$_DepoBakiyeDurumuViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDepoBakiyeDurumuList(List<DepoBakiyeDurumuModel>? list) {
    final _$actionInfo =
        _$_DepoBakiyeDurumuViewModelBaseActionController.startAction(
            name: '_DepoBakiyeDurumuViewModelBase.setDepoBakiyeDurumuList');
    try {
      return super.setDepoBakiyeDurumuList(list);
    } finally {
      _$_DepoBakiyeDurumuViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
depoBakiyeDurumuList: ${depoBakiyeDurumuList},
dicParams: ${dicParams},
subeAdiList: ${subeAdiList}
    ''';
  }
}
