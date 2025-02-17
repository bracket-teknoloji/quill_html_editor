// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cari_hareket_yeni_kayit_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CariHareketYeniKayitViewModel on _CariHareketYeniKayitViewModelBase, Store {
  Computed<String>? _$getHareketKoduComputed;

  @override
  String get getHareketKodu =>
      (_$getHareketKoduComputed ??= Computed<String>(
            () => super.getHareketKodu,
            name: '_CariHareketYeniKayitViewModelBase.getHareketKodu',
          ))
          .value;

  late final _$projeListAtom = Atom(name: '_CariHareketYeniKayitViewModelBase.projeList', context: context);

  @override
  List<BaseProjeModel> get projeList {
    _$projeListAtom.reportRead();
    return super.projeList;
  }

  @override
  set projeList(List<BaseProjeModel> value) {
    _$projeListAtom.reportWrite(value, super.projeList, () {
      super.projeList = value;
    });
  }

  late final _$modelAtom = Atom(name: '_CariHareketYeniKayitViewModelBase.model', context: context);

  @override
  CariHareketYeniKayitModel get model {
    _$modelAtom.reportRead();
    return super.model;
  }

  @override
  set model(CariHareketYeniKayitModel value) {
    _$modelAtom.reportWrite(value, super.model, () {
      super.model = value;
    });
  }

  late final _$isSelectedAtom = Atom(name: '_CariHareketYeniKayitViewModelBase.isSelected', context: context);

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

  late final _$_CariHareketYeniKayitViewModelBaseActionController = ActionController(
    name: '_CariHareketYeniKayitViewModelBase',
    context: context,
  );

  @override
  void setProjeList(List<BaseProjeModel>? value) {
    final _$actionInfo = _$_CariHareketYeniKayitViewModelBaseActionController.startAction(
      name: '_CariHareketYeniKayitViewModelBase.setProjeList',
    );
    try {
      return super.setProjeList(value);
    } finally {
      _$_CariHareketYeniKayitViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setModelHareketKodu(String value) {
    final _$actionInfo = _$_CariHareketYeniKayitViewModelBaseActionController.startAction(
      name: '_CariHareketYeniKayitViewModelBase.setModelHareketKodu',
    );
    try {
      return super.setModelHareketKodu(value);
    } finally {
      _$_CariHareketYeniKayitViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIsSelected(int index) {
    final _$actionInfo = _$_CariHareketYeniKayitViewModelBaseActionController.startAction(
      name: '_CariHareketYeniKayitViewModelBase.setIsSelected',
    );
    try {
      return super.setIsSelected(index);
    } finally {
      _$_CariHareketYeniKayitViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
projeList: ${projeList},
model: ${model},
isSelected: ${isSelected},
getHareketKodu: ${getHareketKodu}
    ''';
  }
}
