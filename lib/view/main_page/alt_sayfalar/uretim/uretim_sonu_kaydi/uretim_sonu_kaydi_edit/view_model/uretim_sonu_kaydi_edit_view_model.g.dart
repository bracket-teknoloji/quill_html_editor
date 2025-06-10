// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'uretim_sonu_kaydi_edit_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UretimSonuKaydiEditViewModel
    on _UretimSonuKaydiEditViewModelBase, Store {
  Computed<UretimSonuKaydiListesiRequestModel>? _$kalemlerRequestModelComputed;

  @override
  UretimSonuKaydiListesiRequestModel get kalemlerRequestModel =>
      (_$kalemlerRequestModelComputed ??=
              Computed<UretimSonuKaydiListesiRequestModel>(
                () => super.kalemlerRequestModel,
                name: '_UretimSonuKaydiEditViewModelBase.kalemlerRequestModel',
              ))
          .value;

  late final _$showSaveButtonAtom = Atom(
    name: '_UretimSonuKaydiEditViewModelBase.showSaveButton',
    context: context,
  );

  @override
  bool get showSaveButton {
    _$showSaveButtonAtom.reportRead();
    return super.showSaveButton;
  }

  @override
  set showSaveButton(bool value) {
    _$showSaveButtonAtom.reportWrite(value, super.showSaveButton, () {
      super.showSaveButton = value;
    });
  }

  late final _$modelAtom = Atom(
    name: '_UretimSonuKaydiEditViewModelBase.model',
    context: context,
  );

  @override
  KalemModel? get model {
    _$modelAtom.reportRead();
    return super.model;
  }

  @override
  set model(KalemModel? value) {
    _$modelAtom.reportWrite(value, super.model, () {
      super.model = value;
    });
  }

  late final _$requestModelAtom = Atom(
    name: '_UretimSonuKaydiEditViewModelBase.requestModel',
    context: context,
  );

  @override
  UretimSonuKaydiEditModel get requestModel {
    _$requestModelAtom.reportRead();
    return super.requestModel;
  }

  @override
  set requestModel(UretimSonuKaydiEditModel value) {
    _$requestModelAtom.reportWrite(value, super.requestModel, () {
      super.requestModel = value;
    });
  }

  late final _$kalemListAtom = Atom(
    name: '_UretimSonuKaydiEditViewModelBase.kalemList',
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

  late final _$ekAlanlarListAtom = Atom(
    name: '_UretimSonuKaydiEditViewModelBase.ekAlanlarList',
    context: context,
  );

  @override
  ObservableList<EkAlanlarModel>? get ekAlanlarList {
    _$ekAlanlarListAtom.reportRead();
    return super.ekAlanlarList;
  }

  @override
  set ekAlanlarList(ObservableList<EkAlanlarModel>? value) {
    _$ekAlanlarListAtom.reportWrite(value, super.ekAlanlarList, () {
      super.ekAlanlarList = value;
    });
  }

  late final _$getKalemlerAsyncAction = AsyncAction(
    '_UretimSonuKaydiEditViewModelBase.getKalemler',
    context: context,
  );

  @override
  Future<void> getKalemler() {
    return _$getKalemlerAsyncAction.run(() => super.getKalemler());
  }

  late final _$getEkAlanlarAsyncAction = AsyncAction(
    '_UretimSonuKaydiEditViewModelBase.getEkAlanlar',
    context: context,
  );

  @override
  Future<void> getEkAlanlar() {
    return _$getEkAlanlarAsyncAction.run(() => super.getEkAlanlar());
  }

  late final _$saveUSKAsyncAction = AsyncAction(
    '_UretimSonuKaydiEditViewModelBase.saveUSK',
    context: context,
  );

  @override
  Future<GenericResponseModel<UretimSonuKaydiEditModel>> saveUSK() {
    return _$saveUSKAsyncAction.run(() => super.saveUSK());
  }

  late final _$_UretimSonuKaydiEditViewModelBaseActionController =
      ActionController(
        name: '_UretimSonuKaydiEditViewModelBase',
        context: context,
      );

  @override
  void setBelgeNo(String? belgeNo) {
    final _$actionInfo = _$_UretimSonuKaydiEditViewModelBaseActionController
        .startAction(name: '_UretimSonuKaydiEditViewModelBase.setBelgeNo');
    try {
      return super.setBelgeNo(belgeNo);
    } finally {
      _$_UretimSonuKaydiEditViewModelBaseActionController.endAction(
        _$actionInfo,
      );
    }
  }

  @override
  void setKalemList(List<KalemModel>? list) {
    final _$actionInfo = _$_UretimSonuKaydiEditViewModelBaseActionController
        .startAction(name: '_UretimSonuKaydiEditViewModelBase.setKalemList');
    try {
      return super.setKalemList(list);
    } finally {
      _$_UretimSonuKaydiEditViewModelBaseActionController.endAction(
        _$actionInfo,
      );
    }
  }

  @override
  void setShowSaveButton(bool value) {
    final _$actionInfo = _$_UretimSonuKaydiEditViewModelBaseActionController
        .startAction(
          name: '_UretimSonuKaydiEditViewModelBase.setShowSaveButton',
        );
    try {
      return super.setShowSaveButton(value);
    } finally {
      _$_UretimSonuKaydiEditViewModelBaseActionController.endAction(
        _$actionInfo,
      );
    }
  }

  @override
  void setRequestModel(UretimSonuKaydiEditModel value) {
    final _$actionInfo = _$_UretimSonuKaydiEditViewModelBaseActionController
        .startAction(name: '_UretimSonuKaydiEditViewModelBase.setRequestModel');
    try {
      return super.setRequestModel(value);
    } finally {
      _$_UretimSonuKaydiEditViewModelBaseActionController.endAction(
        _$actionInfo,
      );
    }
  }

  @override
  void setModel(KalemModel? item) {
    final _$actionInfo = _$_UretimSonuKaydiEditViewModelBaseActionController
        .startAction(name: '_UretimSonuKaydiEditViewModelBase.setModel');
    try {
      return super.setModel(item);
    } finally {
      _$_UretimSonuKaydiEditViewModelBaseActionController.endAction(
        _$actionInfo,
      );
    }
  }

  @override
  String toString() {
    return '''
showSaveButton: ${showSaveButton},
model: ${model},
requestModel: ${requestModel},
kalemList: ${kalemList},
ekAlanlarList: ${ekAlanlarList},
kalemlerRequestModel: ${kalemlerRequestModel}
    ''';
  }
}
