// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transfer_mal_talebi_edit_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TransferMalTalebiEditViewModel
    on _TransferMalTalebiEditViewModelBase, Store {
  late final _$modelAtom =
      Atom(name: '_TransferMalTalebiEditViewModelBase.model', context: context);

  @override
  BaseSiparisEditModel? get model {
    _$modelAtom.reportRead();
    return super.model;
  }

  @override
  set model(BaseSiparisEditModel? value) {
    _$modelAtom.reportWrite(value, super.model, () {
      super.model = value;
    });
  }

  late final _$_TransferMalTalebiEditViewModelBaseActionController =
      ActionController(
          name: '_TransferMalTalebiEditViewModelBase', context: context);

  @override
  void setModel(BaseSiparisEditModel value) {
    final _$actionInfo = _$_TransferMalTalebiEditViewModelBaseActionController
        .startAction(name: '_TransferMalTalebiEditViewModelBase.setModel');
    try {
      return super.setModel(value);
    } finally {
      _$_TransferMalTalebiEditViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
model: ${model}
    ''';
  }
}
