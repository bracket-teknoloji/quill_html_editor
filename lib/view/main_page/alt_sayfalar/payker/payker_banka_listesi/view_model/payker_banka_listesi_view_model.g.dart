// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payker_banka_listesi_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PaykerBankaListesiViewModel on _PaykerBankaListesiViewModelBase, Store {
  late final _$observableListAtom = Atom(
    name: '_PaykerBankaListesiViewModelBase.observableList',
    context: context,
  );

  @override
  ObservableList<PaykerFirmaModel>? get observableList {
    _$observableListAtom.reportRead();
    return super.observableList;
  }

  @override
  set observableList(ObservableList<PaykerFirmaModel>? value) {
    _$observableListAtom.reportWrite(value, super.observableList, () {
      super.observableList = value;
    });
  }

  late final _$getDataAsyncAction = AsyncAction(
    '_PaykerBankaListesiViewModelBase.getData',
    context: context,
  );

  @override
  Future<void> getData() {
    return _$getDataAsyncAction.run(() => super.getData());
  }

  late final _$_PaykerBankaListesiViewModelBaseActionController =
      ActionController(
        name: '_PaykerBankaListesiViewModelBase',
        context: context,
      );

  @override
  void setObservableList(List<PaykerFirmaModel>? value) {
    final _$actionInfo = _$_PaykerBankaListesiViewModelBaseActionController
        .startAction(
          name: '_PaykerBankaListesiViewModelBase.setObservableList',
        );
    try {
      return super.setObservableList(value);
    } finally {
      _$_PaykerBankaListesiViewModelBaseActionController.endAction(
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
