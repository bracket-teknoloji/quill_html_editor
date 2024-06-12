// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'barkod_tanimla_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BarkodTanimlaViewModel on _BarkodTanimlaViewModelBase, Store {
  late final _$stokModelAtom =
      Atom(name: '_BarkodTanimlaViewModelBase.stokModel', context: context);

  @override
  StokListesiModel? get stokModel {
    _$stokModelAtom.reportRead();
    return super.stokModel;
  }

  @override
  set stokModel(StokListesiModel? value) {
    _$stokModelAtom.reportWrite(value, super.stokModel, () {
      super.stokModel = value;
    });
  }

  late final _$getStokAsyncAction =
      AsyncAction('_BarkodTanimlaViewModelBase.getStok', context: context);

  @override
  Future<void> getStok(String? stokKodu) {
    return _$getStokAsyncAction.run(() => super.getStok(stokKodu));
  }

  late final _$_BarkodTanimlaViewModelBaseActionController =
      ActionController(name: '_BarkodTanimlaViewModelBase', context: context);

  @override
  void setStokModel(StokListesiModel? model) {
    final _$actionInfo = _$_BarkodTanimlaViewModelBaseActionController
        .startAction(name: '_BarkodTanimlaViewModelBase.setStokModel');
    try {
      return super.setStokModel(model);
    } finally {
      _$_BarkodTanimlaViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
stokModel: ${stokModel}
    ''';
  }
}
