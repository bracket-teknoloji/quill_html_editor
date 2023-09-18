// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checkbox_tile_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CheckBoxTileViewModel on _CheckBoxTileViewModelBase, Store {
  late final _$valueListAtom =
      Atom(name: '_CheckBoxTileViewModelBase.valueList', context: context);

  @override
  List<bool>? get valueList {
    _$valueListAtom.reportRead();
    return super.valueList;
  }

  @override
  set valueList(List<bool>? value) {
    _$valueListAtom.reportWrite(value, super.valueList, () {
      super.valueList = value;
    });
  }

  late final _$_CheckBoxTileViewModelBaseActionController =
      ActionController(name: '_CheckBoxTileViewModelBase', context: context);

  @override
  void changeValueList(List<bool> value) {
    final _$actionInfo = _$_CheckBoxTileViewModelBaseActionController
        .startAction(name: '_CheckBoxTileViewModelBase.changeValueList');
    try {
      return super.changeValueList(value);
    } finally {
      _$_CheckBoxTileViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
valueList: ${valueList}
    ''';
  }
}
