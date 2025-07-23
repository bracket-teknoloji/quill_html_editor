// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'custom_animated_grid_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CustomAnimatedGridViewModel on _CustomAnimatedGridViewModelBase, Store {
  late final _$gridItemModelListAtom = Atom(
    name: '_CustomAnimatedGridViewModelBase.gridItemModelList',
    context: context,
  );

  @override
  ObservableList<GridItemModel> get gridItemModelList {
    _$gridItemModelListAtom.reportRead();
    return super.gridItemModelList;
  }

  @override
  set gridItemModelList(ObservableList<GridItemModel> value) {
    _$gridItemModelListAtom.reportWrite(value, super.gridItemModelList, () {
      super.gridItemModelList = value;
    });
  }

  late final _$returnGridItemModelAtom = Atom(
    name: '_CustomAnimatedGridViewModelBase.returnGridItemModel',
    context: context,
  );

  @override
  ObservableList<ObservableList<GridItemModel>> get returnGridItemModel {
    _$returnGridItemModelAtom.reportRead();
    return super.returnGridItemModel;
  }

  @override
  set returnGridItemModel(ObservableList<ObservableList<GridItemModel>> value) {
    _$returnGridItemModelAtom.reportWrite(value, super.returnGridItemModel, () {
      super.returnGridItemModel = value;
    });
  }

  late final _$_CustomAnimatedGridViewModelBaseActionController =
      ActionController(
        name: '_CustomAnimatedGridViewModelBase',
        context: context,
      );

  @override
  void setGridItemModel(List<GridItemModel> value) {
    final _$actionInfo = _$_CustomAnimatedGridViewModelBaseActionController
        .startAction(name: '_CustomAnimatedGridViewModelBase.setGridItemModel');
    try {
      return super.setGridItemModel(value);
    } finally {
      _$_CustomAnimatedGridViewModelBaseActionController.endAction(
        _$actionInfo,
      );
    }
  }

  @override
  void addReturnGridItemModel(List<GridItemModel>? value) {
    final _$actionInfo = _$_CustomAnimatedGridViewModelBaseActionController
        .startAction(
          name: '_CustomAnimatedGridViewModelBase.addReturnGridItemModel',
        );
    try {
      return super.addReturnGridItemModel(value);
    } finally {
      _$_CustomAnimatedGridViewModelBaseActionController.endAction(
        _$actionInfo,
      );
    }
  }

  @override
  void deleteLastReturnGridItemModel() {
    final _$actionInfo = _$_CustomAnimatedGridViewModelBaseActionController
        .startAction(
          name:
              '_CustomAnimatedGridViewModelBase.deleteLastReturnGridItemModel',
        );
    try {
      return super.deleteLastReturnGridItemModel();
    } finally {
      _$_CustomAnimatedGridViewModelBaseActionController.endAction(
        _$actionInfo,
      );
    }
  }

  @override
  String toString() {
    return '''
gridItemModelList: ${gridItemModelList},
returnGridItemModel: ${returnGridItemModel}
    ''';
  }
}
