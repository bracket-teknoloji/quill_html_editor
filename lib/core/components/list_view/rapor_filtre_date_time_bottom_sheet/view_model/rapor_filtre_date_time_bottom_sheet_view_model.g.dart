// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rapor_filtre_date_time_bottom_sheet_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$RaporFiltreDateTimeBottomSheetViewModel on _RaporFiltreDateTimeBottomSheetViewModelBase, Store {
  Computed<int>? _$groupValueComputed;

  @override
  int get groupValue => (_$groupValueComputed ??= Computed<int>(() => super.groupValue, name: '_RaporFiltreDateTimeBottomSheetViewModelBase.groupValue')).value;

  late final _$selectedValueListAtom = Atom(name: '_RaporFiltreDateTimeBottomSheetViewModelBase.selectedValueList', context: context);

  @override
  ObservableList<bool> get selectedValueList {
    _$selectedValueListAtom.reportRead();
    return super.selectedValueList;
  }

  @override
  set selectedValueList(ObservableList<bool> value) {
    _$selectedValueListAtom.reportWrite(value, super.selectedValueList, () {
      super.selectedValueList = value;
    });
  }

  late final _$_RaporFiltreDateTimeBottomSheetViewModelBaseActionController = ActionController(name: '_RaporFiltreDateTimeBottomSheetViewModelBase', context: context);

  @override
  void changeGroupValue(int value) {
    final _$actionInfo = _$_RaporFiltreDateTimeBottomSheetViewModelBaseActionController.startAction(name: '_RaporFiltreDateTimeBottomSheetViewModelBase.changeGroupValue');
    try {
      return super.changeGroupValue(value);
    } finally {
      _$_RaporFiltreDateTimeBottomSheetViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetGroupValue() {
    final _$actionInfo = _$_RaporFiltreDateTimeBottomSheetViewModelBaseActionController.startAction(name: '_RaporFiltreDateTimeBottomSheetViewModelBase.resetGroupValue');
    try {
      return super.resetGroupValue();
    } finally {
      _$_RaporFiltreDateTimeBottomSheetViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeSelectedValue(int index) {
    final _$actionInfo = _$_RaporFiltreDateTimeBottomSheetViewModelBaseActionController.startAction(name: '_RaporFiltreDateTimeBottomSheetViewModelBase.changeSelectedValue');
    try {
      return super.changeSelectedValue(index);
    } finally {
      _$_RaporFiltreDateTimeBottomSheetViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selectedValueList: ${selectedValueList},
groupValue: ${groupValue}
    ''';
  }
}
