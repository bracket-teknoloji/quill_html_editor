// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'is_emri_hammadde_takibi_detay_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$IsEmriHammaddeTakibiDetayViewModel
    on _IsEmriHammaddeTakibiDetayViewModelBase, Store {
  Computed<ObservableList<bool>>? _$valueListComputed;

  @override
  ObservableList<bool> get valueList => (_$valueListComputed ??=
          Computed<ObservableList<bool>>(() => super.valueList,
              name: '_IsEmriHammaddeTakibiDetayViewModelBase.valueList'))
      .value;

  late final _$observableListAtom = Atom(
      name: '_IsEmriHammaddeTakibiDetayViewModelBase.observableList',
      context: context);

  @override
  ObservableList<IsEmriHammaddeTakibiDetayModel>? get observableList {
    _$observableListAtom.reportRead();
    return super.observableList;
  }

  @override
  set observableList(ObservableList<IsEmriHammaddeTakibiDetayModel>? value) {
    _$observableListAtom.reportWrite(value, super.observableList, () {
      super.observableList = value;
    });
  }

  late final _$requestModelAtom = Atom(
      name: '_IsEmriHammaddeTakibiDetayViewModelBase.requestModel',
      context: context);

  @override
  IsEmriHammaddeTakibiDetayRequestModel get requestModel {
    _$requestModelAtom.reportRead();
    return super.requestModel;
  }

  @override
  set requestModel(IsEmriHammaddeTakibiDetayRequestModel value) {
    _$requestModelAtom.reportWrite(value, super.requestModel, () {
      super.requestModel = value;
    });
  }

  late final _$getDataAsyncAction = AsyncAction(
      '_IsEmriHammaddeTakibiDetayViewModelBase.getData',
      context: context);

  @override
  Future<void> getData() {
    return _$getDataAsyncAction.run(() => super.getData());
  }

  late final _$setBarkodAsyncAction = AsyncAction(
      '_IsEmriHammaddeTakibiDetayViewModelBase.setBarkod',
      context: context);

  @override
  Future<GenericResponseModel<IsEmriHammaddeTakibiDetayModel>> setBarkod(
      String stok) {
    return _$setBarkodAsyncAction.run(() => super.setBarkod(stok));
  }

  late final _$addItemAsyncAction = AsyncAction(
      '_IsEmriHammaddeTakibiDetayViewModelBase.addItem',
      context: context);

  @override
  Future<bool> addItem(String stok, String referansStok) {
    return _$addItemAsyncAction.run(() => super.addItem(stok, referansStok));
  }

  late final _$deleteItemAsyncAction = AsyncAction(
      '_IsEmriHammaddeTakibiDetayViewModelBase.deleteItem',
      context: context);

  @override
  Future<bool> deleteItem(IsEmriHammaddeTakibiDetayModel model) {
    return _$deleteItemAsyncAction.run(() => super.deleteItem(model));
  }

  late final _$_IsEmriHammaddeTakibiDetayViewModelBaseActionController =
      ActionController(
          name: '_IsEmriHammaddeTakibiDetayViewModelBase', context: context);

  @override
  void setObservableList(List<IsEmriHammaddeTakibiDetayModel>? list) {
    final _$actionInfo =
        _$_IsEmriHammaddeTakibiDetayViewModelBaseActionController.startAction(
            name: '_IsEmriHammaddeTakibiDetayViewModelBase.setObservableList');
    try {
      return super.setObservableList(list);
    } finally {
      _$_IsEmriHammaddeTakibiDetayViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setSelectedTipi(String? value) {
    final _$actionInfo =
        _$_IsEmriHammaddeTakibiDetayViewModelBaseActionController.startAction(
            name: '_IsEmriHammaddeTakibiDetayViewModelBase.setSelectedTipi');
    try {
      return super.setSelectedTipi(value);
    } finally {
      _$_IsEmriHammaddeTakibiDetayViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
observableList: ${observableList},
requestModel: ${requestModel},
valueList: ${valueList}
    ''';
  }
}
