// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'uretim_sonu_kaydi_edit_kalemler_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UretimSonuKaydiEditKalemlerViewModel on _UretimSonuKaydiEditKalemlerViewModelBase, Store {
  Computed<double?>? _$toplamMiktarComputed;

  @override
  double? get toplamMiktar => (_$toplamMiktarComputed ??= Computed<double?>(
    () => super.toplamMiktar,
    name: '_UretimSonuKaydiEditKalemlerViewModelBase.toplamMiktar',
  )).value;
  Computed<double?>? _$toplamMaliyetTutariComputed;

  @override
  double? get toplamMaliyetTutari => (_$toplamMaliyetTutariComputed ??= Computed<double?>(
    () => super.toplamMaliyetTutari,
    name: '_UretimSonuKaydiEditKalemlerViewModelBase.toplamMaliyetTutari',
  )).value;

  late final _$observableListAtom = Atom(
    name: '_UretimSonuKaydiEditKalemlerViewModelBase.observableList',
    context: context,
  );

  @override
  ObservableList<KalemModel>? get observableList {
    _$observableListAtom.reportRead();
    return super.observableList;
  }

  @override
  set observableList(ObservableList<KalemModel>? value) {
    _$observableListAtom.reportWrite(value, super.observableList, () {
      super.observableList = value;
    });
  }

  late final _$isSearchBarOpenAtom = Atom(
    name: '_UretimSonuKaydiEditKalemlerViewModelBase.isSearchBarOpen',
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

  late final _$searchTextAtom = Atom(
    name: '_UretimSonuKaydiEditKalemlerViewModelBase.searchText',
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

  late final _$getDataAsyncAction = AsyncAction(
    '_UretimSonuKaydiEditKalemlerViewModelBase.getData',
    context: context,
  );

  @override
  Future<void> getData() {
    return _$getDataAsyncAction.run(() => super.getData());
  }

  late final _$_UretimSonuKaydiEditKalemlerViewModelBaseActionController = ActionController(
    name: '_UretimSonuKaydiEditKalemlerViewModelBase',
    context: context,
  );

  @override
  void changeSearchBarStatus() {
    final _$actionInfo = _$_UretimSonuKaydiEditKalemlerViewModelBaseActionController.startAction(
      name: '_UretimSonuKaydiEditKalemlerViewModelBase.changeSearchBarStatus',
    );
    try {
      return super.changeSearchBarStatus();
    } finally {
      _$_UretimSonuKaydiEditKalemlerViewModelBaseActionController.endAction(
        _$actionInfo,
      );
    }
  }

  @override
  void setObservableList(List<KalemModel>? list) {
    final _$actionInfo = _$_UretimSonuKaydiEditKalemlerViewModelBaseActionController.startAction(
      name: '_UretimSonuKaydiEditKalemlerViewModelBase.setObservableList',
    );
    try {
      return super.setObservableList(list);
    } finally {
      _$_UretimSonuKaydiEditKalemlerViewModelBaseActionController.endAction(
        _$actionInfo,
      );
    }
  }

  @override
  void addItem(KalemModel item) {
    final _$actionInfo = _$_UretimSonuKaydiEditKalemlerViewModelBaseActionController.startAction(
      name: '_UretimSonuKaydiEditKalemlerViewModelBase.addItem',
    );
    try {
      return super.addItem(item);
    } finally {
      _$_UretimSonuKaydiEditKalemlerViewModelBaseActionController.endAction(
        _$actionInfo,
      );
    }
  }

  @override
  void setSearchText(String? value) {
    final _$actionInfo = _$_UretimSonuKaydiEditKalemlerViewModelBaseActionController.startAction(
      name: '_UretimSonuKaydiEditKalemlerViewModelBase.setSearchText',
    );
    try {
      return super.setSearchText(value);
    } finally {
      _$_UretimSonuKaydiEditKalemlerViewModelBaseActionController.endAction(
        _$actionInfo,
      );
    }
  }

  @override
  String toString() {
    return '''
observableList: ${observableList},
isSearchBarOpen: ${isSearchBarOpen},
searchText: ${searchText},
toplamMiktar: ${toplamMiktar},
toplamMaliyetTutari: ${toplamMaliyetTutari}
    ''';
  }
}
