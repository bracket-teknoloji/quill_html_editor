// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'olcum_kalem_sec_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$OlcumKalemSecViewModel on _OlcumKalemSecViewModelBase, Store {
  late final _$olcumGirisiListesiAtom = Atom(name: '_OlcumKalemSecViewModelBase.olcumGirisiListesi', context: context);

  @override
  ObservableList<OlcumBelgeModel>? get olcumGirisiListesi {
    _$olcumGirisiListesiAtom.reportRead();
    return super.olcumGirisiListesi;
  }

  @override
  set olcumGirisiListesi(ObservableList<OlcumBelgeModel>? value) {
    _$olcumGirisiListesiAtom.reportWrite(value, super.olcumGirisiListesi, () {
      super.olcumGirisiListesi = value;
    });
  }

  late final _$requestModelAtom = Atom(name: '_OlcumKalemSecViewModelBase.requestModel', context: context);

  @override
  OlcumBelgeModel? get requestModel {
    _$requestModelAtom.reportRead();
    return super.requestModel;
  }

  @override
  set requestModel(OlcumBelgeModel? value) {
    _$requestModelAtom.reportWrite(value, super.requestModel, () {
      super.requestModel = value;
    });
  }

  late final _$searchBarAtom = Atom(name: '_OlcumKalemSecViewModelBase.searchBar', context: context);

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

  late final _$dahaVarMiAtom = Atom(name: '_OlcumKalemSecViewModelBase.dahaVarMi', context: context);

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

  late final _$getDataAsyncAction = AsyncAction('_OlcumKalemSecViewModelBase.getData', context: context);

  @override
  Future<void> getData() {
    return _$getDataAsyncAction.run(() => super.getData());
  }

  late final _$_OlcumKalemSecViewModelBaseActionController = ActionController(
    name: '_OlcumKalemSecViewModelBase',
    context: context,
  );

  @override
  void setSearchBar() {
    final _$actionInfo = _$_OlcumKalemSecViewModelBaseActionController.startAction(
      name: '_OlcumKalemSecViewModelBase.setSearchBar',
    );
    try {
      return super.setSearchBar();
    } finally {
      _$_OlcumKalemSecViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDahaVarMi(bool value) {
    final _$actionInfo = _$_OlcumKalemSecViewModelBaseActionController.startAction(
      name: '_OlcumKalemSecViewModelBase.setDahaVarMi',
    );
    try {
      return super.setDahaVarMi(value);
    } finally {
      _$_OlcumKalemSecViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setRequestModel(OlcumBelgeModel model) {
    final _$actionInfo = _$_OlcumKalemSecViewModelBaseActionController.startAction(
      name: '_OlcumKalemSecViewModelBase.setRequestModel',
    );
    try {
      return super.setRequestModel(model);
    } finally {
      _$_OlcumKalemSecViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setOlcumBelgeModel(List<OlcumBelgeModel>? list) {
    final _$actionInfo = _$_OlcumKalemSecViewModelBaseActionController.startAction(
      name: '_OlcumKalemSecViewModelBase.setOlcumBelgeModel',
    );
    try {
      return super.setOlcumBelgeModel(list);
    } finally {
      _$_OlcumKalemSecViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addOlcumBelgeModel(List<OlcumBelgeModel> list) {
    final _$actionInfo = _$_OlcumKalemSecViewModelBaseActionController.startAction(
      name: '_OlcumKalemSecViewModelBase.addOlcumBelgeModel',
    );
    try {
      return super.addOlcumBelgeModel(list);
    } finally {
      _$_OlcumKalemSecViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSearchText(String? value) {
    final _$actionInfo = _$_OlcumKalemSecViewModelBaseActionController.startAction(
      name: '_OlcumKalemSecViewModelBase.setSearchText',
    );
    try {
      return super.setSearchText(value);
    } finally {
      _$_OlcumKalemSecViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void increaseSayfa() {
    final _$actionInfo = _$_OlcumKalemSecViewModelBaseActionController.startAction(
      name: '_OlcumKalemSecViewModelBase.increaseSayfa',
    );
    try {
      return super.increaseSayfa();
    } finally {
      _$_OlcumKalemSecViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetSayfa() {
    final _$actionInfo = _$_OlcumKalemSecViewModelBaseActionController.startAction(
      name: '_OlcumKalemSecViewModelBase.resetSayfa',
    );
    try {
      return super.resetSayfa();
    } finally {
      _$_OlcumKalemSecViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
olcumGirisiListesi: ${olcumGirisiListesi},
requestModel: ${requestModel},
searchBar: ${searchBar},
dahaVarMi: ${dahaVarMi}
    ''';
  }
}
