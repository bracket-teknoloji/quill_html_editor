// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cek_senet_hareketleri_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CekSenetHareketleriViewModel on _CekSenetHareketleriViewModelBase, Store {
  late final _$cekSenetListesiModelAtom = Atom(
    name: '_CekSenetHareketleriViewModelBase.cekSenetListesiModel',
    context: context,
  );

  @override
  CekSenetListesiModel? get cekSenetListesiModel {
    _$cekSenetListesiModelAtom.reportRead();
    return super.cekSenetListesiModel;
  }

  @override
  set cekSenetListesiModel(CekSenetListesiModel? value) {
    _$cekSenetListesiModelAtom.reportWrite(
      value,
      super.cekSenetListesiModel,
      () {
        super.cekSenetListesiModel = value;
      },
    );
  }

  late final _$cekSenetHareketleriListesiAtom = Atom(
    name: '_CekSenetHareketleriViewModelBase.cekSenetHareketleriListesi',
    context: context,
  );

  @override
  ObservableList<CekSenetHareketleriModel>? get cekSenetHareketleriListesi {
    _$cekSenetHareketleriListesiAtom.reportRead();
    return super.cekSenetHareketleriListesi;
  }

  @override
  set cekSenetHareketleriListesi(
    ObservableList<CekSenetHareketleriModel>? value,
  ) {
    _$cekSenetHareketleriListesiAtom.reportWrite(
      value,
      super.cekSenetHareketleriListesi,
      () {
        super.cekSenetHareketleriListesi = value;
      },
    );
  }

  late final _$getDataAsyncAction = AsyncAction(
    '_CekSenetHareketleriViewModelBase.getData',
    context: context,
  );

  @override
  Future<void> getData() {
    return _$getDataAsyncAction.run(() => super.getData());
  }

  late final _$_CekSenetHareketleriViewModelBaseActionController = ActionController(
    name: '_CekSenetHareketleriViewModelBase',
    context: context,
  );

  @override
  void setCekSenetListesiModel(CekSenetListesiModel model) {
    final _$actionInfo = _$_CekSenetHareketleriViewModelBaseActionController.startAction(
      name: '_CekSenetHareketleriViewModelBase.setCekSenetListesiModel',
    );
    try {
      return super.setCekSenetListesiModel(model);
    } finally {
      _$_CekSenetHareketleriViewModelBaseActionController.endAction(
        _$actionInfo,
      );
    }
  }

  @override
  void setCekSenetHareketleriListesi(List<CekSenetHareketleriModel> list) {
    final _$actionInfo = _$_CekSenetHareketleriViewModelBaseActionController.startAction(
      name: '_CekSenetHareketleriViewModelBase.setCekSenetHareketleriListesi',
    );
    try {
      return super.setCekSenetHareketleriListesi(list);
    } finally {
      _$_CekSenetHareketleriViewModelBaseActionController.endAction(
        _$actionInfo,
      );
    }
  }

  @override
  String toString() {
    return '''
cekSenetListesiModel: ${cekSenetListesiModel},
cekSenetHareketleriListesi: ${cekSenetHareketleriListesi}
    ''';
  }
}
