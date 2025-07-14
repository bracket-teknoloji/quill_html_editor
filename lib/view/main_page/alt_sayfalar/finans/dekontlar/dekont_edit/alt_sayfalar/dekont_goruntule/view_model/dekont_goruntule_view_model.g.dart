// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dekont_goruntule_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DekontGoruntuleViewModel on _DekontGoruntuleViewModelBase, Store {
  late final _$dekontListesiAtom = Atom(
    name: '_DekontGoruntuleViewModelBase.dekontListesi',
    context: context,
  );

  @override
  ObservableList<DekontDuzenleRequestModel> get dekontListesi {
    _$dekontListesiAtom.reportRead();
    return super.dekontListesi;
  }

  @override
  set dekontListesi(ObservableList<DekontDuzenleRequestModel> value) {
    _$dekontListesiAtom.reportWrite(value, super.dekontListesi, () {
      super.dekontListesi = value;
    });
  }

  late final _$dekontMapAtom = Atom(
    name: '_DekontGoruntuleViewModelBase.dekontMap',
    context: context,
  );

  @override
  ObservableMap<String, dynamic>? get dekontMap {
    _$dekontMapAtom.reportRead();
    return super.dekontMap;
  }

  @override
  set dekontMap(ObservableMap<String, dynamic>? value) {
    _$dekontMapAtom.reportWrite(value, super.dekontMap, () {
      super.dekontMap = value;
    });
  }

  late final _$getDataAsyncAction = AsyncAction(
    '_DekontGoruntuleViewModelBase.getData',
    context: context,
  );

  @override
  Future<void> getData(DekontListesiModel? model, String? refkey) {
    return _$getDataAsyncAction.run(() => super.getData(model, refkey));
  }

  late final _$_DekontGoruntuleViewModelBaseActionController = ActionController(
    name: '_DekontGoruntuleViewModelBase',
    context: context,
  );

  @override
  void setDekontListesi(List<DekontDuzenleRequestModel> value) {
    final _$actionInfo = _$_DekontGoruntuleViewModelBaseActionController.startAction(
      name: '_DekontGoruntuleViewModelBase.setDekontListesi',
    );
    try {
      return super.setDekontListesi(value);
    } finally {
      _$_DekontGoruntuleViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDekontMap(Map<String, dynamic> value) {
    final _$actionInfo = _$_DekontGoruntuleViewModelBaseActionController.startAction(
      name: '_DekontGoruntuleViewModelBase.setDekontMap',
    );
    try {
      return super.setDekontMap(value);
    } finally {
      _$_DekontGoruntuleViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
dekontListesi: ${dekontListesi},
dekontMap: ${dekontMap}
    ''';
  }
}
