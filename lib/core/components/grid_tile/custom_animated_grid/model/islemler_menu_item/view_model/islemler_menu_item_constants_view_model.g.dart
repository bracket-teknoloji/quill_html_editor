// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'islemler_menu_item_constants_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$IslemlerMenuItemConstantsViewModel
    on _IslemlerMenuItemConstantsViewModelBase, Store {
  late final _$cariKodDegistirSwitchAtom = Atom(
    name: '_IslemlerMenuItemConstantsViewModelBase.cariKodDegistirSwitch',
    context: context,
  );

  @override
  bool get cariKodDegistirSwitch {
    _$cariKodDegistirSwitchAtom.reportRead();
    return super.cariKodDegistirSwitch;
  }

  @override
  set cariKodDegistirSwitch(bool value) {
    _$cariKodDegistirSwitchAtom.reportWrite(
      value,
      super.cariKodDegistirSwitch,
      () {
        super.cariKodDegistirSwitch = value;
      },
    );
  }

  late final _$_IslemlerMenuItemConstantsViewModelBaseActionController =
      ActionController(
        name: '_IslemlerMenuItemConstantsViewModelBase',
        context: context,
      );

  @override
  void changeCariKodDegistirSwitch(bool value) {
    final _$actionInfo =
        _$_IslemlerMenuItemConstantsViewModelBaseActionController.startAction(
          name:
              '_IslemlerMenuItemConstantsViewModelBase.changeCariKodDegistirSwitch',
        );
    try {
      return super.changeCariKodDegistirSwitch(value);
    } finally {
      _$_IslemlerMenuItemConstantsViewModelBaseActionController.endAction(
        _$actionInfo,
      );
    }
  }

  @override
  String toString() {
    return '''
cariKodDegistirSwitch: ${cariKodDegistirSwitch}
    ''';
  }
}
