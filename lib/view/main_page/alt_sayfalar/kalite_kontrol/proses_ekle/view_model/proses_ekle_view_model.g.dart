// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'proses_ekle_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProsesEkleViewModel on _ProsesEkleViewModelBase, Store {
  Computed<double>? _$ortalamaDegerComputed;

  @override
  double get ortalamaDeger =>
      (_$ortalamaDegerComputed ??= Computed<double>(() => super.ortalamaDeger,
              name: '_ProsesEkleViewModelBase.ortalamaDeger'))
          .value;
  Computed<double>? _$enKucukDegerComputed;

  @override
  double get enKucukDeger =>
      (_$enKucukDegerComputed ??= Computed<double>(() => super.enKucukDeger,
              name: '_ProsesEkleViewModelBase.enKucukDeger'))
          .value;
  Computed<double>? _$enBuyukDegerComputed;

  @override
  double get enBuyukDeger =>
      (_$enBuyukDegerComputed ??= Computed<double>(() => super.enBuyukDeger,
              name: '_ProsesEkleViewModelBase.enBuyukDeger'))
          .value;

  late final _$prosesDetayListesiAtom = Atom(
      name: '_ProsesEkleViewModelBase.prosesDetayListesi', context: context);

  @override
  ObservableList<OlcumEkleDetayModel> get prosesDetayListesi {
    _$prosesDetayListesiAtom.reportRead();
    return super.prosesDetayListesi;
  }

  @override
  set prosesDetayListesi(ObservableList<OlcumEkleDetayModel> value) {
    _$prosesDetayListesiAtom.reportWrite(value, super.prosesDetayListesi, () {
      super.prosesDetayListesi = value;
    });
  }

  late final _$_ProsesEkleViewModelBaseActionController =
      ActionController(name: '_ProsesEkleViewModelBase', context: context);

  @override
  void setProsesDetayListesi(int index) {
    final _$actionInfo = _$_ProsesEkleViewModelBaseActionController.startAction(
        name: '_ProsesEkleViewModelBase.setProsesDetayListesi');
    try {
      return super.setProsesDetayListesi(index);
    } finally {
      _$_ProsesEkleViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIndexedItem(int index, OlcumEkleDetayModel item) {
    final _$actionInfo = _$_ProsesEkleViewModelBaseActionController.startAction(
        name: '_ProsesEkleViewModelBase.setIndexedItem');
    try {
      return super.setIndexedItem(index, item);
    } finally {
      _$_ProsesEkleViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
prosesDetayListesi: ${prosesDetayListesi},
ortalamaDeger: ${ortalamaDeger},
enKucukDeger: ${enKucukDeger},
enBuyukDeger: ${enBuyukDeger}
    ''';
  }
}
