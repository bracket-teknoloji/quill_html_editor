// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter

part of 'cari_hareket_yeni_kayit_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CariYeniKayitViewModel on _CariYeniKayitViewModelBase, Store {
  Computed<String>? _$getHareketKoduComputed;

  @override
  String get getHareketKodu =>
      (_$getHareketKoduComputed ??= Computed<String>(() => super.getHareketKodu,
              name: '_CariYeniKayitViewModelBase.getHareketKodu'))
          .value;

  late final _$modelAtom =
      Atom(name: '_CariYeniKayitViewModelBase.model', context: context);

  @override
  CariYeniKayitModel get model {
    _$modelAtom.reportRead();
    return super.model;
  }

  @override
  set model(CariYeniKayitModel value) {
    _$modelAtom.reportWrite(value, super.model, () {
      super.model = value;
    });
  }

  late final _$isSelectedAtom =
      Atom(name: '_CariYeniKayitViewModelBase.isSelected', context: context);

  @override
  List<bool> get isSelected {
    _$isSelectedAtom.reportRead();
    return super.isSelected;
  }

  @override
  set isSelected(List<bool> value) {
    _$isSelectedAtom.reportWrite(value, super.isSelected, () {
      super.isSelected = value;
    });
  }

  late final _$_CariYeniKayitViewModelBaseActionController =
      ActionController(name: '_CariYeniKayitViewModelBase', context: context);

  @override
  void setModelHareketKodu(String value) {
    final _$actionInfo = _$_CariYeniKayitViewModelBaseActionController
        .startAction(name: '_CariYeniKayitViewModelBase.setModelHareketKodu');
    try {
      return super.setModelHareketKodu(value);
    } finally {
      _$_CariYeniKayitViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIsSelected(int index) {
    final _$actionInfo = _$_CariYeniKayitViewModelBaseActionController
        .startAction(name: '_CariYeniKayitViewModelBase.setIsSelected');
    try {
      return super.setIsSelected(index);
    } finally {
      _$_CariYeniKayitViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
model: ${model},
isSelected: ${isSelected},
getHareketKodu: ${getHareketKodu}
    ''';
  }
}
