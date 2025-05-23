// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'belge_kontrol_kalem_edit_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BelgeKontrolKalemEditViewModel on _BelgeKontrolKalemEditViewModelBase, Store {
  late final _$requestModelAtom = Atom(name: '_BelgeKontrolKalemEditViewModelBase.requestModel', context: context);

  @override
  BelgeKontrolModel get requestModel {
    _$requestModelAtom.reportRead();
    return super.requestModel;
  }

  @override
  set requestModel(BelgeKontrolModel value) {
    _$requestModelAtom.reportWrite(value, super.requestModel, () {
      super.requestModel = value;
    });
  }

  late final _$saveKalemAsyncAction = AsyncAction('_BelgeKontrolKalemEditViewModelBase.saveKalem', context: context);

  @override
  Future<bool> saveKalem() {
    return _$saveKalemAsyncAction.run(() => super.saveKalem());
  }

  late final _$_BelgeKontrolKalemEditViewModelBaseActionController = ActionController(
    name: '_BelgeKontrolKalemEditViewModelBase',
    context: context,
  );

  @override
  void setRequestModel(BelgeKontrolKalemlerModel value) {
    final _$actionInfo = _$_BelgeKontrolKalemEditViewModelBaseActionController.startAction(
      name: '_BelgeKontrolKalemEditViewModelBase.setRequestModel',
    );
    try {
      return super.setRequestModel(value);
    } finally {
      _$_BelgeKontrolKalemEditViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setMiktar(double? value) {
    final _$actionInfo = _$_BelgeKontrolKalemEditViewModelBaseActionController.startAction(
      name: '_BelgeKontrolKalemEditViewModelBase.setMiktar',
    );
    try {
      return super.setMiktar(value);
    } finally {
      _$_BelgeKontrolKalemEditViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
requestModel: ${requestModel}
    ''';
  }
}
