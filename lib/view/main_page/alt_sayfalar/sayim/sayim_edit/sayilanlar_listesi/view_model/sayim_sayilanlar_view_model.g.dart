// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sayim_sayilanlar_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SayimSayilanlarViewModel on _SayimSayilanlarViewModelBase, Store {
  Computed<ObservableList<SayimListesiModel>?>? _$sayimListesiComputed;

  @override
  ObservableList<SayimListesiModel>? get sayimListesi =>
      (_$sayimListesiComputed ??= Computed<ObservableList<SayimListesiModel>?>(
              () => super.sayimListesi,
              name: '_SayimSayilanlarViewModelBase.sayimListesi'))
          .value;

  late final _$_sayimListesiAtom = Atom(
      name: '_SayimSayilanlarViewModelBase._sayimListesi', context: context);

  @override
  ObservableList<SayimListesiModel>? get _sayimListesi {
    _$_sayimListesiAtom.reportRead();
    return super._sayimListesi;
  }

  @override
  set _sayimListesi(ObservableList<SayimListesiModel>? value) {
    _$_sayimListesiAtom.reportWrite(value, super._sayimListesi, () {
      super._sayimListesi = value;
    });
  }

  late final _$requestModelAtom = Atom(
      name: '_SayimSayilanlarViewModelBase.requestModel', context: context);

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

  late final _$filterTextAtom =
      Atom(name: '_SayimSayilanlarViewModelBase.filterText', context: context);

  @override
  String get filterText {
    _$filterTextAtom.reportRead();
    return super.filterText;
  }

  @override
  set filterText(String value) {
    _$filterTextAtom.reportWrite(value, super.filterText, () {
      super.filterText = value;
    });
  }

  late final _$getDataAsyncAction =
      AsyncAction('_SayimSayilanlarViewModelBase.getData', context: context);

  @override
  Future<void> getData() {
    return _$getDataAsyncAction.run(() => super.getData());
  }

  late final _$_SayimSayilanlarViewModelBaseActionController =
      ActionController(name: '_SayimSayilanlarViewModelBase', context: context);

  @override
  void setSayimListesi(List<SayimListesiModel>? value) {
    final _$actionInfo = _$_SayimSayilanlarViewModelBaseActionController
        .startAction(name: '_SayimSayilanlarViewModelBase.setSayimListesi');
    try {
      return super.setSayimListesi(value);
    } finally {
      _$_SayimSayilanlarViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setFilterText(String? value) {
    final _$actionInfo = _$_SayimSayilanlarViewModelBaseActionController
        .startAction(name: '_SayimSayilanlarViewModelBase.setFilterText');
    try {
      return super.setFilterText(value);
    } finally {
      _$_SayimSayilanlarViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
requestModel: ${requestModel},
filterText: ${filterText},
sayimListesi: ${sayimListesi}
    ''';
  }
}
