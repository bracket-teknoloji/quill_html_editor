// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fiyat_ozeti_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FiyatOzetiViewModel on _FiyatOzetiViewModelBase, Store {
  Computed<List<String?>?>? _$grupListComputed;

  @override
  List<String?>? get grupList =>
      (_$grupListComputed ??= Computed<List<String?>?>(() => super.grupList,
              name: '_FiyatOzetiViewModelBase.grupList'))
          .value;
  Computed<Map<String, List<StokFiyatOzetiModel>>>? _$grupMapComputed;

  @override
  Map<String, List<StokFiyatOzetiModel>> get grupMap => (_$grupMapComputed ??=
          Computed<Map<String, List<StokFiyatOzetiModel>>>(() => super.grupMap,
              name: '_FiyatOzetiViewModelBase.grupMap'))
      .value;

  late final _$requestModelAtom =
      Atom(name: '_FiyatOzetiViewModelBase.requestModel', context: context);

  @override
  StokFiyatOzetiRequestModel get requestModel {
    _$requestModelAtom.reportRead();
    return super.requestModel;
  }

  @override
  set requestModel(StokFiyatOzetiRequestModel value) {
    _$requestModelAtom.reportWrite(value, super.requestModel, () {
      super.requestModel = value;
    });
  }

  late final _$stokFiyatOzetiListesiAtom = Atom(
      name: '_FiyatOzetiViewModelBase.stokFiyatOzetiListesi', context: context);

  @override
  ObservableList<StokFiyatOzetiModel>? get stokFiyatOzetiListesi {
    _$stokFiyatOzetiListesiAtom.reportRead();
    return super.stokFiyatOzetiListesi;
  }

  @override
  set stokFiyatOzetiListesi(ObservableList<StokFiyatOzetiModel>? value) {
    _$stokFiyatOzetiListesiAtom.reportWrite(value, super.stokFiyatOzetiListesi,
        () {
      super.stokFiyatOzetiListesi = value;
    });
  }

  late final _$getDataAsyncAction =
      AsyncAction('_FiyatOzetiViewModelBase.getData', context: context);

  @override
  Future<void> getData() {
    return _$getDataAsyncAction.run(() => super.getData());
  }

  late final _$_FiyatOzetiViewModelBaseActionController =
      ActionController(name: '_FiyatOzetiViewModelBase', context: context);

  @override
  void setStokFiyatOzetiListesi(List<StokFiyatOzetiModel>? list) {
    final _$actionInfo = _$_FiyatOzetiViewModelBaseActionController.startAction(
        name: '_FiyatOzetiViewModelBase.setStokFiyatOzetiListesi');
    try {
      return super.setStokFiyatOzetiListesi(list);
    } finally {
      _$_FiyatOzetiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setRequestModel(StokFiyatOzetiRequestModel model) {
    final _$actionInfo = _$_FiyatOzetiViewModelBaseActionController.startAction(
        name: '_FiyatOzetiViewModelBase.setRequestModel');
    try {
      return super.setRequestModel(model);
    } finally {
      _$_FiyatOzetiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
requestModel: ${requestModel},
stokFiyatOzetiListesi: ${stokFiyatOzetiListesi},
grupList: ${grupList},
grupMap: ${grupMap}
    ''';
  }
}
