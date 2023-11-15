// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kasa_listesi_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$KasaListesiViewModel on _KasaListesiViewModelBase, Store {
  Computed<double>? _$getGelirComputed;

  @override
  double get getGelir => (_$getGelirComputed ??= Computed<double>(() => super.getGelir, name: '_KasaListesiViewModelBase.getGelir')).value;
  Computed<double>? _$getGiderComputed;

  @override
  double get getGider => (_$getGiderComputed ??= Computed<double>(() => super.getGider, name: '_KasaListesiViewModelBase.getGider')).value;
  Computed<double>? _$bakiyeComputed;

  @override
  double get bakiye => (_$bakiyeComputed ??= Computed<double>(() => super.bakiye, name: '_KasaListesiViewModelBase.bakiye')).value;
  Computed<ObservableList<KasaListesiModel>?>? _$getKasaListesiComputed;

  @override
  ObservableList<KasaListesiModel>? get getKasaListesi =>
      (_$getKasaListesiComputed ??= Computed<ObservableList<KasaListesiModel>?>(() => super.getKasaListesi, name: '_KasaListesiViewModelBase.getKasaListesi')).value;

  late final _$searchBarAtom = Atom(name: '_KasaListesiViewModelBase.searchBar', context: context);

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

  late final _$isScrollDownAtom = Atom(name: '_KasaListesiViewModelBase.isScrollDown', context: context);

  @override
  bool get isScrollDown {
    _$isScrollDownAtom.reportRead();
    return super.isScrollDown;
  }

  @override
  set isScrollDown(bool value) {
    _$isScrollDownAtom.reportWrite(value, super.isScrollDown, () {
      super.isScrollDown = value;
    });
  }

  late final _$filtreGroupValueAtom = Atom(name: '_KasaListesiViewModelBase.filtreGroupValue', context: context);

  @override
  String get filtreGroupValue {
    _$filtreGroupValueAtom.reportRead();
    return super.filtreGroupValue;
  }

  @override
  set filtreGroupValue(String value) {
    _$filtreGroupValueAtom.reportWrite(value, super.filtreGroupValue, () {
      super.filtreGroupValue = value;
    });
  }

  late final _$siralaAtom = Atom(name: '_KasaListesiViewModelBase.sirala', context: context);

  @override
  String get sirala {
    _$siralaAtom.reportRead();
    return super.sirala;
  }

  @override
  set sirala(String value) {
    _$siralaAtom.reportWrite(value, super.sirala, () {
      super.sirala = value;
    });
  }

  late final _$searchTextAtom = Atom(name: '_KasaListesiViewModelBase.searchText', context: context);

  @override
  String? get searchText {
    _$searchTextAtom.reportRead();
    return super.searchText;
  }

  @override
  set searchText(String? value) {
    _$searchTextAtom.reportWrite(value, super.searchText, () {
      super.searchText = value;
    });
  }

  late final _$kasaListesiAtom = Atom(name: '_KasaListesiViewModelBase.kasaListesi', context: context);

  @override
  ObservableList<KasaListesiModel>? get kasaListesi {
    _$kasaListesiAtom.reportRead();
    return super.kasaListesi;
  }

  @override
  set kasaListesi(ObservableList<KasaListesiModel>? value) {
    _$kasaListesiAtom.reportWrite(value, super.kasaListesi, () {
      super.kasaListesi = value;
    });
  }

  late final _$getDataAsyncAction = AsyncAction('_KasaListesiViewModelBase.getData', context: context);

  @override
  Future<void> getData() {
    return _$getDataAsyncAction.run(() => super.getData());
  }

  late final _$_KasaListesiViewModelBaseActionController = ActionController(name: '_KasaListesiViewModelBase', context: context);

  @override
  void setFiltreGroupValue(int? value) {
    final _$actionInfo = _$_KasaListesiViewModelBaseActionController.startAction(name: '_KasaListesiViewModelBase.setFiltreGroupValue');
    try {
      return super.setFiltreGroupValue(value);
    } finally {
      _$_KasaListesiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSirala(String value) {
    final _$actionInfo = _$_KasaListesiViewModelBaseActionController.startAction(name: '_KasaListesiViewModelBase.setSirala');
    try {
      return super.setSirala(value);
    } finally {
      _$_KasaListesiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSearchText(String? value) {
    final _$actionInfo = _$_KasaListesiViewModelBaseActionController.startAction(name: '_KasaListesiViewModelBase.setSearchText');
    try {
      return super.setSearchText(value);
    } finally {
      _$_KasaListesiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSearchBar() {
    final _$actionInfo = _$_KasaListesiViewModelBaseActionController.startAction(name: '_KasaListesiViewModelBase.setSearchBar');
    try {
      return super.setSearchBar();
    } finally {
      _$_KasaListesiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIsScrollDown(bool value) {
    final _$actionInfo = _$_KasaListesiViewModelBaseActionController.startAction(name: '_KasaListesiViewModelBase.setIsScrollDown');
    try {
      return super.setIsScrollDown(value);
    } finally {
      _$_KasaListesiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setKasaListesi(List<KasaListesiModel>? value) {
    final _$actionInfo = _$_KasaListesiViewModelBaseActionController.startAction(name: '_KasaListesiViewModelBase.setKasaListesi');
    try {
      return super.setKasaListesi(value);
    } finally {
      _$_KasaListesiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
searchBar: ${searchBar},
isScrollDown: ${isScrollDown},
filtreGroupValue: ${filtreGroupValue},
sirala: ${sirala},
searchText: ${searchText},
kasaListesi: ${kasaListesi},
getGelir: ${getGelir},
getGider: ${getGider},
bakiye: ${bakiye},
getKasaListesi: ${getKasaListesi}
    ''';
  }
}
