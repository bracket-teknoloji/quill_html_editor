// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payker_odeme_link_listesi_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PaykerOdemeLinkListesiViewModel
    on _PaykerOdemeLinkListesiViewModelBase, Store {
  late final _$observableListAtom = Atom(
    name: '_PaykerOdemeLinkListesiViewModelBase.observableList',
    context: context,
  );

  @override
  ObservableList<PaykerOdemeLinkListesiModel>? get observableList {
    _$observableListAtom.reportRead();
    return super.observableList;
  }

  @override
  set observableList(ObservableList<PaykerOdemeLinkListesiModel>? value) {
    _$observableListAtom.reportWrite(value, super.observableList, () {
      super.observableList = value;
    });
  }

  late final _$checkPermissionsAsyncAction = AsyncAction(
    '_PaykerOdemeLinkListesiViewModelBase.checkPermissions',
    context: context,
  );

  @override
  Future<ModuleInfoModel?> checkPermissions() {
    return _$checkPermissionsAsyncAction.run(() => super.checkPermissions());
  }

  late final _$_PaykerOdemeLinkListesiViewModelBaseActionController =
      ActionController(
        name: '_PaykerOdemeLinkListesiViewModelBase',
        context: context,
      );

  @override
  void setObservableList(List<PaykerOdemeLinkListesiModel>? list) {
    final _$actionInfo = _$_PaykerOdemeLinkListesiViewModelBaseActionController
        .startAction(
          name: '_PaykerOdemeLinkListesiViewModelBase.setObservableList',
        );
    try {
      return super.setObservableList(list);
    } finally {
      _$_PaykerOdemeLinkListesiViewModelBaseActionController.endAction(
        _$actionInfo,
      );
    }
  }

  @override
  String toString() {
    return '''
observableList: ${observableList}
    ''';
  }
}
