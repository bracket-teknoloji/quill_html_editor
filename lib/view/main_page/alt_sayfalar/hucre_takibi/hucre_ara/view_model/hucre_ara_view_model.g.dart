// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hucre_ara_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HucreAraViewModel on _HucreAraViewModelBase, Store {
  late final _$stokListAtom = Atom(name: '_HucreAraViewModelBase.stokList', context: context);

  @override
  ObservableList<HucreTakibiStoklarModel>? get stokList {
    _$stokListAtom.reportRead();
    return super.stokList;
  }

  @override
  set stokList(ObservableList<HucreTakibiStoklarModel>? value) {
    _$stokListAtom.reportWrite(value, super.stokList, () {
      super.stokList = value;
    });
  }

  late final _$getDataAsyncAction = AsyncAction('_HucreAraViewModelBase.getData', context: context);

  @override
  Future<void> getData() {
    return _$getDataAsyncAction.run(() => super.getData());
  }

  late final _$_HucreAraViewModelBaseActionController = ActionController(
    name: '_HucreAraViewModelBase',
    context: context,
  );

  @override
  void setStokList(List<HucreTakibiStoklarModel>? list) {
    final _$actionInfo = _$_HucreAraViewModelBaseActionController.startAction(
      name: '_HucreAraViewModelBase.setStokList',
    );
    try {
      return super.setStokList(list);
    } finally {
      _$_HucreAraViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
stokList: ${stokList}
    ''';
  }
}
