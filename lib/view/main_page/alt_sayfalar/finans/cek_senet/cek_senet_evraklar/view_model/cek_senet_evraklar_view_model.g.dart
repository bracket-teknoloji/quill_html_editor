// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cek_senet_evraklar_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CekSenetEvraklarViewModel on _CekSenetEvraklarViewModelBase, Store {
  late final _$evraklarListesiAtom = Atom(
      name: '_CekSenetEvraklarViewModelBase.evraklarListesi', context: context);

  @override
  ObservableList<EvraklarModel>? get evraklarListesi {
    _$evraklarListesiAtom.reportRead();
    return super.evraklarListesi;
  }

  @override
  set evraklarListesi(ObservableList<EvraklarModel>? value) {
    _$evraklarListesiAtom.reportWrite(value, super.evraklarListesi, () {
      super.evraklarListesi = value;
    });
  }

  late final _$requestModelAtom = Atom(
      name: '_CekSenetEvraklarViewModelBase.requestModel', context: context);

  @override
  EvraklarRequestModel get requestModel {
    _$requestModelAtom.reportRead();
    return super.requestModel;
  }

  @override
  set requestModel(EvraklarRequestModel value) {
    _$requestModelAtom.reportWrite(value, super.requestModel, () {
      super.requestModel = value;
    });
  }

  late final _$resetPageAsyncAction =
      AsyncAction('_CekSenetEvraklarViewModelBase.resetPage', context: context);

  @override
  Future<void> resetPage() {
    return _$resetPageAsyncAction.run(() => super.resetPage());
  }

  late final _$deleteEvrakAsyncAction = AsyncAction(
      '_CekSenetEvraklarViewModelBase.deleteEvrak',
      context: context);

  @override
  Future<GenericResponseModel<NetworkManagerMixin>> deleteEvrak(
      EvraklarModel model) {
    return _$deleteEvrakAsyncAction.run(() => super.deleteEvrak(model));
  }

  late final _$uploadEvrakAsyncAction = AsyncAction(
      '_CekSenetEvraklarViewModelBase.uploadEvrak',
      context: context);

  @override
  Future<GenericResponseModel<NetworkManagerMixin>> uploadEvrak(
      EvraklarModel model) {
    return _$uploadEvrakAsyncAction.run(() => super.uploadEvrak(model));
  }

  late final _$getDataAsyncAction =
      AsyncAction('_CekSenetEvraklarViewModelBase.getData', context: context);

  @override
  Future<void> getData() {
    return _$getDataAsyncAction.run(() => super.getData());
  }

  late final _$_CekSenetEvraklarViewModelBaseActionController =
      ActionController(
          name: '_CekSenetEvraklarViewModelBase', context: context);

  @override
  void setEvraklarListesi(List<EvraklarModel>? value) {
    final _$actionInfo = _$_CekSenetEvraklarViewModelBaseActionController
        .startAction(name: '_CekSenetEvraklarViewModelBase.setEvraklarListesi');
    try {
      return super.setEvraklarListesi(value);
    } finally {
      _$_CekSenetEvraklarViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
evraklarListesi: ${evraklarListesi},
requestModel: ${requestModel}
    ''';
  }
}
