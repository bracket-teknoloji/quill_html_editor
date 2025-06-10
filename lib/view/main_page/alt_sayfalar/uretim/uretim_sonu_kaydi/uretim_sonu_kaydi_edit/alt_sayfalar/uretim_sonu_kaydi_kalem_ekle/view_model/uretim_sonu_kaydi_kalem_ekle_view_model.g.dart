// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'uretim_sonu_kaydi_kalem_ekle_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UretimSonuKaydiKalemEkleViewModel
    on _UretimSonuKaydiKalemEkleViewModelBase, Store {
  late final _$modelAtom = Atom(
    name: '_UretimSonuKaydiKalemEkleViewModelBase.model',
    context: context,
  );

  @override
  KalemModel get model {
    _$modelAtom.reportRead();
    return super.model;
  }

  @override
  set model(KalemModel value) {
    _$modelAtom.reportWrite(value, super.model, () {
      super.model = value;
    });
  }

  late final _$_UretimSonuKaydiKalemEkleViewModelBaseActionController =
      ActionController(
        name: '_UretimSonuKaydiKalemEkleViewModelBase',
        context: context,
      );

  @override
  void setModel(KalemModel value) {
    final _$actionInfo =
        _$_UretimSonuKaydiKalemEkleViewModelBaseActionController.startAction(
          name: '_UretimSonuKaydiKalemEkleViewModelBase.setModel',
        );
    try {
      return super.setModel(value);
    } finally {
      _$_UretimSonuKaydiKalemEkleViewModelBaseActionController.endAction(
        _$actionInfo,
      );
    }
  }

  @override
  void setIsEmri(String value) {
    final _$actionInfo =
        _$_UretimSonuKaydiKalemEkleViewModelBaseActionController.startAction(
          name: '_UretimSonuKaydiKalemEkleViewModelBase.setIsEmri',
        );
    try {
      return super.setIsEmri(value);
    } finally {
      _$_UretimSonuKaydiKalemEkleViewModelBaseActionController.endAction(
        _$actionInfo,
      );
    }
  }

  @override
  void setMamul(StokListesiModel? value) {
    final _$actionInfo =
        _$_UretimSonuKaydiKalemEkleViewModelBaseActionController.startAction(
          name: '_UretimSonuKaydiKalemEkleViewModelBase.setMamul',
        );
    try {
      return super.setMamul(value);
    } finally {
      _$_UretimSonuKaydiKalemEkleViewModelBaseActionController.endAction(
        _$actionInfo,
      );
    }
  }

  @override
  void setMiktar(double? miktar) {
    final _$actionInfo =
        _$_UretimSonuKaydiKalemEkleViewModelBaseActionController.startAction(
          name: '_UretimSonuKaydiKalemEkleViewModelBase.setMiktar',
        );
    try {
      return super.setMiktar(miktar);
    } finally {
      _$_UretimSonuKaydiKalemEkleViewModelBaseActionController.endAction(
        _$actionInfo,
      );
    }
  }

  @override
  void setHurdaMiktar(double? hurdaMiktar) {
    final _$actionInfo =
        _$_UretimSonuKaydiKalemEkleViewModelBaseActionController.startAction(
          name: '_UretimSonuKaydiKalemEkleViewModelBase.setHurdaMiktar',
        );
    try {
      return super.setHurdaMiktar(hurdaMiktar);
    } finally {
      _$_UretimSonuKaydiKalemEkleViewModelBaseActionController.endAction(
        _$actionInfo,
      );
    }
  }

  @override
  void setAciklama(String value) {
    final _$actionInfo =
        _$_UretimSonuKaydiKalemEkleViewModelBaseActionController.startAction(
          name: '_UretimSonuKaydiKalemEkleViewModelBase.setAciklama',
        );
    try {
      return super.setAciklama(value);
    } finally {
      _$_UretimSonuKaydiKalemEkleViewModelBaseActionController.endAction(
        _$actionInfo,
      );
    }
  }

  @override
  void setEkAlan1(String value) {
    final _$actionInfo =
        _$_UretimSonuKaydiKalemEkleViewModelBaseActionController.startAction(
          name: '_UretimSonuKaydiKalemEkleViewModelBase.setEkAlan1',
        );
    try {
      return super.setEkAlan1(value);
    } finally {
      _$_UretimSonuKaydiKalemEkleViewModelBaseActionController.endAction(
        _$actionInfo,
      );
    }
  }

  @override
  void setEkAlan2(String value) {
    final _$actionInfo =
        _$_UretimSonuKaydiKalemEkleViewModelBaseActionController.startAction(
          name: '_UretimSonuKaydiKalemEkleViewModelBase.setEkAlan2',
        );
    try {
      return super.setEkAlan2(value);
    } finally {
      _$_UretimSonuKaydiKalemEkleViewModelBaseActionController.endAction(
        _$actionInfo,
      );
    }
  }

  @override
  String toString() {
    return '''
model: ${model}
    ''';
  }
}
