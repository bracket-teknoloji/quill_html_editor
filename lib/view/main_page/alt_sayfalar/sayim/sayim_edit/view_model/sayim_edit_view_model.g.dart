// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sayim_edit_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SayimEditViewModel on _SayimEditViewModelBase, Store {
  Computed<bool>? _$indexSifirMiComputed;

  @override
  bool get indexSifirMi =>
      (_$indexSifirMiComputed ??= Computed<bool>(() => super.indexSifirMi,
              name: '_SayimEditViewModelBase.indexSifirMi'))
          .value;

  late final _$tabIndexAtom =
      Atom(name: '_SayimEditViewModelBase.tabIndex', context: context);

  @override
  int get tabIndex {
    _$tabIndexAtom.reportRead();
    return super.tabIndex;
  }

  @override
  set tabIndex(int value) {
    _$tabIndexAtom.reportWrite(value, super.tabIndex, () {
      super.tabIndex = value;
    });
  }

  late final _$faturaRequestModelAtom = Atom(
      name: '_SayimEditViewModelBase.faturaRequestModel', context: context);

  @override
  SiparislerRequestModel get faturaRequestModel {
    _$faturaRequestModelAtom.reportRead();
    return super.faturaRequestModel;
  }

  @override
  set faturaRequestModel(SiparislerRequestModel value) {
    _$faturaRequestModelAtom.reportWrite(value, super.faturaRequestModel, () {
      super.faturaRequestModel = value;
    });
  }

  late final _$sendDataAsyncAction =
      AsyncAction('_SayimEditViewModelBase.sendData', context: context);

  @override
  Future<GenericResponseModel<NetworkManagerMixin>> sendData(int depoKodu) {
    return _$sendDataAsyncAction.run(() => super.sendData(depoKodu));
  }

  late final _$sayimiBitirAsyncAction =
      AsyncAction('_SayimEditViewModelBase.sayimiBitir', context: context);

  @override
  Future<bool> sayimiBitir() {
    return _$sayimiBitirAsyncAction.run(() => super.sayimiBitir());
  }

  late final _$_SayimEditViewModelBaseActionController =
      ActionController(name: '_SayimEditViewModelBase', context: context);

  @override
  void setTabIndex(int value) {
    final _$actionInfo = _$_SayimEditViewModelBaseActionController.startAction(
        name: '_SayimEditViewModelBase.setTabIndex');
    try {
      return super.setTabIndex(value);
    } finally {
      _$_SayimEditViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
tabIndex: ${tabIndex},
faturaRequestModel: ${faturaRequestModel},
indexSifirMi: ${indexSifirMi}
    ''';
  }
}
