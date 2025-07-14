// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tahsilat_odeme_kayitlari_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TahsilatOdemeKayitlariViewModel on _TahsilatOdemeKayitlariViewModelBase, Store {
  Computed<double>? _$toplamTahsilatComputed;

  @override
  double get toplamTahsilat => (_$toplamTahsilatComputed ??= Computed<double>(
    () => super.toplamTahsilat,
    name: '_TahsilatOdemeKayitlariViewModelBase.toplamTahsilat',
  )).value;
  Computed<double>? _$toplamOdemeComputed;

  @override
  double get toplamOdeme => (_$toplamOdemeComputed ??= Computed<double>(
    () => super.toplamOdeme,
    name: '_TahsilatOdemeKayitlariViewModelBase.toplamOdeme',
  )).value;
  Computed<ObservableList<CariHareketleriModel>?>? _$getCariHareketleriListesiComputed;

  @override
  ObservableList<CariHareketleriModel>? get getCariHareketleriListesi =>
      (_$getCariHareketleriListesiComputed ??= Computed<ObservableList<CariHareketleriModel>?>(
        () => super.getCariHareketleriListesi,
        name: '_TahsilatOdemeKayitlariViewModelBase.getCariHareketleriListesi',
      )).value;
  Computed<bool>? _$getAnyFilterComputed;

  @override
  bool get getAnyFilter => (_$getAnyFilterComputed ??= Computed<bool>(
    () => super.getAnyFilter,
    name: '_TahsilatOdemeKayitlariViewModelBase.getAnyFilter',
  )).value;

  late final _$cariHareketleriRequestModelAtom = Atom(
    name: '_TahsilatOdemeKayitlariViewModelBase.cariHareketleriRequestModel',
    context: context,
  );

  @override
  CariHareketleriRequestModel get cariHareketleriRequestModel {
    _$cariHareketleriRequestModelAtom.reportRead();
    return super.cariHareketleriRequestModel;
  }

  @override
  set cariHareketleriRequestModel(CariHareketleriRequestModel value) {
    _$cariHareketleriRequestModelAtom.reportWrite(
      value,
      super.cariHareketleriRequestModel,
      () {
        super.cariHareketleriRequestModel = value;
      },
    );
  }

  late final _$hesapTipiGroupValueAtom = Atom(
    name: '_TahsilatOdemeKayitlariViewModelBase.hesapTipiGroupValue',
    context: context,
  );

  @override
  String? get hesapTipiGroupValue {
    _$hesapTipiGroupValueAtom.reportRead();
    return super.hesapTipiGroupValue;
  }

  @override
  set hesapTipiGroupValue(String? value) {
    _$hesapTipiGroupValueAtom.reportWrite(value, super.hesapTipiGroupValue, () {
      super.hesapTipiGroupValue = value;
    });
  }

  late final _$isScrollDownAtom = Atom(
    name: '_TahsilatOdemeKayitlariViewModelBase.isScrollDown',
    context: context,
  );

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

  late final _$cariHareketleriListesiAtom = Atom(
    name: '_TahsilatOdemeKayitlariViewModelBase.cariHareketleriListesi',
    context: context,
  );

  @override
  ObservableList<CariHareketleriModel>? get cariHareketleriListesi {
    _$cariHareketleriListesiAtom.reportRead();
    return super.cariHareketleriListesi;
  }

  @override
  set cariHareketleriListesi(ObservableList<CariHareketleriModel>? value) {
    _$cariHareketleriListesiAtom.reportWrite(
      value,
      super.cariHareketleriListesi,
      () {
        super.cariHareketleriListesi = value;
      },
    );
  }

  late final _$searchBarAtom = Atom(
    name: '_TahsilatOdemeKayitlariViewModelBase.searchBar',
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

  late final _$searchTextAtom = Atom(
    name: '_TahsilatOdemeKayitlariViewModelBase.searchText',
    context: context,
  );

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

  late final _$resetPageAsyncAction = AsyncAction(
    '_TahsilatOdemeKayitlariViewModelBase.resetPage',
    context: context,
  );

  @override
  Future<void> resetPage() {
    return _$resetPageAsyncAction.run(() => super.resetPage());
  }

  late final _$getDataAsyncAction = AsyncAction(
    '_TahsilatOdemeKayitlariViewModelBase.getData',
    context: context,
  );

  @override
  Future<void> getData() {
    return _$getDataAsyncAction.run(() => super.getData());
  }

  late final _$_TahsilatOdemeKayitlariViewModelBaseActionController = ActionController(
    name: '_TahsilatOdemeKayitlariViewModelBase',
    context: context,
  );

  @override
  void setIsScrollDown(bool value) {
    final _$actionInfo = _$_TahsilatOdemeKayitlariViewModelBaseActionController.startAction(
      name: '_TahsilatOdemeKayitlariViewModelBase.setIsScrollDown',
    );
    try {
      return super.setIsScrollDown(value);
    } finally {
      _$_TahsilatOdemeKayitlariViewModelBaseActionController.endAction(
        _$actionInfo,
      );
    }
  }

  @override
  void changeSearchBar() {
    final _$actionInfo = _$_TahsilatOdemeKayitlariViewModelBaseActionController.startAction(
      name: '_TahsilatOdemeKayitlariViewModelBase.changeSearchBar',
    );
    try {
      return super.changeSearchBar();
    } finally {
      _$_TahsilatOdemeKayitlariViewModelBaseActionController.endAction(
        _$actionInfo,
      );
    }
  }

  @override
  void setSearchText(String? value) {
    final _$actionInfo = _$_TahsilatOdemeKayitlariViewModelBaseActionController.startAction(
      name: '_TahsilatOdemeKayitlariViewModelBase.setSearchText',
    );
    try {
      return super.setSearchText(value);
    } finally {
      _$_TahsilatOdemeKayitlariViewModelBaseActionController.endAction(
        _$actionInfo,
      );
    }
  }

  @override
  void setBaslamaTarihi(String? value) {
    final _$actionInfo = _$_TahsilatOdemeKayitlariViewModelBaseActionController.startAction(
      name: '_TahsilatOdemeKayitlariViewModelBase.setBaslamaTarihi',
    );
    try {
      return super.setBaslamaTarihi(value);
    } finally {
      _$_TahsilatOdemeKayitlariViewModelBaseActionController.endAction(
        _$actionInfo,
      );
    }
  }

  @override
  void setBitisTarihi(String? value) {
    final _$actionInfo = _$_TahsilatOdemeKayitlariViewModelBaseActionController.startAction(
      name: '_TahsilatOdemeKayitlariViewModelBase.setBitisTarihi',
    );
    try {
      return super.setBitisTarihi(value);
    } finally {
      _$_TahsilatOdemeKayitlariViewModelBaseActionController.endAction(
        _$actionInfo,
      );
    }
  }

  @override
  void setIslemTuru(int? value) {
    final _$actionInfo = _$_TahsilatOdemeKayitlariViewModelBaseActionController.startAction(
      name: '_TahsilatOdemeKayitlariViewModelBase.setIslemTuru',
    );
    try {
      return super.setIslemTuru(value);
    } finally {
      _$_TahsilatOdemeKayitlariViewModelBaseActionController.endAction(
        _$actionInfo,
      );
    }
  }

  @override
  void setCariKodu(String? value) {
    final _$actionInfo = _$_TahsilatOdemeKayitlariViewModelBaseActionController.startAction(
      name: '_TahsilatOdemeKayitlariViewModelBase.setCariKodu',
    );
    try {
      return super.setCariKodu(value);
    } finally {
      _$_TahsilatOdemeKayitlariViewModelBaseActionController.endAction(
        _$actionInfo,
      );
    }
  }

  @override
  void setHareketTuru(List<String>? value) {
    final _$actionInfo = _$_TahsilatOdemeKayitlariViewModelBaseActionController.startAction(
      name: '_TahsilatOdemeKayitlariViewModelBase.setHareketTuru',
    );
    try {
      return super.setHareketTuru(value);
    } finally {
      _$_TahsilatOdemeKayitlariViewModelBaseActionController.endAction(
        _$actionInfo,
      );
    }
  }

  @override
  void setPlasiyerKodu(List<String>? value) {
    final _$actionInfo = _$_TahsilatOdemeKayitlariViewModelBaseActionController.startAction(
      name: '_TahsilatOdemeKayitlariViewModelBase.setPlasiyerKodu',
    );
    try {
      return super.setPlasiyerKodu(value);
    } finally {
      _$_TahsilatOdemeKayitlariViewModelBaseActionController.endAction(
        _$actionInfo,
      );
    }
  }

  @override
  void clearFilters() {
    final _$actionInfo = _$_TahsilatOdemeKayitlariViewModelBaseActionController.startAction(
      name: '_TahsilatOdemeKayitlariViewModelBase.clearFilters',
    );
    try {
      return super.clearFilters();
    } finally {
      _$_TahsilatOdemeKayitlariViewModelBaseActionController.endAction(
        _$actionInfo,
      );
    }
  }

  @override
  void setcariHareketleriListesi(List<CariHareketleriModel>? value) {
    final _$actionInfo = _$_TahsilatOdemeKayitlariViewModelBaseActionController.startAction(
      name: '_TahsilatOdemeKayitlariViewModelBase.setcariHareketleriListesi',
    );
    try {
      return super.setcariHareketleriListesi(value);
    } finally {
      _$_TahsilatOdemeKayitlariViewModelBaseActionController.endAction(
        _$actionInfo,
      );
    }
  }

  @override
  String toString() {
    return '''
cariHareketleriRequestModel: ${cariHareketleriRequestModel},
hesapTipiGroupValue: ${hesapTipiGroupValue},
isScrollDown: ${isScrollDown},
cariHareketleriListesi: ${cariHareketleriListesi},
searchBar: ${searchBar},
searchText: ${searchText},
toplamTahsilat: ${toplamTahsilat},
toplamOdeme: ${toplamOdeme},
getCariHareketleriListesi: ${getCariHareketleriListesi},
getAnyFilter: ${getAnyFilter}
    ''';
  }
}
