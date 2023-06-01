// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stok_yeni_kayit_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$StokYeniKayitViewModel on _StokYeniKayitViewModelBase, Store {
  late final _$projeListesiAtom =
      Atom(name: '_StokYeniKayitViewModelBase.projeListesi', context: context);

  @override
  List<BaseProjeModel>? get projeListesi {
    _$projeListesiAtom.reportRead();
    return super.projeListesi;
  }

  @override
  set projeListesi(List<BaseProjeModel>? value) {
    _$projeListesiAtom.reportWrite(value, super.projeListesi, () {
      super.projeListesi = value;
    });
  }

  late final _$anaVeriAtom =
      Atom(name: '_StokYeniKayitViewModelBase.anaVeri', context: context);

  @override
  MainPageModel? get anaVeri {
    _$anaVeriAtom.reportRead();
    return super.anaVeri;
  }

  @override
  set anaVeri(MainPageModel? value) {
    _$anaVeriAtom.reportWrite(value, super.anaVeri, () {
      super.anaVeri = value;
    });
  }

  late final _$modelAtom =
      Atom(name: '_StokYeniKayitViewModelBase.model', context: context);

  @override
  StokYeniKayitModel get model {
    _$modelAtom.reportRead();
    return super.model;
  }

  @override
  set model(StokYeniKayitModel value) {
    _$modelAtom.reportWrite(value, super.model, () {
      super.model = value;
    });
  }

  late final _$isSelectedAtom =
      Atom(name: '_StokYeniKayitViewModelBase.isSelected', context: context);

  @override
  ObservableList<bool> get isSelected {
    _$isSelectedAtom.reportRead();
    return super.isSelected;
  }

  @override
  set isSelected(ObservableList<bool> value) {
    _$isSelectedAtom.reportWrite(value, super.isSelected, () {
      super.isSelected = value;
    });
  }

  late final _$_StokYeniKayitViewModelBaseActionController =
      ActionController(name: '_StokYeniKayitViewModelBase', context: context);

  @override
  void setProjeListesi(List<BaseProjeModel>? model) {
    final _$actionInfo = _$_StokYeniKayitViewModelBaseActionController
        .startAction(name: '_StokYeniKayitViewModelBase.setProjeListesi');
    try {
      return super.setProjeListesi(model);
    } finally {
      _$_StokYeniKayitViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeIsSelected(int index) {
    final _$actionInfo = _$_StokYeniKayitViewModelBaseActionController
        .startAction(name: '_StokYeniKayitViewModelBase.changeIsSelected');
    try {
      return super.changeIsSelected(index);
    } finally {
      _$_StokYeniKayitViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
projeListesi: ${projeListesi},
anaVeri: ${anaVeri},
model: ${model},
isSelected: ${isSelected}
    ''';
  }
}
