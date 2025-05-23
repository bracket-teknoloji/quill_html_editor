// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'siparis_rehberi_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SiparisRehberiViewModel on _SiparisRehberiViewModelBase, Store {
  late final _$siparisListAtom = Atom(name: '_SiparisRehberiViewModelBase.siparisList', context: context);

  @override
  ObservableList<BaseSiparisEditModel>? get siparisList {
    _$siparisListAtom.reportRead();
    return super.siparisList;
  }

  @override
  set siparisList(ObservableList<BaseSiparisEditModel>? value) {
    _$siparisListAtom.reportWrite(value, super.siparisList, () {
      super.siparisList = value;
    });
  }

  late final _$selectedSiparisListAtom = Atom(
    name: '_SiparisRehberiViewModelBase.selectedSiparisList',
    context: context,
  );

  @override
  ObservableList<BaseSiparisEditModel> get selectedSiparisList {
    _$selectedSiparisListAtom.reportRead();
    return super.selectedSiparisList;
  }

  @override
  set selectedSiparisList(ObservableList<BaseSiparisEditModel> value) {
    _$selectedSiparisListAtom.reportWrite(value, super.selectedSiparisList, () {
      super.selectedSiparisList = value;
    });
  }

  late final _$requestModelAtom = Atom(name: '_SiparisRehberiViewModelBase.requestModel', context: context);

  @override
  SiparislerRequestModel get requestModel {
    _$requestModelAtom.reportRead();
    return super.requestModel;
  }

  @override
  set requestModel(SiparislerRequestModel value) {
    _$requestModelAtom.reportWrite(value, super.requestModel, () {
      super.requestModel = value;
    });
  }

  late final _$resetPageAsyncAction = AsyncAction('_SiparisRehberiViewModelBase.resetPage', context: context);

  @override
  Future<void> resetPage() {
    return _$resetPageAsyncAction.run(() => super.resetPage());
  }

  late final _$getDataAsyncAction = AsyncAction('_SiparisRehberiViewModelBase.getData', context: context);

  @override
  Future<void> getData() {
    return _$getDataAsyncAction.run(() => super.getData());
  }

  late final _$_SiparisRehberiViewModelBaseActionController = ActionController(
    name: '_SiparisRehberiViewModelBase',
    context: context,
  );

  @override
  void setRequestModel(BaseSiparisEditModel model) {
    final _$actionInfo = _$_SiparisRehberiViewModelBaseActionController.startAction(
      name: '_SiparisRehberiViewModelBase.setRequestModel',
    );
    try {
      return super.setRequestModel(model);
    } finally {
      _$_SiparisRehberiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setBaslangicTarihi(String? value) {
    final _$actionInfo = _$_SiparisRehberiViewModelBaseActionController.startAction(
      name: '_SiparisRehberiViewModelBase.setBaslangicTarihi',
    );
    try {
      return super.setBaslangicTarihi(value);
    } finally {
      _$_SiparisRehberiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setBitisTarihi(String? value) {
    final _$actionInfo = _$_SiparisRehberiViewModelBaseActionController.startAction(
      name: '_SiparisRehberiViewModelBase.setBitisTarihi',
    );
    try {
      return super.setBitisTarihi(value);
    } finally {
      _$_SiparisRehberiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSiparisList(List<BaseSiparisEditModel>? value) {
    final _$actionInfo = _$_SiparisRehberiViewModelBaseActionController.startAction(
      name: '_SiparisRehberiViewModelBase.setSiparisList',
    );
    try {
      return super.setSiparisList(value);
    } finally {
      _$_SiparisRehberiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void incrementPage() {
    final _$actionInfo = _$_SiparisRehberiViewModelBaseActionController.startAction(
      name: '_SiparisRehberiViewModelBase.incrementPage',
    );
    try {
      return super.incrementPage();
    } finally {
      _$_SiparisRehberiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addSelectedSiparis(BaseSiparisEditModel value) {
    final _$actionInfo = _$_SiparisRehberiViewModelBaseActionController.startAction(
      name: '_SiparisRehberiViewModelBase.addSelectedSiparis',
    );
    try {
      return super.addSelectedSiparis(value);
    } finally {
      _$_SiparisRehberiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeSelectedSiparis(BaseSiparisEditModel value) {
    final _$actionInfo = _$_SiparisRehberiViewModelBaseActionController.startAction(
      name: '_SiparisRehberiViewModelBase.removeSelectedSiparis',
    );
    try {
      return super.removeSelectedSiparis(value);
    } finally {
      _$_SiparisRehberiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
siparisList: ${siparisList},
selectedSiparisList: ${selectedSiparisList},
requestModel: ${requestModel}
    ''';
  }
}
