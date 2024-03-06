// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sayim_girisi_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SayimGirisiViewModel on _SayimGirisiViewModelBase, Store {
  late final _$filtreModelAtom =
      Atom(name: '_SayimGirisiViewModelBase.filtreModel', context: context);

  @override
  SayimFiltreModel get filtreModel {
    _$filtreModelAtom.reportRead();
    return super.filtreModel;
  }

  @override
  set filtreModel(SayimFiltreModel value) {
    _$filtreModelAtom.reportWrite(value, super.filtreModel, () {
      super.filtreModel = value;
    });
  }

  late final _$stokModelAtom =
      Atom(name: '_SayimGirisiViewModelBase.stokModel', context: context);

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

  late final _$_SayimGirisiViewModelBaseActionController =
      ActionController(name: '_SayimGirisiViewModelBase', context: context);

  @override
  void setStokModel(StokListesiModel? model) {
    final _$actionInfo = _$_SayimGirisiViewModelBaseActionController
        .startAction(name: '_SayimGirisiViewModelBase.setStokModel');
    try {
      return super.setStokModel(model);
    } finally {
      _$_SayimGirisiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
filtreModel: ${filtreModel},
stokModel: ${stokModel}
    ''';
  }
}
