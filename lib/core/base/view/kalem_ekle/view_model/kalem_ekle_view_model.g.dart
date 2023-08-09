// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kalem_ekle_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$KalemEkleViewModel on _KalemEkleViewModelBase, Store {
  Computed<bool>? _$dovizliMiComputed;

  @override
  bool get dovizliMi =>
      (_$dovizliMiComputed ??= Computed<bool>(() => super.dovizliMi,
              name: '_KalemEkleViewModelBase.dovizliMi'))
          .value;

  late final _$modelAtom =
      Atom(name: '_KalemEkleViewModelBase.model', context: context);

  @override
  StokListesiModel? get model {
    _$modelAtom.reportRead();
    return super.model;
  }

  @override
  set model(StokListesiModel? value) {
    _$modelAtom.reportWrite(value, super.model, () {
      super.model = value;
    });
  }

  late final _$kalemModelAtom =
      Atom(name: '_KalemEkleViewModelBase.kalemModel', context: context);

  @override
  KalemModel get kalemModel {
    _$kalemModelAtom.reportRead();
    return super.kalemModel;
  }

  @override
  set kalemModel(KalemModel value) {
    _$kalemModelAtom.reportWrite(value, super.kalemModel, () {
      super.kalemModel = value;
    });
  }

  late final _$_KalemEkleViewModelBaseActionController =
      ActionController(name: '_KalemEkleViewModelBase', context: context);

  @override
  void setModel(StokListesiModel? value) {
    final _$actionInfo = _$_KalemEkleViewModelBaseActionController.startAction(
        name: '_KalemEkleViewModelBase.setModel');
    try {
      return super.setModel(value);
    } finally {
      _$_KalemEkleViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void increaseMiktar(TextEditingController controller) {
    final _$actionInfo = _$_KalemEkleViewModelBaseActionController.startAction(
        name: '_KalemEkleViewModelBase.increaseMiktar');
    try {
      return super.increaseMiktar(controller);
    } finally {
      _$_KalemEkleViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setMiktar(int value) {
    final _$actionInfo = _$_KalemEkleViewModelBaseActionController.startAction(
        name: '_KalemEkleViewModelBase.setMiktar');
    try {
      return super.setMiktar(value);
    } finally {
      _$_KalemEkleViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void decreaseMiktar(TextEditingController controller) {
    final _$actionInfo = _$_KalemEkleViewModelBaseActionController.startAction(
        name: '_KalemEkleViewModelBase.decreaseMiktar');
    try {
      return super.decreaseMiktar(controller);
    } finally {
      _$_KalemEkleViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void increaseMiktar2(TextEditingController controller) {
    final _$actionInfo = _$_KalemEkleViewModelBaseActionController.startAction(
        name: '_KalemEkleViewModelBase.increaseMiktar2');
    try {
      return super.increaseMiktar2(controller);
    } finally {
      _$_KalemEkleViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setMiktar2(int value) {
    final _$actionInfo = _$_KalemEkleViewModelBaseActionController.startAction(
        name: '_KalemEkleViewModelBase.setMiktar2');
    try {
      return super.setMiktar2(value);
    } finally {
      _$_KalemEkleViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void decreaseMiktar2(TextEditingController controller) {
    final _$actionInfo = _$_KalemEkleViewModelBaseActionController.startAction(
        name: '_KalemEkleViewModelBase.decreaseMiktar2');
    try {
      return super.decreaseMiktar2(controller);
    } finally {
      _$_KalemEkleViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
model: ${model},
kalemModel: ${kalemModel},
dovizliMi: ${dovizliMi}
    ''';
  }
}
