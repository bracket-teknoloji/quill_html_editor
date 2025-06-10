// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fiyat_gecmisi_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FiyatGecmisiViewModel on _FiyatGecmisiViewModelBase, Store {
  late final _$modelAtom = Atom(
    name: '_FiyatGecmisiViewModelBase.model',
    context: context,
  );

  @override
  FiyatGecmisiModel get model {
    _$modelAtom.reportRead();
    return super.model;
  }

  @override
  set model(FiyatGecmisiModel value) {
    _$modelAtom.reportWrite(value, super.model, () {
      super.model = value;
    });
  }

  late final _$modelListAtom = Atom(
    name: '_FiyatGecmisiViewModelBase.modelList',
    context: context,
  );

  @override
  ObservableList<FiyatGecmisiResponseModel>? get modelList {
    _$modelListAtom.reportRead();
    return super.modelList;
  }

  @override
  set modelList(ObservableList<FiyatGecmisiResponseModel>? value) {
    _$modelListAtom.reportWrite(value, super.modelList, () {
      super.modelList = value;
    });
  }

  late final _$filteredModelListAtom = Atom(
    name: '_FiyatGecmisiViewModelBase.filteredModelList',
    context: context,
  );

  @override
  ObservableList<FiyatGecmisiResponseModel>? get filteredModelList {
    _$filteredModelListAtom.reportRead();
    return super.filteredModelList;
  }

  @override
  set filteredModelList(ObservableList<FiyatGecmisiResponseModel>? value) {
    _$filteredModelListAtom.reportWrite(value, super.filteredModelList, () {
      super.filteredModelList = value;
    });
  }

  late final _$printModelAtom = Atom(
    name: '_FiyatGecmisiViewModelBase.printModel',
    context: context,
  );

  @override
  PrintModel get printModel {
    _$printModelAtom.reportRead();
    return super.printModel;
  }

  @override
  set printModel(PrintModel value) {
    _$printModelAtom.reportWrite(value, super.printModel, () {
      super.printModel = value;
    });
  }

  late final _$searchBarAtom = Atom(
    name: '_FiyatGecmisiViewModelBase.searchBar',
    context: context,
  );

  @override
  bool get searchBar {
    _$searchBarAtom.reportRead();
    return super.searchBar;
  }

  @override
  set searchBar(bool value) {
    _$searchBarAtom.reportWrite(value, super.searchBar, () {
      super.searchBar = value;
    });
  }

  late final _$alisSatisGroupValueAtom = Atom(
    name: '_FiyatGecmisiViewModelBase.alisSatisGroupValue',
    context: context,
  );

  @override
  String get alisSatisGroupValue {
    _$alisSatisGroupValueAtom.reportRead();
    return super.alisSatisGroupValue;
  }

  @override
  set alisSatisGroupValue(String value) {
    _$alisSatisGroupValueAtom.reportWrite(value, super.alisSatisGroupValue, () {
      super.alisSatisGroupValue = value;
    });
  }

  late final _$yazdirmaGroupValueAtom = Atom(
    name: '_FiyatGecmisiViewModelBase.yazdirmaGroupValue',
    context: context,
  );

  @override
  String get yazdirmaGroupValue {
    _$yazdirmaGroupValueAtom.reportRead();
    return super.yazdirmaGroupValue;
  }

  @override
  set yazdirmaGroupValue(String value) {
    _$yazdirmaGroupValueAtom.reportWrite(value, super.yazdirmaGroupValue, () {
      super.yazdirmaGroupValue = value;
    });
  }

  late final _$fiyatTipiGroupValueAtom = Atom(
    name: '_FiyatGecmisiViewModelBase.fiyatTipiGroupValue',
    context: context,
  );

  @override
  String get fiyatTipiGroupValue {
    _$fiyatTipiGroupValueAtom.reportRead();
    return super.fiyatTipiGroupValue;
  }

  @override
  set fiyatTipiGroupValue(String value) {
    _$fiyatTipiGroupValueAtom.reportWrite(value, super.fiyatTipiGroupValue, () {
      super.fiyatTipiGroupValue = value;
    });
  }

  late final _$_FiyatGecmisiViewModelBaseActionController = ActionController(
    name: '_FiyatGecmisiViewModelBase',
    context: context,
  );

  @override
  void setDizaynId(int? value) {
    final _$actionInfo = _$_FiyatGecmisiViewModelBaseActionController
        .startAction(name: '_FiyatGecmisiViewModelBase.setDizaynId');
    try {
      return super.setDizaynId(value);
    } finally {
      _$_FiyatGecmisiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setYaziciAdi(YaziciList? value) {
    final _$actionInfo = _$_FiyatGecmisiViewModelBaseActionController
        .startAction(name: '_FiyatGecmisiViewModelBase.setYaziciAdi');
    try {
      return super.setYaziciAdi(value);
    } finally {
      _$_FiyatGecmisiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDicParams(DicParams? value) {
    final _$actionInfo = _$_FiyatGecmisiViewModelBaseActionController
        .startAction(name: '_FiyatGecmisiViewModelBase.setDicParams');
    try {
      return super.setDicParams(value);
    } finally {
      _$_FiyatGecmisiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void filterModelList(String value) {
    final _$actionInfo = _$_FiyatGecmisiViewModelBaseActionController
        .startAction(name: '_FiyatGecmisiViewModelBase.filterModelList');
    try {
      return super.filterModelList(value);
    } finally {
      _$_FiyatGecmisiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void replaceModelList(FiyatGecmisiResponseModel? value) {
    final _$actionInfo = _$_FiyatGecmisiViewModelBaseActionController
        .startAction(name: '_FiyatGecmisiViewModelBase.replaceModelList');
    try {
      return super.replaceModelList(value);
    } finally {
      _$_FiyatGecmisiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setModelList(List<FiyatGecmisiResponseModel>? modelList) {
    final _$actionInfo = _$_FiyatGecmisiViewModelBaseActionController
        .startAction(name: '_FiyatGecmisiViewModelBase.setModelList');
    try {
      return super.setModelList(modelList);
    } finally {
      _$_FiyatGecmisiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSearchBar() {
    final _$actionInfo = _$_FiyatGecmisiViewModelBaseActionController
        .startAction(name: '_FiyatGecmisiViewModelBase.setSearchBar');
    try {
      return super.setSearchBar();
    } finally {
      _$_FiyatGecmisiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setAlisSatisGroupValue(int value) {
    final _$actionInfo = _$_FiyatGecmisiViewModelBaseActionController
        .startAction(name: '_FiyatGecmisiViewModelBase.setAlisSatisGroupValue');
    try {
      return super.setAlisSatisGroupValue(value);
    } finally {
      _$_FiyatGecmisiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setYazdirmaGroupValue(int value) {
    final _$actionInfo = _$_FiyatGecmisiViewModelBaseActionController
        .startAction(name: '_FiyatGecmisiViewModelBase.setYazdirmaGroupValue');
    try {
      return super.setYazdirmaGroupValue(value);
    } finally {
      _$_FiyatGecmisiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setfiyatTipiGroupValue(int value) {
    final _$actionInfo = _$_FiyatGecmisiViewModelBaseActionController
        .startAction(name: '_FiyatGecmisiViewModelBase.setfiyatTipiGroupValue');
    try {
      return super.setfiyatTipiGroupValue(value);
    } finally {
      _$_FiyatGecmisiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
model: ${model},
modelList: ${modelList},
filteredModelList: ${filteredModelList},
printModel: ${printModel},
searchBar: ${searchBar},
alisSatisGroupValue: ${alisSatisGroupValue},
yazdirmaGroupValue: ${yazdirmaGroupValue},
fiyatTipiGroupValue: ${fiyatTipiGroupValue}
    ''';
  }
}
