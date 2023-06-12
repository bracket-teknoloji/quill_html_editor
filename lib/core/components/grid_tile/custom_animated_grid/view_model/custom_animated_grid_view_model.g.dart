// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'custom_animated_grid_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CustomAnimatedGridViewModel on _CustomAnimatedGridViewModelBase, Store {
  late final _$gridItemsAtom = Atom(
      name: '_CustomAnimatedGridViewModelBase.gridItems', context: context);

  @override
  ObservableList<GridItems>? get gridItems {
    _$gridItemsAtom.reportRead();
    return super.gridItems;
  }

  @override
  set gridItems(ObservableList<GridItems>? value) {
    _$gridItemsAtom.reportWrite(value, super.gridItems, () {
      super.gridItems = value;
    });
  }

  late final _$_CustomAnimatedGridViewModelBaseActionController =
      ActionController(
          name: '_CustomAnimatedGridViewModelBase', context: context);

  @override
  void setGridItems(List<GridItems>? value) {
    final _$actionInfo = _$_CustomAnimatedGridViewModelBaseActionController
        .startAction(name: '_CustomAnimatedGridViewModelBase.setGridItems');
    try {
      return super.setGridItems(value);
    } finally {
      _$_CustomAnimatedGridViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
gridItems: ${gridItems}
    ''';
  }
}
