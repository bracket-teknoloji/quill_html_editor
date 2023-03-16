// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_page_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MainPageViewModel on _MainPageViewModelBase, Store {
  late final _$isDrawerOpenAtom =
      Atom(name: '_MainPageViewModelBase.isDrawerOpen', context: context);

  @override
  bool get isDrawerOpen {
    _$isDrawerOpenAtom.reportRead();
    return super.isDrawerOpen;
  }

  @override
  set isDrawerOpen(bool value) {
    _$isDrawerOpenAtom.reportWrite(value, super.isDrawerOpen, () {
      super.isDrawerOpen = value;
    });
  }

  late final _$_MainPageViewModelBaseActionController =
      ActionController(name: '_MainPageViewModelBase', context: context);

  @override
  void changeDrawerState() {
    final _$actionInfo = _$_MainPageViewModelBaseActionController.startAction(
        name: '_MainPageViewModelBase.changeDrawerState');
    try {
      return super.changeDrawerState();
    } finally {
      _$_MainPageViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isDrawerOpen: ${isDrawerOpen}
    ''';
  }
}
