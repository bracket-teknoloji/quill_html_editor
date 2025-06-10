// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seri_girisi_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SeriGirisiViewModel on _SeriGirisiViewModelBase, Store {
  late final _$seriHareketleriModelAtom = Atom(
    name: '_SeriGirisiViewModelBase.seriHareketleriModel',
    context: context,
  );

  @override
  SeriHareketleriModel get seriHareketleriModel {
    _$seriHareketleriModelAtom.reportRead();
    return super.seriHareketleriModel;
  }

  @override
  set seriHareketleriModel(SeriHareketleriModel value) {
    _$seriHareketleriModelAtom.reportWrite(
      value,
      super.seriHareketleriModel,
      () {
        super.seriHareketleriModel = value;
      },
    );
  }

  late final _$postDataAsyncAction = AsyncAction(
    '_SeriGirisiViewModelBase.postData',
    context: context,
  );

  @override
  Future<bool> postData() {
    return _$postDataAsyncAction.run(() => super.postData());
  }

  late final _$_SeriGirisiViewModelBaseActionController = ActionController(
    name: '_SeriGirisiViewModelBase',
    context: context,
  );

  @override
  void setSeriHareketleriModel(SeriHareketleriModel model) {
    final _$actionInfo = _$_SeriGirisiViewModelBaseActionController.startAction(
      name: '_SeriGirisiViewModelBase.setSeriHareketleriModel',
    );
    try {
      return super.setSeriHareketleriModel(model);
    } finally {
      _$_SeriGirisiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setStokKodu(String? stokKodu) {
    final _$actionInfo = _$_SeriGirisiViewModelBaseActionController.startAction(
      name: '_SeriGirisiViewModelBase.setStokKodu',
    );
    try {
      return super.setStokKodu(stokKodu);
    } finally {
      _$_SeriGirisiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDepoKodu(int? depoKodu) {
    final _$actionInfo = _$_SeriGirisiViewModelBaseActionController.startAction(
      name: '_SeriGirisiViewModelBase.setDepoKodu',
    );
    try {
      return super.setDepoKodu(depoKodu);
    } finally {
      _$_SeriGirisiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSeri1(String? seri1) {
    final _$actionInfo = _$_SeriGirisiViewModelBaseActionController.startAction(
      name: '_SeriGirisiViewModelBase.setSeri1',
    );
    try {
      return super.setSeri1(seri1);
    } finally {
      _$_SeriGirisiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSeri2(String? seri2) {
    final _$actionInfo = _$_SeriGirisiViewModelBaseActionController.startAction(
      name: '_SeriGirisiViewModelBase.setSeri2',
    );
    try {
      return super.setSeri2(seri2);
    } finally {
      _$_SeriGirisiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setGcKod(String? gckod) {
    final _$actionInfo = _$_SeriGirisiViewModelBaseActionController.startAction(
      name: '_SeriGirisiViewModelBase.setGcKod',
    );
    try {
      return super.setGcKod(gckod);
    } finally {
      _$_SeriGirisiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setAciklama1(String? aciklama1) {
    final _$actionInfo = _$_SeriGirisiViewModelBaseActionController.startAction(
      name: '_SeriGirisiViewModelBase.setAciklama1',
    );
    try {
      return super.setAciklama1(aciklama1);
    } finally {
      _$_SeriGirisiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setAciklama2(String? aciklama2) {
    final _$actionInfo = _$_SeriGirisiViewModelBaseActionController.startAction(
      name: '_SeriGirisiViewModelBase.setAciklama2',
    );
    try {
      return super.setAciklama2(aciklama2);
    } finally {
      _$_SeriGirisiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setMiktar(double? miktar) {
    final _$actionInfo = _$_SeriGirisiViewModelBaseActionController.startAction(
      name: '_SeriGirisiViewModelBase.setMiktar',
    );
    try {
      return super.setMiktar(miktar);
    } finally {
      _$_SeriGirisiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setHareketAciklama(String? hareketAciklama) {
    final _$actionInfo = _$_SeriGirisiViewModelBaseActionController.startAction(
      name: '_SeriGirisiViewModelBase.setHareketAciklama',
    );
    try {
      return super.setHareketAciklama(hareketAciklama);
    } finally {
      _$_SeriGirisiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setBelgeNo(String? belgeNo) {
    final _$actionInfo = _$_SeriGirisiViewModelBaseActionController.startAction(
      name: '_SeriGirisiViewModelBase.setBelgeNo',
    );
    try {
      return super.setBelgeNo(belgeNo);
    } finally {
      _$_SeriGirisiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void increaseMiktar() {
    final _$actionInfo = _$_SeriGirisiViewModelBaseActionController.startAction(
      name: '_SeriGirisiViewModelBase.increaseMiktar',
    );
    try {
      return super.increaseMiktar();
    } finally {
      _$_SeriGirisiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void decreaseMiktar() {
    final _$actionInfo = _$_SeriGirisiViewModelBaseActionController.startAction(
      name: '_SeriGirisiViewModelBase.decreaseMiktar',
    );
    try {
      return super.decreaseMiktar();
    } finally {
      _$_SeriGirisiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
seriHareketleriModel: ${seriHareketleriModel}
    ''';
  }
}
