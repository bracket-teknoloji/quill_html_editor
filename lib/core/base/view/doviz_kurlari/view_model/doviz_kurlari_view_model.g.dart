// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doviz_kurlari_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DovizKurlariViewModel on _DovizKurlariViewModelBase, Store {
  late final _$dovizKurlariListAtom = Atom(
      name: '_DovizKurlariViewModelBase.dovizKurlariList', context: context);

  @override
  ObservableList<DovizKurlariModel>? get dovizKurlariList {
    _$dovizKurlariListAtom.reportRead();
    return super.dovizKurlariList;
  }

  @override
  set dovizKurlariList(ObservableList<DovizKurlariModel>? value) {
    _$dovizKurlariListAtom.reportWrite(value, super.dovizKurlariList, () {
      super.dovizKurlariList = value;
    });
  }

  late final _$tarihAtom =
      Atom(name: '_DovizKurlariViewModelBase.tarih', context: context);

  @override
  DateTime get tarih {
    _$tarihAtom.reportRead();
    return super.tarih;
  }

  @override
  set tarih(DateTime value) {
    _$tarihAtom.reportWrite(value, super.tarih, () {
      super.tarih = value;
    });
  }

  late final _$kurlariSilTekrarGuncelleAtom = Atom(
      name: '_DovizKurlariViewModelBase.kurlariSilTekrarGuncelle',
      context: context);

  @override
  bool get kurlariSilTekrarGuncelle {
    _$kurlariSilTekrarGuncelleAtom.reportRead();
    return super.kurlariSilTekrarGuncelle;
  }

  @override
  set kurlariSilTekrarGuncelle(bool value) {
    _$kurlariSilTekrarGuncelleAtom
        .reportWrite(value, super.kurlariSilTekrarGuncelle, () {
      super.kurlariSilTekrarGuncelle = value;
    });
  }

  late final _$_DovizKurlariViewModelBaseActionController =
      ActionController(name: '_DovizKurlariViewModelBase', context: context);

  @override
  void changeDovizKurlariList(List<DovizKurlariModel>? value) {
    final _$actionInfo = _$_DovizKurlariViewModelBaseActionController
        .startAction(name: '_DovizKurlariViewModelBase.changeDovizKurlariList');
    try {
      return super.changeDovizKurlariList(value);
    } finally {
      _$_DovizKurlariViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeTarih(DateTime? value) {
    final _$actionInfo = _$_DovizKurlariViewModelBaseActionController
        .startAction(name: '_DovizKurlariViewModelBase.changeTarih');
    try {
      return super.changeTarih(value);
    } finally {
      _$_DovizKurlariViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeTarihTomorow() {
    final _$actionInfo = _$_DovizKurlariViewModelBaseActionController
        .startAction(name: '_DovizKurlariViewModelBase.changeTarihTomorow');
    try {
      return super.changeTarihTomorow();
    } finally {
      _$_DovizKurlariViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeTarihYesterday() {
    final _$actionInfo = _$_DovizKurlariViewModelBaseActionController
        .startAction(name: '_DovizKurlariViewModelBase.changeTarihYesterday');
    try {
      return super.changeTarihYesterday();
    } finally {
      _$_DovizKurlariViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeKurlariSilTekrarGuncelle() {
    final _$actionInfo =
        _$_DovizKurlariViewModelBaseActionController.startAction(
            name: '_DovizKurlariViewModelBase.changeKurlariSilTekrarGuncelle');
    try {
      return super.changeKurlariSilTekrarGuncelle();
    } finally {
      _$_DovizKurlariViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
dovizKurlariList: ${dovizKurlariList},
tarih: ${tarih},
kurlariSilTekrarGuncelle: ${kurlariSilTekrarGuncelle}
    ''';
  }
}
