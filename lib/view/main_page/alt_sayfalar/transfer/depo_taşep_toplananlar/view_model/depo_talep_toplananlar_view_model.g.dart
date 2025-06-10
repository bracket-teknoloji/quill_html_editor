// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'depo_talep_toplananlar_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DepoTalepToplananlarViewModel
    on _DepoTalepToplananlarViewModelBase, Store {
  late final _$kalemListAtom = Atom(
    name: '_DepoTalepToplananlarViewModelBase.kalemList',
    context: context,
  );

  @override
  ObservableList<KalemModel>? get kalemList {
    _$kalemListAtom.reportRead();
    return super.kalemList;
  }

  @override
  set kalemList(ObservableList<KalemModel>? value) {
    _$kalemListAtom.reportWrite(value, super.kalemList, () {
      super.kalemList = value;
    });
  }

  late final _$getKalemlerAsyncAction = AsyncAction(
    '_DepoTalepToplananlarViewModelBase.getKalemler',
    context: context,
  );

  @override
  Future<void> getKalemler(int id) {
    return _$getKalemlerAsyncAction.run(() => super.getKalemler(id));
  }

  late final _$deleteKalemAsyncAction = AsyncAction(
    '_DepoTalepToplananlarViewModelBase.deleteKalem',
    context: context,
  );

  @override
  Future<bool> deleteKalem(int id) {
    return _$deleteKalemAsyncAction.run(() => super.deleteKalem(id));
  }

  late final _$_DepoTalepToplananlarViewModelBaseActionController =
      ActionController(
        name: '_DepoTalepToplananlarViewModelBase',
        context: context,
      );

  @override
  void setKalemList(List<KalemModel>? value) {
    final _$actionInfo = _$_DepoTalepToplananlarViewModelBaseActionController
        .startAction(name: '_DepoTalepToplananlarViewModelBase.setKalemList');
    try {
      return super.setKalemList(value);
    } finally {
      _$_DepoTalepToplananlarViewModelBaseActionController.endAction(
        _$actionInfo,
      );
    }
  }

  @override
  String toString() {
    return '''
kalemList: ${kalemList}
    ''';
  }
}
