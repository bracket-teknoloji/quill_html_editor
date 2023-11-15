// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banka_listesi_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BankaListesiViewModel on _BankaListesiViewModelBase, Store {
  Computed<ObservableList<List<BankaListesiModel>>>? _$groupedWithHesapTipiAdiListComputed;

  @override
  ObservableList<List<BankaListesiModel>> get groupedWithHesapTipiAdiList => (_$groupedWithHesapTipiAdiListComputed ??=
          Computed<ObservableList<List<BankaListesiModel>>>(() => super.groupedWithHesapTipiAdiList, name: '_BankaListesiViewModelBase.groupedWithHesapTipiAdiList'))
      .value;

  late final _$searchBarAtom = Atom(name: '_BankaListesiViewModelBase.searchBar', context: context);

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

  late final _$errorTextAtom = Atom(name: '_BankaListesiViewModelBase.errorText', context: context);

  @override
  String? get errorText {
    _$errorTextAtom.reportRead();
    return super.errorText;
  }

  @override
  set errorText(String? value) {
    _$errorTextAtom.reportWrite(value, super.errorText, () {
      super.errorText = value;
    });
  }

  late final _$searchValueAtom = Atom(name: '_BankaListesiViewModelBase.searchValue', context: context);

  @override
  String? get searchValue {
    _$searchValueAtom.reportRead();
    return super.searchValue;
  }

  @override
  set searchValue(String? value) {
    _$searchValueAtom.reportWrite(value, super.searchValue, () {
      super.searchValue = value;
    });
  }

  late final _$bankaListesiAtom = Atom(name: '_BankaListesiViewModelBase.bankaListesi', context: context);

  @override
  ObservableList<BankaListesiModel>? get bankaListesi {
    _$bankaListesiAtom.reportRead();
    return super.bankaListesi;
  }

  @override
  set bankaListesi(ObservableList<BankaListesiModel>? value) {
    _$bankaListesiAtom.reportWrite(value, super.bankaListesi, () {
      super.bankaListesi = value;
    });
  }

  late final _$modelAtom = Atom(name: '_BankaListesiViewModelBase.model', context: context);

  @override
  BankaListesiRequestModel get model {
    _$modelAtom.reportRead();
    return super.model;
  }

  @override
  set model(BankaListesiRequestModel value) {
    _$modelAtom.reportWrite(value, super.model, () {
      super.model = value;
    });
  }

  late final _$resetPageAsyncAction = AsyncAction('_BankaListesiViewModelBase.resetPage', context: context);

  @override
  Future<void> resetPage() {
    return _$resetPageAsyncAction.run(() => super.resetPage());
  }

  late final _$getDataAsyncAction = AsyncAction('_BankaListesiViewModelBase.getData', context: context);

  @override
  Future<void> getData() {
    return _$getDataAsyncAction.run(() => super.getData());
  }

  late final _$_BankaListesiViewModelBaseActionController = ActionController(name: '_BankaListesiViewModelBase', context: context);

  @override
  void setSearchBar() {
    final _$actionInfo = _$_BankaListesiViewModelBaseActionController.startAction(name: '_BankaListesiViewModelBase.setSearchBar');
    try {
      return super.setSearchBar();
    } finally {
      _$_BankaListesiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSearchText(String? value) {
    final _$actionInfo = _$_BankaListesiViewModelBaseActionController.startAction(name: '_BankaListesiViewModelBase.setSearchText');
    try {
      return super.setSearchText(value);
    } finally {
      _$_BankaListesiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setErrorText(String? value) {
    final _$actionInfo = _$_BankaListesiViewModelBaseActionController.startAction(name: '_BankaListesiViewModelBase.setErrorText');
    try {
      return super.setErrorText(value);
    } finally {
      _$_BankaListesiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setBankaListesi(List<BankaListesiModel>? value) {
    final _$actionInfo = _$_BankaListesiViewModelBaseActionController.startAction(name: '_BankaListesiViewModelBase.setBankaListesi');
    try {
      return super.setBankaListesi(value);
    } finally {
      _$_BankaListesiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSiralama(String value) {
    final _$actionInfo = _$_BankaListesiViewModelBaseActionController.startAction(name: '_BankaListesiViewModelBase.setSiralama');
    try {
      return super.setSiralama(value);
    } finally {
      _$_BankaListesiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setHesapTipi(List<int>? value) {
    final _$actionInfo = _$_BankaListesiViewModelBaseActionController.startAction(name: '_BankaListesiViewModelBase.setHesapTipi');
    try {
      return super.setHesapTipi(value);
    } finally {
      _$_BankaListesiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setBakiye(String? value) {
    final _$actionInfo = _$_BankaListesiViewModelBaseActionController.startAction(name: '_BankaListesiViewModelBase.setBakiye');
    try {
      return super.setBakiye(value);
    } finally {
      _$_BankaListesiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
searchBar: ${searchBar},
errorText: ${errorText},
searchValue: ${searchValue},
bankaListesi: ${bankaListesi},
model: ${model},
groupedWithHesapTipiAdiList: ${groupedWithHesapTipiAdiList}
    ''';
  }
}
