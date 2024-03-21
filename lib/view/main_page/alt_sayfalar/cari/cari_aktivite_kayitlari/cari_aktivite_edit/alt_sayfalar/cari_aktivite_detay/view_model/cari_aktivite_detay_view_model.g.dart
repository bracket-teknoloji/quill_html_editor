// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cari_aktivite_detay_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CariAktiviteDetayViewModel on _CariAktiviteDetayViewModelBase, Store {
  late final _$aktiviteListAtom = Atom(
      name: '_CariAktiviteDetayViewModelBase.aktiviteList', context: context);

  @override
  ObservableList<CariAktiviteListesiModel> get aktiviteList {
    _$aktiviteListAtom.reportRead();
    return super.aktiviteList;
  }

  @override
  set aktiviteList(ObservableList<CariAktiviteListesiModel> value) {
    _$aktiviteListAtom.reportWrite(value, super.aktiviteList, () {
      super.aktiviteList = value;
    });
  }

  late final _$deleteDetayAsyncAction = AsyncAction(
      '_CariAktiviteDetayViewModelBase.deleteDetay',
      context: context);

  @override
  Future<GenericResponseModel<NetworkManagerMixin>?> deleteDetay(int? id) {
    return _$deleteDetayAsyncAction.run(() => super.deleteDetay(id));
  }

  late final _$_CariAktiviteDetayViewModelBaseActionController =
      ActionController(
          name: '_CariAktiviteDetayViewModelBase', context: context);

  @override
  void addAktivite(CariAktiviteListesiModel value) {
    final _$actionInfo = _$_CariAktiviteDetayViewModelBaseActionController
        .startAction(name: '_CariAktiviteDetayViewModelBase.addAktivite');
    try {
      return super.addAktivite(value);
    } finally {
      _$_CariAktiviteDetayViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void deleteAktivite(CariAktiviteListesiModel value) {
    final _$actionInfo = _$_CariAktiviteDetayViewModelBaseActionController
        .startAction(name: '_CariAktiviteDetayViewModelBase.deleteAktivite');
    try {
      return super.deleteAktivite(value);
    } finally {
      _$_CariAktiviteDetayViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void replaceAktivite(
      CariAktiviteListesiModel oldItem, CariAktiviteListesiModel newItem) {
    final _$actionInfo = _$_CariAktiviteDetayViewModelBaseActionController
        .startAction(name: '_CariAktiviteDetayViewModelBase.replaceAktivite');
    try {
      return super.replaceAktivite(oldItem, newItem);
    } finally {
      _$_CariAktiviteDetayViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
aktiviteList: ${aktiviteList}
    ''';
  }
}
