// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'depo_fark_raporu_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DepoFarkRaporuViewModel on _DepoFarkRaporuViewModelBase, Store {
  Computed<ObservableList<SayimListesiModel>?>? _$filteredSayimListesiComputed;

  @override
  ObservableList<SayimListesiModel>? get filteredSayimListesi =>
      (_$filteredSayimListesiComputed ??=
              Computed<ObservableList<SayimListesiModel>?>(
                () => super.filteredSayimListesi,
                name: '_DepoFarkRaporuViewModelBase.filteredSayimListesi',
              ))
          .value;
  Computed<double>? _$toplamDepoMiktariComputed;

  @override
  double get toplamDepoMiktari =>
      (_$toplamDepoMiktariComputed ??= Computed<double>(
        () => super.toplamDepoMiktari,
        name: '_DepoFarkRaporuViewModelBase.toplamDepoMiktari',
      )).value;
  Computed<double>? _$toplamSayimMiktariComputed;

  @override
  double get toplamSayimMiktari =>
      (_$toplamSayimMiktariComputed ??= Computed<double>(
        () => super.toplamSayimMiktari,
        name: '_DepoFarkRaporuViewModelBase.toplamSayimMiktari',
      )).value;
  Computed<double>? _$toplamFarkMiktariComputed;

  @override
  double get toplamFarkMiktari =>
      (_$toplamFarkMiktariComputed ??= Computed<double>(
        () => super.toplamFarkMiktari,
        name: '_DepoFarkRaporuViewModelBase.toplamFarkMiktari',
      )).value;

  late final _$sayimListesiAtom = Atom(
    name: '_DepoFarkRaporuViewModelBase.sayimListesi',
    context: context,
  );

  @override
  ObservableList<SayimListesiModel>? get sayimListesi {
    _$sayimListesiAtom.reportRead();
    return super.sayimListesi;
  }

  @override
  set sayimListesi(ObservableList<SayimListesiModel>? value) {
    _$sayimListesiAtom.reportWrite(value, super.sayimListesi, () {
      super.sayimListesi = value;
    });
  }

  late final _$searchBarAtom = Atom(
    name: '_DepoFarkRaporuViewModelBase.searchBar',
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
    name: '_DepoFarkRaporuViewModelBase.searchText',
    context: context,
  );

  @override
  String get searchText {
    _$searchTextAtom.reportRead();
    return super.searchText;
  }

  @override
  set searchText(String value) {
    _$searchTextAtom.reportWrite(value, super.searchText, () {
      super.searchText = value;
    });
  }

  late final _$filtreTuruAtom = Atom(
    name: '_DepoFarkRaporuViewModelBase.filtreTuru',
    context: context,
  );

  @override
  DepoFarkRaporuFiltreEnum get filtreTuru {
    _$filtreTuruAtom.reportRead();
    return super.filtreTuru;
  }

  @override
  set filtreTuru(DepoFarkRaporuFiltreEnum value) {
    _$filtreTuruAtom.reportWrite(value, super.filtreTuru, () {
      super.filtreTuru = value;
    });
  }

  late final _$requestModelAtom = Atom(
    name: '_DepoFarkRaporuViewModelBase.requestModel',
    context: context,
  );

  @override
  SayilanKalemlerRequestModel get requestModel {
    _$requestModelAtom.reportRead();
    return super.requestModel;
  }

  @override
  set requestModel(SayilanKalemlerRequestModel value) {
    _$requestModelAtom.reportWrite(value, super.requestModel, () {
      super.requestModel = value;
    });
  }

  late final _$getDataAsyncAction = AsyncAction(
    '_DepoFarkRaporuViewModelBase.getData',
    context: context,
  );

  @override
  Future<void> getData() {
    return _$getDataAsyncAction.run(() => super.getData());
  }

  late final _$_DepoFarkRaporuViewModelBaseActionController = ActionController(
    name: '_DepoFarkRaporuViewModelBase',
    context: context,
  );

  @override
  void setSearchBar(bool value) {
    final _$actionInfo = _$_DepoFarkRaporuViewModelBaseActionController
        .startAction(name: '_DepoFarkRaporuViewModelBase.setSearchBar');
    try {
      return super.setSearchBar(value);
    } finally {
      _$_DepoFarkRaporuViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setFiltreTuru(DepoFarkRaporuFiltreEnum value) {
    final _$actionInfo = _$_DepoFarkRaporuViewModelBaseActionController
        .startAction(name: '_DepoFarkRaporuViewModelBase.setFiltreTuru');
    try {
      return super.setFiltreTuru(value);
    } finally {
      _$_DepoFarkRaporuViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSearchText(String? value) {
    final _$actionInfo = _$_DepoFarkRaporuViewModelBaseActionController
        .startAction(name: '_DepoFarkRaporuViewModelBase.setSearchText');
    try {
      return super.setSearchText(value);
    } finally {
      _$_DepoFarkRaporuViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSeriBazindaMi(bool value) {
    final _$actionInfo = _$_DepoFarkRaporuViewModelBaseActionController
        .startAction(name: '_DepoFarkRaporuViewModelBase.setSeriBazindaMi');
    try {
      return super.setSeriBazindaMi(value);
    } finally {
      _$_DepoFarkRaporuViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setRequestModel(SayilanKalemlerRequestModel model) {
    final _$actionInfo = _$_DepoFarkRaporuViewModelBaseActionController
        .startAction(name: '_DepoFarkRaporuViewModelBase.setRequestModel');
    try {
      return super.setRequestModel(model);
    } finally {
      _$_DepoFarkRaporuViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSayimListesi(List<SayimListesiModel>? list) {
    final _$actionInfo = _$_DepoFarkRaporuViewModelBaseActionController
        .startAction(name: '_DepoFarkRaporuViewModelBase.setSayimListesi');
    try {
      return super.setSayimListesi(list);
    } finally {
      _$_DepoFarkRaporuViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
sayimListesi: ${sayimListesi},
searchBar: ${searchBar},
searchText: ${searchText},
filtreTuru: ${filtreTuru},
requestModel: ${requestModel},
filteredSayimListesi: ${filteredSayimListesi},
toplamDepoMiktari: ${toplamDepoMiktari},
toplamSayimMiktari: ${toplamSayimMiktari},
toplamFarkMiktari: ${toplamFarkMiktari}
    ''';
  }
}
