// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'yazici_listesi_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$YaziciListesiViewModel on _YaziciListesiViewModelBase, Store {
  late final _$yaziciListesiAtom =
      Atom(name: '_YaziciListesiViewModelBase.yaziciListesi', context: context);

  @override
  ObservableList<YaziciModel>? get yaziciListesi {
    _$yaziciListesiAtom.reportRead();
    return super.yaziciListesi;
  }

  @override
  set yaziciListesi(ObservableList<YaziciModel>? value) {
    _$yaziciListesiAtom.reportWrite(value, super.yaziciListesi, () {
      super.yaziciListesi = value;
    });
  }

  late final _$_YaziciListesiViewModelBaseActionController =
      ActionController(name: '_YaziciListesiViewModelBase', context: context);

  @override
  void setYaziciListesi() {
    final _$actionInfo = _$_YaziciListesiViewModelBaseActionController
        .startAction(name: '_YaziciListesiViewModelBase.setYaziciListesi');
    try {
      return super.setYaziciListesi();
    } finally {
      _$_YaziciListesiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addYaziciListesi(YaziciModel value) {
    final _$actionInfo = _$_YaziciListesiViewModelBaseActionController
        .startAction(name: '_YaziciListesiViewModelBase.addYaziciListesi');
    try {
      return super.addYaziciListesi(value);
    } finally {
      _$_YaziciListesiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
yaziciListesi: ${yaziciListesi}
    ''';
  }
}
