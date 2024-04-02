// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'olcum_belge_edit_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$OlcumBelgeEditViewModel on _OlcumBelgeEditViewModelBase, Store {
  Computed<OlcumBelgeModel?>? _$belgeModelComputed;

  @override
  OlcumBelgeModel? get belgeModel => (_$belgeModelComputed ??=
          Computed<OlcumBelgeModel?>(() => super.belgeModel,
              name: '_OlcumBelgeEditViewModelBase.belgeModel'))
      .value;

  late final _$requestModelAtom =
      Atom(name: '_OlcumBelgeEditViewModelBase.requestModel', context: context);

  @override
  OlcumGirisiListesiModel? get requestModel {
    _$requestModelAtom.reportRead();
    return super.requestModel;
  }

  @override
  set requestModel(OlcumGirisiListesiModel? value) {
    _$requestModelAtom.reportWrite(value, super.requestModel, () {
      super.requestModel = value;
    });
  }

  late final _$modelAtom =
      Atom(name: '_OlcumBelgeEditViewModelBase.model', context: context);

  @override
  OlcumBelgeEditModel? get model {
    _$modelAtom.reportRead();
    return super.model;
  }

  @override
  set model(OlcumBelgeEditModel? value) {
    _$modelAtom.reportWrite(value, super.model, () {
      super.model = value;
    });
  }

  late final _$getDataAsyncAction =
      AsyncAction('_OlcumBelgeEditViewModelBase.getData', context: context);

  @override
  Future<void> getData() {
    return _$getDataAsyncAction.run(() => super.getData());
  }

  late final _$_OlcumBelgeEditViewModelBaseActionController =
      ActionController(name: '_OlcumBelgeEditViewModelBase', context: context);

  @override
  void setRequestModel(OlcumGirisiListesiModel reqModel) {
    final _$actionInfo = _$_OlcumBelgeEditViewModelBaseActionController
        .startAction(name: '_OlcumBelgeEditViewModelBase.setRequestModel');
    try {
      return super.setRequestModel(reqModel);
    } finally {
      _$_OlcumBelgeEditViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
requestModel: ${requestModel},
model: ${model},
belgeModel: ${belgeModel}
    ''';
  }
}
