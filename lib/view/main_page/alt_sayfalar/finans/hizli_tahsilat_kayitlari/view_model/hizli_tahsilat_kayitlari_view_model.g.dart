// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hizli_tahsilat_kayitlari_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HizliTahsilatKayitlariViewModel on _HizliTahsilatKayitlariViewModelBase, Store {
  Computed<ObservableList<BankaHareketleriModel>?>? _$filteredObservableListComputed;

  @override
  ObservableList<BankaHareketleriModel>? get filteredObservableList =>
      (_$filteredObservableListComputed ??= Computed<ObservableList<BankaHareketleriModel>?>(
        () => super.filteredObservableList,
        name: '_HizliTahsilatKayitlariViewModelBase.filteredObservableList',
      )).value;

  late final _$observableListAtom = Atom(
    name: '_HizliTahsilatKayitlariViewModelBase.observableList',
    context: context,
  );

  @override
  ObservableList<BankaHareketleriModel>? get observableList {
    _$observableListAtom.reportRead();
    return super.observableList;
  }

  @override
  set observableList(ObservableList<BankaHareketleriModel>? value) {
    _$observableListAtom.reportWrite(value, super.observableList, () {
      super.observableList = value;
    });
  }

  late final _$searchTextAtom = Atom(
    name: '_HizliTahsilatKayitlariViewModelBase.searchText',
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

  late final _$isSearchBarOpenAtom = Atom(
    name: '_HizliTahsilatKayitlariViewModelBase.isSearchBarOpen',
    context: context,
  );

  @override
  bool get isSearchBarOpen {
    _$isSearchBarOpenAtom.reportRead();
    return super.isSearchBarOpen;
  }

  @override
  set isSearchBarOpen(bool value) {
    _$isSearchBarOpenAtom.reportWrite(value, super.isSearchBarOpen, () {
      super.isSearchBarOpen = value;
    });
  }

  late final _$requestModelAtom = Atom(
    name: '_HizliTahsilatKayitlariViewModelBase.requestModel',
    context: context,
  );

  @override
  HizliTahsilatKayitlariRequestModel get requestModel {
    _$requestModelAtom.reportRead();
    return super.requestModel;
  }

  @override
  set requestModel(HizliTahsilatKayitlariRequestModel value) {
    _$requestModelAtom.reportWrite(value, super.requestModel, () {
      super.requestModel = value;
    });
  }

  late final _$resetListAsyncAction = AsyncAction(
    '_HizliTahsilatKayitlariViewModelBase.resetList',
    context: context,
  );

  @override
  Future<void> resetList() {
    return _$resetListAsyncAction.run(() => super.resetList());
  }

  late final _$deleteHizliTahsilatAsyncAction = AsyncAction(
    '_HizliTahsilatKayitlariViewModelBase.deleteHizliTahsilat',
    context: context,
  );

  @override
  Future<GenericResponseModel<BankaHareketleriModel>> deleteHizliTahsilat(
    int id,
  ) {
    return _$deleteHizliTahsilatAsyncAction.run(
      () => super.deleteHizliTahsilat(id),
    );
  }

  late final _$_HizliTahsilatKayitlariViewModelBaseActionController = ActionController(
    name: '_HizliTahsilatKayitlariViewModelBase',
    context: context,
  );

  @override
  void setObservableList(List<BankaHareketleriModel>? list) {
    final _$actionInfo = _$_HizliTahsilatKayitlariViewModelBaseActionController.startAction(
      name: '_HizliTahsilatKayitlariViewModelBase.setObservableList',
    );
    try {
      return super.setObservableList(list);
    } finally {
      _$_HizliTahsilatKayitlariViewModelBaseActionController.endAction(
        _$actionInfo,
      );
    }
  }

  @override
  void changeSearchBarStatus() {
    final _$actionInfo = _$_HizliTahsilatKayitlariViewModelBaseActionController.startAction(
      name: '_HizliTahsilatKayitlariViewModelBase.changeSearchBarStatus',
    );
    try {
      return super.changeSearchBarStatus();
    } finally {
      _$_HizliTahsilatKayitlariViewModelBaseActionController.endAction(
        _$actionInfo,
      );
    }
  }

  @override
  void setSearchText(String? value) {
    final _$actionInfo = _$_HizliTahsilatKayitlariViewModelBaseActionController.startAction(
      name: '_HizliTahsilatKayitlariViewModelBase.setSearchText',
    );
    try {
      return super.setSearchText(value);
    } finally {
      _$_HizliTahsilatKayitlariViewModelBaseActionController.endAction(
        _$actionInfo,
      );
    }
  }

  @override
  void setBaslangicTarihi(String value) {
    final _$actionInfo = _$_HizliTahsilatKayitlariViewModelBaseActionController.startAction(
      name: '_HizliTahsilatKayitlariViewModelBase.setBaslangicTarihi',
    );
    try {
      return super.setBaslangicTarihi(value);
    } finally {
      _$_HizliTahsilatKayitlariViewModelBaseActionController.endAction(
        _$actionInfo,
      );
    }
  }

  @override
  void setBitisTarihi(String value) {
    final _$actionInfo = _$_HizliTahsilatKayitlariViewModelBaseActionController.startAction(
      name: '_HizliTahsilatKayitlariViewModelBase.setBitisTarihi',
    );
    try {
      return super.setBitisTarihi(value);
    } finally {
      _$_HizliTahsilatKayitlariViewModelBaseActionController.endAction(
        _$actionInfo,
      );
    }
  }

  @override
  String toString() {
    return '''
observableList: ${observableList},
searchText: ${searchText},
isSearchBarOpen: ${isSearchBarOpen},
requestModel: ${requestModel},
filteredObservableList: ${filteredObservableList}
    ''';
  }
}
