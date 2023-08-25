// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stok_rehberi_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$StokRehberiViewModel on _StokRehberiViewModelBase, Store {
  late final _$dahaVarMiAtom =
      Atom(name: '_StokRehberiViewModelBase.dahaVarMi', context: context);

  @override
  bool get dahaVarMi {
    _$dahaVarMiAtom.reportRead();
    return super.dahaVarMi;
  }

  @override
  set dahaVarMi(bool value) {
    _$dahaVarMiAtom.reportWrite(value, super.dahaVarMi, () {
      super.dahaVarMi = value;
    });
  }

  late final _$isScrolledDownAtom =
      Atom(name: '_StokRehberiViewModelBase.isScrolledDown', context: context);

  @override
  bool get isScrolledDown {
    _$isScrolledDownAtom.reportRead();
    return super.isScrolledDown;
  }

  @override
  set isScrolledDown(bool value) {
    _$isScrolledDownAtom.reportWrite(value, super.isScrolledDown, () {
      super.isScrolledDown = value;
    });
  }

  late final _$stokListesiAtom =
      Atom(name: '_StokRehberiViewModelBase.stokListesi', context: context);

  @override
  List<StokListesiModel>? get stokListesi {
    _$stokListesiAtom.reportRead();
    return super.stokListesi;
  }

  @override
  set stokListesi(List<StokListesiModel>? value) {
    _$stokListesiAtom.reportWrite(value, super.stokListesi, () {
      super.stokListesi = value;
    });
  }

  late final _$stokBottomSheetModelAtom = Atom(
      name: '_StokRehberiViewModelBase.stokBottomSheetModel', context: context);

  @override
  StokBottomSheetModel get stokBottomSheetModel {
    _$stokBottomSheetModelAtom.reportRead();
    return super.stokBottomSheetModel;
  }

  @override
  set stokBottomSheetModel(StokBottomSheetModel value) {
    _$stokBottomSheetModelAtom.reportWrite(value, super.stokBottomSheetModel,
        () {
      super.stokBottomSheetModel = value;
    });
  }

  late final _$_StokRehberiViewModelBaseActionController =
      ActionController(name: '_StokRehberiViewModelBase', context: context);

  @override
  void setDahaVarMi(bool value) {
    final _$actionInfo = _$_StokRehberiViewModelBaseActionController
        .startAction(name: '_StokRehberiViewModelBase.setDahaVarMi');
    try {
      return super.setDahaVarMi(value);
    } finally {
      _$_StokRehberiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeIsScrolledDown(bool value) {
    final _$actionInfo = _$_StokRehberiViewModelBaseActionController
        .startAction(name: '_StokRehberiViewModelBase.changeIsScrolledDown');
    try {
      return super.changeIsScrolledDown(value);
    } finally {
      _$_StokRehberiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setStokListesi(List<dynamic>? value) {
    final _$actionInfo = _$_StokRehberiViewModelBaseActionController
        .startAction(name: '_StokRehberiViewModelBase.setStokListesi');
    try {
      return super.setStokListesi(value);
    } finally {
      _$_StokRehberiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void increaseSayfa() {
    final _$actionInfo = _$_StokRehberiViewModelBaseActionController
        .startAction(name: '_StokRehberiViewModelBase.increaseSayfa');
    try {
      return super.increaseSayfa();
    } finally {
      _$_StokRehberiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetSayfa() {
    final _$actionInfo = _$_StokRehberiViewModelBaseActionController
        .startAction(name: '_StokRehberiViewModelBase.resetSayfa');
    try {
      return super.resetSayfa();
    } finally {
      _$_StokRehberiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSiralama(String value) {
    final _$actionInfo = _$_StokRehberiViewModelBaseActionController
        .startAction(name: '_StokRehberiViewModelBase.setSiralama');
    try {
      return super.setSiralama(value);
    } finally {
      _$_StokRehberiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSearchText(String value) {
    final _$actionInfo = _$_StokRehberiViewModelBaseActionController
        .startAction(name: '_StokRehberiViewModelBase.setSearchText');
    try {
      return super.setSearchText(value);
    } finally {
      _$_StokRehberiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setGrupKodu(List<BaseGrupKoduModel> value) {
    final _$actionInfo = _$_StokRehberiViewModelBaseActionController
        .startAction(name: '_StokRehberiViewModelBase.setGrupKodu');
    try {
      return super.setGrupKodu(value);
    } finally {
      _$_StokRehberiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSelectedStokModel(String? value) {
    final _$actionInfo = _$_StokRehberiViewModelBaseActionController
        .startAction(name: '_StokRehberiViewModelBase.setSelectedStokModel');
    try {
      return super.setSelectedStokModel(value);
    } finally {
      _$_StokRehberiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetPage() {
    final _$actionInfo = _$_StokRehberiViewModelBaseActionController
        .startAction(name: '_StokRehberiViewModelBase.resetPage');
    try {
      return super.resetPage();
    } finally {
      _$_StokRehberiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
dahaVarMi: ${dahaVarMi},
isScrolledDown: ${isScrolledDown},
stokListesi: ${stokListesi},
stokBottomSheetModel: ${stokBottomSheetModel}
    ''';
  }
}
