// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'olcum_girisi_listesi_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$OlcumGirisiViewModel on _OlcumGirisiViewModelBase, Store {
  late final _$searchBarAtom = Atom(
    name: '_OlcumGirisiViewModelBase.searchBar',
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

  late final _$appBarTitleAtom = Atom(
    name: '_OlcumGirisiViewModelBase.appBarTitle',
    context: context,
  );

  @override
  String? get appBarTitle {
    _$appBarTitleAtom.reportRead();
    return super.appBarTitle;
  }

  @override
  set appBarTitle(String? value) {
    _$appBarTitleAtom.reportWrite(value, super.appBarTitle, () {
      super.appBarTitle = value;
    });
  }

  late final _$dahaVarMiAtom = Atom(
    name: '_OlcumGirisiViewModelBase.dahaVarMi',
    context: context,
  );

  @override
  bool get dahaVarMi {
    _$dahaVarMiAtom.reportRead();
    return super.dahaVarMi;
  }

  @override
  set dahaVarMi(bool value) {
    _$dahaVarMiAtom.reportWrite(value, super.dahaVarMi, () {
      super.dahaVarMi = value;
    });
  }

  late final _$requestModelAtom = Atom(
    name: '_OlcumGirisiViewModelBase.requestModel',
    context: context,
  );

  @override
  OlcumGirisiRequestModel get requestModel {
    _$requestModelAtom.reportRead();
    return super.requestModel;
  }

  @override
  set requestModel(OlcumGirisiRequestModel value) {
    _$requestModelAtom.reportWrite(value, super.requestModel, () {
      super.requestModel = value;
    });
  }

  late final _$olcumListAtom = Atom(
    name: '_OlcumGirisiViewModelBase.olcumList',
    context: context,
  );

  @override
  ObservableList<OlcumBelgeModel>? get olcumList {
    _$olcumListAtom.reportRead();
    return super.olcumList;
  }

  @override
  set olcumList(ObservableList<OlcumBelgeModel>? value) {
    _$olcumListAtom.reportWrite(value, super.olcumList, () {
      super.olcumList = value;
    });
  }

  late final _$qrOlcumListAtom = Atom(
    name: '_OlcumGirisiViewModelBase.qrOlcumList',
    context: context,
  );

  @override
  ObservableList<OlcumBelgeModel>? get qrOlcumList {
    _$qrOlcumListAtom.reportRead();
    return super.qrOlcumList;
  }

  @override
  set qrOlcumList(ObservableList<OlcumBelgeModel>? value) {
    _$qrOlcumListAtom.reportWrite(value, super.qrOlcumList, () {
      super.qrOlcumList = value;
    });
  }

  late final _$resetSayfaAsyncAction = AsyncAction(
    '_OlcumGirisiViewModelBase.resetSayfa',
    context: context,
  );

  @override
  Future<void> resetSayfa() {
    return _$resetSayfaAsyncAction.run(() => super.resetSayfa());
  }

  late final _$getDataAsyncAction = AsyncAction(
    '_OlcumGirisiViewModelBase.getData',
    context: context,
  );

  @override
  Future<void> getData() {
    return _$getDataAsyncAction.run(() => super.getData());
  }

  late final _$_OlcumGirisiViewModelBaseActionController = ActionController(
    name: '_OlcumGirisiViewModelBase',
    context: context,
  );

  @override
  void setSearchBar() {
    final _$actionInfo = _$_OlcumGirisiViewModelBaseActionController.startAction(
      name: '_OlcumGirisiViewModelBase.setSearchBar',
    );
    try {
      return super.setSearchBar();
    } finally {
      _$_OlcumGirisiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDahaVarMi(bool value) {
    final _$actionInfo = _$_OlcumGirisiViewModelBaseActionController.startAction(
      name: '_OlcumGirisiViewModelBase.setDahaVarMi',
    );
    try {
      return super.setDahaVarMi(value);
    } finally {
      _$_OlcumGirisiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setBastar(String? value) {
    final _$actionInfo = _$_OlcumGirisiViewModelBaseActionController.startAction(
      name: '_OlcumGirisiViewModelBase.setBastar',
    );
    try {
      return super.setBastar(value);
    } finally {
      _$_OlcumGirisiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setBittar(String? value) {
    final _$actionInfo = _$_OlcumGirisiViewModelBaseActionController.startAction(
      name: '_OlcumGirisiViewModelBase.setBittar',
    );
    try {
      return super.setBittar(value);
    } finally {
      _$_OlcumGirisiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setBelgeTipi(EditTipiEnum? value) {
    final _$actionInfo = _$_OlcumGirisiViewModelBaseActionController.startAction(
      name: '_OlcumGirisiViewModelBase.setBelgeTipi',
    );
    try {
      return super.setBelgeTipi(value);
    } finally {
      _$_OlcumGirisiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSiralama(String? value) {
    final _$actionInfo = _$_OlcumGirisiViewModelBaseActionController.startAction(
      name: '_OlcumGirisiViewModelBase.setSiralama',
    );
    try {
      return super.setSiralama(value);
    } finally {
      _$_OlcumGirisiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDurum(int? value) {
    final _$actionInfo = _$_OlcumGirisiViewModelBaseActionController.startAction(
      name: '_OlcumGirisiViewModelBase.setDurum',
    );
    try {
      return super.setDurum(value);
    } finally {
      _$_OlcumGirisiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setQr(String? value) {
    final _$actionInfo = _$_OlcumGirisiViewModelBaseActionController.startAction(
      name: '_OlcumGirisiViewModelBase.setQr',
    );
    try {
      return super.setQr(value);
    } finally {
      _$_OlcumGirisiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setOlcumList(List<OlcumBelgeModel>? list) {
    final _$actionInfo = _$_OlcumGirisiViewModelBaseActionController.startAction(
      name: '_OlcumGirisiViewModelBase.setOlcumList',
    );
    try {
      return super.setOlcumList(list);
    } finally {
      _$_OlcumGirisiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setQrOlcumList(List<OlcumBelgeModel>? list) {
    final _$actionInfo = _$_OlcumGirisiViewModelBaseActionController.startAction(
      name: '_OlcumGirisiViewModelBase.setQrOlcumList',
    );
    try {
      return super.setQrOlcumList(list);
    } finally {
      _$_OlcumGirisiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addOlcumList(List<OlcumBelgeModel> list) {
    final _$actionInfo = _$_OlcumGirisiViewModelBaseActionController.startAction(
      name: '_OlcumGirisiViewModelBase.addOlcumList',
    );
    try {
      return super.addOlcumList(list);
    } finally {
      _$_OlcumGirisiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setAppBarTitle(String? value) {
    final _$actionInfo = _$_OlcumGirisiViewModelBaseActionController.startAction(
      name: '_OlcumGirisiViewModelBase.setAppBarTitle',
    );
    try {
      return super.setAppBarTitle(value);
    } finally {
      _$_OlcumGirisiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void increaseSayfa() {
    final _$actionInfo = _$_OlcumGirisiViewModelBaseActionController.startAction(
      name: '_OlcumGirisiViewModelBase.increaseSayfa',
    );
    try {
      return super.increaseSayfa();
    } finally {
      _$_OlcumGirisiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSearchText(String? value) {
    final _$actionInfo = _$_OlcumGirisiViewModelBaseActionController.startAction(
      name: '_OlcumGirisiViewModelBase.setSearchText',
    );
    try {
      return super.setSearchText(value);
    } finally {
      _$_OlcumGirisiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
searchBar: ${searchBar},
appBarTitle: ${appBarTitle},
dahaVarMi: ${dahaVarMi},
requestModel: ${requestModel},
olcumList: ${olcumList},
qrOlcumList: ${qrOlcumList}
    ''';
  }
}
