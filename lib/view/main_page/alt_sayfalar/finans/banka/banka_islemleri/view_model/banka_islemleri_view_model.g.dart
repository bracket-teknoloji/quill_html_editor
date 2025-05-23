// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banka_islemleri_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BankaIslemleriViewModel on _BankaIslemleriViewModelBase, Store {
  Computed<double>? _$gelenTutarComputed;

  @override
  double get gelenTutar => (_$gelenTutarComputed ??= Computed<double>(
    () => super.gelenTutar,
    name: '_BankaIslemleriViewModelBase.gelenTutar',
  )).value;
  Computed<double>? _$gidenTutarComputed;

  @override
  double get gidenTutar => (_$gidenTutarComputed ??= Computed<double>(
    () => super.gidenTutar,
    name: '_BankaIslemleriViewModelBase.gidenTutar',
  )).value;
  Computed<ObservableList<BankaHareketleriModel>?>? _$getBankaIslemleriListesiComputed;

  @override
  ObservableList<BankaHareketleriModel>? get getBankaIslemleriListesi =>
      (_$getBankaIslemleriListesiComputed ??= Computed<ObservableList<BankaHareketleriModel>?>(
        () => super.getBankaIslemleriListesi,
        name: '_BankaIslemleriViewModelBase.getBankaIslemleriListesi',
      )).value;

  late final _$bankaIslemleriRequestModelAtom = Atom(
    name: '_BankaIslemleriViewModelBase.bankaIslemleriRequestModel',
    context: context,
  );

  @override
  BankaIslemleriRequestModel get bankaIslemleriRequestModel {
    _$bankaIslemleriRequestModelAtom.reportRead();
    return super.bankaIslemleriRequestModel;
  }

  @override
  set bankaIslemleriRequestModel(BankaIslemleriRequestModel value) {
    _$bankaIslemleriRequestModelAtom.reportWrite(value, super.bankaIslemleriRequestModel, () {
      super.bankaIslemleriRequestModel = value;
    });
  }

  late final _$isScrollDownAtom = Atom(name: '_BankaIslemleriViewModelBase.isScrollDown', context: context);

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

  late final _$searchBarAtom = Atom(name: '_BankaIslemleriViewModelBase.searchBar', context: context);

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

  late final _$bankaIslemleriListesiAtom = Atom(
    name: '_BankaIslemleriViewModelBase.bankaIslemleriListesi',
    context: context,
  );

  @override
  ObservableList<BankaHareketleriModel>? get bankaIslemleriListesi {
    _$bankaIslemleriListesiAtom.reportRead();
    return super.bankaIslemleriListesi;
  }

  @override
  set bankaIslemleriListesi(ObservableList<BankaHareketleriModel>? value) {
    _$bankaIslemleriListesiAtom.reportWrite(value, super.bankaIslemleriListesi, () {
      super.bankaIslemleriListesi = value;
    });
  }

  late final _$searchTextAtom = Atom(name: '_BankaIslemleriViewModelBase.searchText', context: context);

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

  late final _$resetPageAsyncAction = AsyncAction('_BankaIslemleriViewModelBase.resetPage', context: context);

  @override
  Future<void> resetPage() {
    return _$resetPageAsyncAction.run(() => super.resetPage());
  }

  late final _$getDataAsyncAction = AsyncAction('_BankaIslemleriViewModelBase.getData', context: context);

  @override
  Future<void> getData() {
    return _$getDataAsyncAction.run(() => super.getData());
  }

  late final _$_BankaIslemleriViewModelBaseActionController = ActionController(
    name: '_BankaIslemleriViewModelBase',
    context: context,
  );

  @override
  void setIsScrollDown(bool value) {
    final _$actionInfo = _$_BankaIslemleriViewModelBaseActionController.startAction(
      name: '_BankaIslemleriViewModelBase.setIsScrollDown',
    );
    try {
      return super.setIsScrollDown(value);
    } finally {
      _$_BankaIslemleriViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeSearchBar() {
    final _$actionInfo = _$_BankaIslemleriViewModelBaseActionController.startAction(
      name: '_BankaIslemleriViewModelBase.changeSearchBar',
    );
    try {
      return super.changeSearchBar();
    } finally {
      _$_BankaIslemleriViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSearchText(String? value) {
    final _$actionInfo = _$_BankaIslemleriViewModelBaseActionController.startAction(
      name: '_BankaIslemleriViewModelBase.setSearchText',
    );
    try {
      return super.setSearchText(value);
    } finally {
      _$_BankaIslemleriViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setBaslamaTarihi(String? value) {
    final _$actionInfo = _$_BankaIslemleriViewModelBaseActionController.startAction(
      name: '_BankaIslemleriViewModelBase.setBaslamaTarihi',
    );
    try {
      return super.setBaslamaTarihi(value);
    } finally {
      _$_BankaIslemleriViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setBitisTarihi(String? value) {
    final _$actionInfo = _$_BankaIslemleriViewModelBaseActionController.startAction(
      name: '_BankaIslemleriViewModelBase.setBitisTarihi',
    );
    try {
      return super.setBitisTarihi(value);
    } finally {
      _$_BankaIslemleriViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setBankaIslemleriListesi(List<BankaHareketleriModel>? value) {
    final _$actionInfo = _$_BankaIslemleriViewModelBaseActionController.startAction(
      name: '_BankaIslemleriViewModelBase.setBankaIslemleriListesi',
    );
    try {
      return super.setBankaIslemleriListesi(value);
    } finally {
      _$_BankaIslemleriViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addBankaIslemleriListesi(List<BankaHareketleriModel>? value) {
    final _$actionInfo = _$_BankaIslemleriViewModelBaseActionController.startAction(
      name: '_BankaIslemleriViewModelBase.addBankaIslemleriListesi',
    );
    try {
      return super.addBankaIslemleriListesi(value);
    } finally {
      _$_BankaIslemleriViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearFilters() {
    final _$actionInfo = _$_BankaIslemleriViewModelBaseActionController.startAction(
      name: '_BankaIslemleriViewModelBase.clearFilters',
    );
    try {
      return super.clearFilters();
    } finally {
      _$_BankaIslemleriViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setHesapKodu(String? value) {
    final _$actionInfo = _$_BankaIslemleriViewModelBaseActionController.startAction(
      name: '_BankaIslemleriViewModelBase.setHesapKodu',
    );
    try {
      return super.setHesapKodu(value);
    } finally {
      _$_BankaIslemleriViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setHesapTipi(List<int>? value) {
    final _$actionInfo = _$_BankaIslemleriViewModelBaseActionController.startAction(
      name: '_BankaIslemleriViewModelBase.setHesapTipi',
    );
    try {
      return super.setHesapTipi(value);
    } finally {
      _$_BankaIslemleriViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
bankaIslemleriRequestModel: ${bankaIslemleriRequestModel},
isScrollDown: ${isScrollDown},
searchBar: ${searchBar},
bankaIslemleriListesi: ${bankaIslemleriListesi},
searchText: ${searchText},
gelenTutar: ${gelenTutar},
gidenTutar: ${gidenTutar},
getBankaIslemleriListesi: ${getBankaIslemleriListesi}
    ''';
  }
}
