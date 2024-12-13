// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entry_company_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$EntryCompanyViewModel on _EntryCompanyViewModelBase, Store {
  late final _$selectedAtom =
      Atom(name: '_EntryCompanyViewModelBase.selected', context: context);

  @override
  ObservableMap<dynamic, dynamic> get selected {
    _$selectedAtom.reportRead();
    return super.selected;
  }

  @override
  set selected(ObservableMap<dynamic, dynamic> value) {
    _$selectedAtom.reportWrite(value, super.selected, () {
      super.selected = value;
    });
  }

  late final _$userDataAtom =
      Atom(name: '_EntryCompanyViewModelBase.userData', context: context);

  @override
  ObservableMap<dynamic, dynamic> get userData {
    _$userDataAtom.reportRead();
    return super.userData;
  }

  @override
  set userData(ObservableMap<dynamic, dynamic> value) {
    _$userDataAtom.reportWrite(value, super.userData, () {
      super.userData = value;
    });
  }

  late final _$sirketListAtom =
      Atom(name: '_EntryCompanyViewModelBase.sirketList', context: context);

  @override
  List<CompanyModel>? get sirketList {
    _$sirketListAtom.reportRead();
    return super.sirketList;
  }

  @override
  set sirketList(List<CompanyModel>? value) {
    _$sirketListAtom.reportWrite(value, super.sirketList, () {
      super.sirketList = value;
    });
  }

  late final _$isletmeListAtom =
      Atom(name: '_EntryCompanyViewModelBase.isletmeList', context: context);

  @override
  List<IsletmeModel>? get isletmeList {
    _$isletmeListAtom.reportRead();
    return super.isletmeList;
  }

  @override
  set isletmeList(List<IsletmeModel>? value) {
    _$isletmeListAtom.reportWrite(value, super.isletmeList, () {
      super.isletmeList = value;
    });
  }

  late final _$subeListAtom =
      Atom(name: '_EntryCompanyViewModelBase.subeList', context: context);

  @override
  List<IsletmeModel>? get subeList {
    _$subeListAtom.reportRead();
    return super.subeList;
  }

  @override
  set subeList(List<IsletmeModel>? value) {
    _$subeListAtom.reportWrite(value, super.subeList, () {
      super.subeList = value;
    });
  }

  late final _$getDataAsyncAction =
      AsyncAction('_EntryCompanyViewModelBase.getData', context: context);

  @override
  Future<bool> getData() {
    return _$getDataAsyncAction.run(() => super.getData());
  }

  late final _$getSubeAsyncAction =
      AsyncAction('_EntryCompanyViewModelBase.getSube', context: context);

  @override
  Future<void> getSube() {
    return _$getSubeAsyncAction.run(() => super.getSube());
  }

  late final _$_EntryCompanyViewModelBaseActionController =
      ActionController(name: '_EntryCompanyViewModelBase', context: context);

  @override
  void setSirket(List<CompanyModel>? value) {
    final _$actionInfo = _$_EntryCompanyViewModelBaseActionController
        .startAction(name: '_EntryCompanyViewModelBase.setSirket');
    try {
      return super.setSirket(value);
    } finally {
      _$_EntryCompanyViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIsletme(List<IsletmeModel>? value) {
    final _$actionInfo = _$_EntryCompanyViewModelBaseActionController
        .startAction(name: '_EntryCompanyViewModelBase.setIsletme');
    try {
      return super.setIsletme(value);
    } finally {
      _$_EntryCompanyViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSube(List<IsletmeModel>? value) {
    final _$actionInfo = _$_EntryCompanyViewModelBaseActionController
        .startAction(name: '_EntryCompanyViewModelBase.setSube');
    try {
      return super.setSube(value);
    } finally {
      _$_EntryCompanyViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void selectedSirket(CompanyModel? value) {
    final _$actionInfo = _$_EntryCompanyViewModelBaseActionController
        .startAction(name: '_EntryCompanyViewModelBase.selectedSirket');
    try {
      return super.selectedSirket(value);
    } finally {
      _$_EntryCompanyViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void selectedIsletme(IsletmeModel? value) {
    final _$actionInfo = _$_EntryCompanyViewModelBaseActionController
        .startAction(name: '_EntryCompanyViewModelBase.selectedIsletme');
    try {
      return super.selectedIsletme(value);
    } finally {
      _$_EntryCompanyViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void selectedSube(IsletmeModel? value) {
    final _$actionInfo = _$_EntryCompanyViewModelBaseActionController
        .startAction(name: '_EntryCompanyViewModelBase.selectedSube');
    try {
      return super.selectedSube(value);
    } finally {
      _$_EntryCompanyViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selected: ${selected},
userData: ${userData},
sirketList: ${sirketList},
isletmeList: ${isletmeList},
subeList: ${subeList}
    ''';
  }
}
