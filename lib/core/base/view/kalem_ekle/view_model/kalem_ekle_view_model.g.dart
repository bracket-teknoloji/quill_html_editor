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
  String toString() {
    return '''
model: ${model},
dovizliMi: ${dovizliMi}
    ''';
  }
}
