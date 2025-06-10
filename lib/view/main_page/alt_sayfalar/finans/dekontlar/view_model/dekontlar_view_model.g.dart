// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dekontlar_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DekontlarViewModel on _DekontlarViewModelBase, Store {
  late final _$searchBarAtom = Atom(
    name: '_DekontlarViewModelBase.searchBar',
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

  late final _$dahaVarMiAtom = Atom(
    name: '_DekontlarViewModelBase.dahaVarMi',
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

  late final _$isScrolledDownAtom = Atom(
    name: '_DekontlarViewModelBase.isScrolledDown',
    context: context,
  );

  @override
  bool get isScrolledDown {
    _$isScrolledDownAtom.reportRead();
    return super.isScrolledDown;
  }

  @override
  set isScrolledDown(bool value) {
    _$isScrolledDownAtom.reportWrite(value, super.isScrolledDown, () {
      super.isScrolledDown = value;
    });
  }

  late final _$dekontRequestModelAtom = Atom(
    name: '_DekontlarViewModelBase.dekontRequestModel',
    context: context,
  );

  @override
  DekontRequestModel get dekontRequestModel {
    _$dekontRequestModelAtom.reportRead();
    return super.dekontRequestModel;
  }

  @override
  set dekontRequestModel(DekontRequestModel value) {
    _$dekontRequestModelAtom.reportWrite(value, super.dekontRequestModel, () {
      super.dekontRequestModel = value;
    });
  }

  late final _$dekontListesiAtom = Atom(
    name: '_DekontlarViewModelBase.dekontListesi',
    context: context,
  );

  @override
  ObservableList<DekontListesiModel>? get dekontListesi {
    _$dekontListesiAtom.reportRead();
    return super.dekontListesi;
  }

  @override
  set dekontListesi(ObservableList<DekontListesiModel>? value) {
    _$dekontListesiAtom.reportWrite(value, super.dekontListesi, () {
      super.dekontListesi = value;
    });
  }

  late final _$resetPageAsyncAction = AsyncAction(
    '_DekontlarViewModelBase.resetPage',
    context: context,
  );

  @override
  Future<void> resetPage() {
    return _$resetPageAsyncAction.run(() => super.resetPage());
  }

  late final _$getDataAsyncAction = AsyncAction(
    '_DekontlarViewModelBase.getData',
    context: context,
  );

  @override
  Future<void> getData() {
    return _$getDataAsyncAction.run(() => super.getData());
  }

  late final _$_DekontlarViewModelBaseActionController = ActionController(
    name: '_DekontlarViewModelBase',
    context: context,
  );

  @override
  void setIsScrolledDown(bool value) {
    final _$actionInfo = _$_DekontlarViewModelBaseActionController.startAction(
      name: '_DekontlarViewModelBase.setIsScrolledDown',
    );
    try {
      return super.setIsScrolledDown(value);
    } finally {
      _$_DekontlarViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDahaVarMi(bool value) {
    final _$actionInfo = _$_DekontlarViewModelBaseActionController.startAction(
      name: '_DekontlarViewModelBase.setDahaVarMi',
    );
    try {
      return super.setDahaVarMi(value);
    } finally {
      _$_DekontlarViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void increaseSayfa() {
    final _$actionInfo = _$_DekontlarViewModelBaseActionController.startAction(
      name: '_DekontlarViewModelBase.increaseSayfa',
    );
    try {
      return super.increaseSayfa();
    } finally {
      _$_DekontlarViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetSayfa() {
    final _$actionInfo = _$_DekontlarViewModelBaseActionController.startAction(
      name: '_DekontlarViewModelBase.resetSayfa',
    );
    try {
      return super.resetSayfa();
    } finally {
      _$_DekontlarViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDekontListesi(List<DekontListesiModel>? value) {
    final _$actionInfo = _$_DekontlarViewModelBaseActionController.startAction(
      name: '_DekontlarViewModelBase.setDekontListesi',
    );
    try {
      return super.setDekontListesi(value);
    } finally {
      _$_DekontlarViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addDekontListesi(List<DekontListesiModel>? value) {
    final _$actionInfo = _$_DekontlarViewModelBaseActionController.startAction(
      name: '_DekontlarViewModelBase.addDekontListesi',
    );
    try {
      return super.addDekontListesi(value);
    } finally {
      _$_DekontlarViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearDekontListesi() {
    final _$actionInfo = _$_DekontlarViewModelBaseActionController.startAction(
      name: '_DekontlarViewModelBase.clearDekontListesi',
    );
    try {
      return super.clearDekontListesi();
    } finally {
      _$_DekontlarViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
searchBar: ${searchBar},
dahaVarMi: ${dahaVarMi},
isScrolledDown: ${isScrolledDown},
dekontRequestModel: ${dekontRequestModel},
dekontListesi: ${dekontListesi}
    ''';
  }
}
