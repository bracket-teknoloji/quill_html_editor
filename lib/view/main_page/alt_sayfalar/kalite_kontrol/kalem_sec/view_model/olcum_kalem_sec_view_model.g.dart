// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'olcum_kalem_sec_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$OlcumKalemSecViewModel on _OlcumKalemSecViewModelBase, Store {
  late final _$olcumGirisiListesiAtom = Atom(
      name: '_OlcumKalemSecViewModelBase.olcumGirisiListesi', context: context);

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

  late final _$getDataAsyncAction =
      AsyncAction('_OlcumKalemSecViewModelBase.getData', context: context);

  @override
  Future<void> getData() {
    return _$getDataAsyncAction.run(() => super.getData());
  }

  late final _$_OlcumKalemSecViewModelBaseActionController =
      ActionController(name: '_OlcumKalemSecViewModelBase', context: context);

  @override
  void setOlcumBelgeModel(List<OlcumBelgeModel>? list) {
    final _$actionInfo = _$_OlcumKalemSecViewModelBaseActionController
        .startAction(name: '_OlcumKalemSecViewModelBase.setOlcumBelgeModel');
    try {
      return super.setOlcumBelgeModel(list);
    } finally {
      _$_OlcumKalemSecViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
olcumGirisiListesi: ${olcumGirisiListesi}
    ''';
  }
}
