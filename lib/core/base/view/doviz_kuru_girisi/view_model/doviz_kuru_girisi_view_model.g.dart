// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doviz_kuru_girisi_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DovizKuruGirisiViewModel on _DovizKuruGirisiViewModelBase, Store {
  late final _$dovizKurlariModelAtom = Atom(
    name: '_DovizKuruGirisiViewModelBase.dovizKurlariModel',
    context: context,
  );

  @override
  DovizKurlariModel? get dovizKurlariModel {
    _$dovizKurlariModelAtom.reportRead();
    return super.dovizKurlariModel;
  }

  @override
  set dovizKurlariModel(DovizKurlariModel? value) {
    _$dovizKurlariModelAtom.reportWrite(value, super.dovizKurlariModel, () {
      super.dovizKurlariModel = value;
    });
  }

  late final _$_DovizKuruGirisiViewModelBaseActionController = ActionController(
    name: '_DovizKuruGirisiViewModelBase',
    context: context,
  );

  @override
  void changeDovizKurlariModel(DovizKurlariModel? value) {
    final _$actionInfo = _$_DovizKuruGirisiViewModelBaseActionController.startAction(
      name: '_DovizKuruGirisiViewModelBase.changeDovizKurlariModel',
    );
    try {
      return super.changeDovizKurlariModel(value);
    } finally {
      _$_DovizKuruGirisiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeTarih(DateTime? value) {
    final _$actionInfo = _$_DovizKuruGirisiViewModelBaseActionController.startAction(
      name: '_DovizKuruGirisiViewModelBase.changeTarih',
    );
    try {
      return super.changeTarih(value);
    } finally {
      _$_DovizKuruGirisiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeDovizTipi(int? value) {
    final _$actionInfo = _$_DovizKuruGirisiViewModelBaseActionController.startAction(
      name: '_DovizKuruGirisiViewModelBase.changeDovizTipi',
    );
    try {
      return super.changeDovizTipi(value);
    } finally {
      _$_DovizKuruGirisiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeAlis(double? value) {
    final _$actionInfo = _$_DovizKuruGirisiViewModelBaseActionController.startAction(
      name: '_DovizKuruGirisiViewModelBase.changeAlis',
    );
    try {
      return super.changeAlis(value);
    } finally {
      _$_DovizKuruGirisiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeSatis(double? value) {
    final _$actionInfo = _$_DovizKuruGirisiViewModelBaseActionController.startAction(
      name: '_DovizKuruGirisiViewModelBase.changeSatis',
    );
    try {
      return super.changeSatis(value);
    } finally {
      _$_DovizKuruGirisiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeEfektifAlis(double? value) {
    final _$actionInfo = _$_DovizKuruGirisiViewModelBaseActionController.startAction(
      name: '_DovizKuruGirisiViewModelBase.changeEfektifAlis',
    );
    try {
      return super.changeEfektifAlis(value);
    } finally {
      _$_DovizKuruGirisiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeEfektifSatis(double? value) {
    final _$actionInfo = _$_DovizKuruGirisiViewModelBaseActionController.startAction(
      name: '_DovizKuruGirisiViewModelBase.changeEfektifSatis',
    );
    try {
      return super.changeEfektifSatis(value);
    } finally {
      _$_DovizKuruGirisiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
dovizKurlariModel: ${dovizKurlariModel}
    ''';
  }
}
