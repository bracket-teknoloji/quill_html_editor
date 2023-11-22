// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dekont_edit_kalemler_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DekontEditKalemlerViewModel on _DekontEditKalemlerViewModelBase, Store {
  Computed<List<DekontKalemler>?>? _$kalemlerComputed;

  @override
  List<DekontKalemler>? get kalemler => (_$kalemlerComputed ??=
          Computed<List<DekontKalemler>?>(() => super.kalemler,
              name: '_DekontEditKalemlerViewModelBase.kalemler'))
      .value;
  Computed<double>? _$toplamBorcComputed;

  @override
  double get toplamBorc =>
      (_$toplamBorcComputed ??= Computed<double>(() => super.toplamBorc,
              name: '_DekontEditKalemlerViewModelBase.toplamBorc'))
          .value;
  Computed<double>? _$toplamAlacakComputed;

  @override
  double get toplamAlacak =>
      (_$toplamAlacakComputed ??= Computed<double>(() => super.toplamAlacak,
              name: '_DekontEditKalemlerViewModelBase.toplamAlacak'))
          .value;

  late final _$dekontIslemlerRequestModelAtom = Atom(
      name: '_DekontEditKalemlerViewModelBase.dekontIslemlerRequestModel',
      context: context);

  @override
  DekontIslemlerRequestModel get dekontIslemlerRequestModel {
    _$dekontIslemlerRequestModelAtom.reportRead();
    return super.dekontIslemlerRequestModel;
  }

  @override
  set dekontIslemlerRequestModel(DekontIslemlerRequestModel value) {
    _$dekontIslemlerRequestModelAtom
        .reportWrite(value, super.dekontIslemlerRequestModel, () {
      super.dekontIslemlerRequestModel = value;
    });
  }

  late final _$_DekontEditKalemlerViewModelBaseActionController =
      ActionController(
          name: '_DekontEditKalemlerViewModelBase', context: context);

  @override
  void setSingleton() {
    final _$actionInfo = _$_DekontEditKalemlerViewModelBaseActionController
        .startAction(name: '_DekontEditKalemlerViewModelBase.setSingleton');
    try {
      return super.setSingleton();
    } finally {
      _$_DekontEditKalemlerViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void addKalemler(DekontKalemler? model) {
    final _$actionInfo = _$_DekontEditKalemlerViewModelBaseActionController
        .startAction(name: '_DekontEditKalemlerViewModelBase.addKalemler');
    try {
      return super.addKalemler(model);
    } finally {
      _$_DekontEditKalemlerViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void updateKalemler(int index, DekontKalemler model) {
    final _$actionInfo = _$_DekontEditKalemlerViewModelBaseActionController
        .startAction(name: '_DekontEditKalemlerViewModelBase.updateKalemler');
    try {
      return super.updateKalemler(index, model);
    } finally {
      _$_DekontEditKalemlerViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void removeKalemler(int index) {
    final _$actionInfo = _$_DekontEditKalemlerViewModelBaseActionController
        .startAction(name: '_DekontEditKalemlerViewModelBase.removeKalemler');
    try {
      return super.removeKalemler(index);
    } finally {
      _$_DekontEditKalemlerViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
dekontIslemlerRequestModel: ${dekontIslemlerRequestModel},
kalemler: ${kalemler},
toplamBorc: ${toplamBorc},
toplamAlacak: ${toplamAlacak}
    ''';
  }
}
