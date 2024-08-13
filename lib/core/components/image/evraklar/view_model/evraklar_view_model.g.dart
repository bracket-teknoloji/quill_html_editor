// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'evraklar_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$EvraklarViewModel on _EvraklarViewModelBase, Store {
  late final _$observableListAtom =
      Atom(name: '_EvraklarViewModelBase.observableList', context: context);

  @override
  ObservableList<EvraklarModel>? get observableList {
    _$observableListAtom.reportRead();
    return super.observableList;
  }

  @override
  set observableList(ObservableList<EvraklarModel>? value) {
    _$observableListAtom.reportWrite(value, super.observableList, () {
      super.observableList = value;
    });
  }

  late final _$requestModelAtom =
      Atom(name: '_EvraklarViewModelBase.requestModel', context: context);

  @override
  EvraklarRequestModel? get requestModel {
    _$requestModelAtom.reportRead();
    return super.requestModel;
  }

  @override
  set requestModel(EvraklarRequestModel? value) {
    _$requestModelAtom.reportWrite(value, super.requestModel, () {
      super.requestModel = value;
    });
  }

  late final _$deleteEvrakAsyncAction =
      AsyncAction('_EvraklarViewModelBase.deleteEvrak', context: context);

  @override
  Future<GenericResponseModel<NetworkManagerMixin>> deleteEvrak(
      EvraklarModel model) {
    return _$deleteEvrakAsyncAction.run(() => super.deleteEvrak(model));
  }

  late final _$_EvraklarViewModelBaseActionController =
      ActionController(name: '_EvraklarViewModelBase', context: context);

  @override
  void setObservableList(List<EvraklarModel>? list) {
    final _$actionInfo = _$_EvraklarViewModelBaseActionController.startAction(
        name: '_EvraklarViewModelBase.setObservableList');
    try {
      return super.setObservableList(list);
    } finally {
      _$_EvraklarViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
observableList: ${observableList},
requestModel: ${requestModel}
    ''';
  }
}
