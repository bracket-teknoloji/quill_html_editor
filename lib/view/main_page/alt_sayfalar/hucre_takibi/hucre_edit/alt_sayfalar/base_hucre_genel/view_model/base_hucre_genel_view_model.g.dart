// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_hucre_genel_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BaseHucreGenelViewModel on _BaseHucreGenelViewModelBase, Store {
  late final _$selectedEditTipiAtom = Atom(
      name: '_BaseHucreGenelViewModelBase.selectedEditTipi', context: context);

  @override
  EditTipiEnum? get selectedEditTipi {
    _$selectedEditTipiAtom.reportRead();
    return super.selectedEditTipi;
  }

  @override
  set selectedEditTipi(EditTipiEnum? value) {
    _$selectedEditTipiAtom.reportWrite(value, super.selectedEditTipi, () {
      super.selectedEditTipi = value;
    });
  }

  late final _$_BaseHucreGenelViewModelBaseActionController =
      ActionController(name: '_BaseHucreGenelViewModelBase', context: context);

  @override
  void setSelectedEditTipi(int? index) {
    final _$actionInfo = _$_BaseHucreGenelViewModelBaseActionController
        .startAction(name: '_BaseHucreGenelViewModelBase.setSelectedEditTipi');
    try {
      return super.setSelectedEditTipi(index);
    } finally {
      _$_BaseHucreGenelViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selectedEditTipi: ${selectedEditTipi}
    ''';
  }
}
