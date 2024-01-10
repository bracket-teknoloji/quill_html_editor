// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_stok_edit_seriler_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BaseStokEditSerilerViewModel on _BaseStokEditSerilerViewModelBase, Store {
  late final _$switchValueListAtom = Atom(name: '_BaseStokEditSerilerViewModelBase.switchValueList', context: context);

  @override
  ObservableList<bool> get switchValueList {
    _$switchValueListAtom.reportRead();
    return super.switchValueList;
  }

  @override
  set switchValueList(ObservableList<bool> value) {
    _$switchValueListAtom.reportWrite(value, super.switchValueList, () {
      super.switchValueList = value;
    });
  }

  late final _$_BaseStokEditSerilerViewModelBaseActionController = ActionController(name: '_BaseStokEditSerilerViewModelBase', context: context);

  @override
  void changeSwitchValue(int index) {
    final _$actionInfo = _$_BaseStokEditSerilerViewModelBaseActionController.startAction(name: '_BaseStokEditSerilerViewModelBase.changeSwitchValue');
    try {
      return super.changeSwitchValue(index);
    } finally {
      _$_BaseStokEditSerilerViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
switchValueList: ${switchValueList}
    ''';
  }
}
