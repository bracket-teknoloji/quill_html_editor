// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'toggle_button_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ToggleButtonViewModel on _ToggleButtonViewModelBase, Store {
  late final _$isSelectedAtom = Atom(name: '_ToggleButtonViewModelBase.isSelected', context: context);

  @override
  ObservableList<bool> get isSelected {
    _$isSelectedAtom.reportRead();
    return super.isSelected;
  }

  @override
  set isSelected(ObservableList<bool> value) {
    _$isSelectedAtom.reportWrite(value, super.isSelected, () {
      super.isSelected = value;
    });
  }

  late final _$_ToggleButtonViewModelBaseActionController = ActionController(
    name: '_ToggleButtonViewModelBase',
    context: context,
  );

  @override
  void initializeIsSelected() {
    final _$actionInfo = _$_ToggleButtonViewModelBaseActionController.startAction(
      name: '_ToggleButtonViewModelBase.initializeIsSelected',
    );
    try {
      return super.initializeIsSelected();
    } finally {
      _$_ToggleButtonViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeIsSelected(int index) {
    final _$actionInfo = _$_ToggleButtonViewModelBaseActionController.startAction(
      name: '_ToggleButtonViewModelBase.changeIsSelected',
    );
    try {
      return super.changeIsSelected(index);
    } finally {
      _$_ToggleButtonViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetSelectedList() {
    final _$actionInfo = _$_ToggleButtonViewModelBaseActionController.startAction(
      name: '_ToggleButtonViewModelBase.resetSelectedList',
    );
    try {
      return super.resetSelectedList();
    } finally {
      _$_ToggleButtonViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isSelected: ${isSelected}
    ''';
  }
}
