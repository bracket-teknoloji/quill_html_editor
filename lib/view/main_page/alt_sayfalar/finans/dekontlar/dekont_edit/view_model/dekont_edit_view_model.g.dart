// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dekont_edit_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DekontEditViewModel on _DekontEditViewModelBase, Store {
  late final _$selectedTabAtom =
      Atom(name: '_DekontEditViewModelBase.selectedTab', context: context);

  @override
  int get selectedTab {
    _$selectedTabAtom.reportRead();
    return super.selectedTab;
  }

  @override
  set selectedTab(int value) {
    _$selectedTabAtom.reportWrite(value, super.selectedTab, () {
      super.selectedTab = value;
    });
  }

  late final _$kalemSayisiAtom =
      Atom(name: '_DekontEditViewModelBase.kalemSayisi', context: context);

  @override
  int get kalemSayisi {
    _$kalemSayisiAtom.reportRead();
    return super.kalemSayisi;
  }

  @override
  set kalemSayisi(int value) {
    _$kalemSayisiAtom.reportWrite(value, super.kalemSayisi, () {
      super.kalemSayisi = value;
    });
  }

  late final _$islemTamamlandiAtom =
      Atom(name: '_DekontEditViewModelBase.islemTamamlandi', context: context);

  @override
  bool get islemTamamlandi {
    _$islemTamamlandiAtom.reportRead();
    return super.islemTamamlandi;
  }

  @override
  set islemTamamlandi(bool value) {
    _$islemTamamlandiAtom.reportWrite(value, super.islemTamamlandi, () {
      super.islemTamamlandi = value;
    });
  }

  late final _$postDataAsyncAction =
      AsyncAction('_DekontEditViewModelBase.postData', context: context);

  @override
  Future<GenericResponseModel<DekontIslemlerModel>> postData() {
    return _$postDataAsyncAction.run(() => super.postData());
  }

  late final _$getDataAsyncAction =
      AsyncAction('_DekontEditViewModelBase.getData', context: context);

  @override
  Future<void> getData(DekontListesiModel model) {
    return _$getDataAsyncAction.run(() => super.getData(model));
  }

  late final _$_DekontEditViewModelBaseActionController =
      ActionController(name: '_DekontEditViewModelBase', context: context);

  @override
  void setIslemTamamlandi(bool value) {
    final _$actionInfo = _$_DekontEditViewModelBaseActionController.startAction(
        name: '_DekontEditViewModelBase.setIslemTamamlandi');
    try {
      return super.setIslemTamamlandi(value);
    } finally {
      _$_DekontEditViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSelectedTab(int value) {
    final _$actionInfo = _$_DekontEditViewModelBaseActionController.startAction(
        name: '_DekontEditViewModelBase.setSelectedTab');
    try {
      return super.setSelectedTab(value);
    } finally {
      _$_DekontEditViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setKalemSayisi(int value) {
    final _$actionInfo = _$_DekontEditViewModelBaseActionController.startAction(
        name: '_DekontEditViewModelBase.setKalemSayisi');
    try {
      return super.setKalemSayisi(value);
    } finally {
      _$_DekontEditViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selectedTab: ${selectedTab},
kalemSayisi: ${kalemSayisi},
islemTamamlandi: ${islemTamamlandi}
    ''';
  }
}
