// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'belge_kontrol_edit_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BelgeKontrolEditViewModel on _BelgeKontrolEditViewModelBase, Store {
  late final _$belgeKontrolModelAtom = Atom(
      name: '_BelgeKontrolEditViewModelBase.belgeKontrolModel',
      context: context);

  @override
  BelgeKontrolModel get belgeKontrolModel {
    _$belgeKontrolModelAtom.reportRead();
    return super.belgeKontrolModel;
  }

  @override
  set belgeKontrolModel(BelgeKontrolModel value) {
    _$belgeKontrolModelAtom.reportWrite(value, super.belgeKontrolModel, () {
      super.belgeKontrolModel = value;
    });
  }

  late final _$saveDataAsyncAction =
      AsyncAction('_BelgeKontrolEditViewModelBase.saveData', context: context);

  @override
  Future<bool> saveData() {
    return _$saveDataAsyncAction.run(() => super.saveData());
  }

  late final _$_BelgeKontrolEditViewModelBaseActionController =
      ActionController(
          name: '_BelgeKontrolEditViewModelBase', context: context);

  @override
  void setBelgeTuru(String value) {
    final _$actionInfo = _$_BelgeKontrolEditViewModelBaseActionController
        .startAction(name: '_BelgeKontrolEditViewModelBase.setBelgeTuru');
    try {
      return super.setBelgeTuru(value);
    } finally {
      _$_BelgeKontrolEditViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setBelge(BaseSiparisEditModel value) {
    final _$actionInfo = _$_BelgeKontrolEditViewModelBaseActionController
        .startAction(name: '_BelgeKontrolEditViewModelBase.setBelge');
    try {
      return super.setBelge(value);
    } finally {
      _$_BelgeKontrolEditViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
belgeKontrolModel: ${belgeKontrolModel}
    ''';
  }
}
