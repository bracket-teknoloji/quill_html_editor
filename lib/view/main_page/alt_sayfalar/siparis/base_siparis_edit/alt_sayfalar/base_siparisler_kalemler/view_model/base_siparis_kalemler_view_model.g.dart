// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_siparis_kalemler_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BaseSiparisKalemlerViewModel
    on _BaseSiparisKalemlerViewModelBase, Store {
  Computed<List<KalemModel>>? _$kalemListComputed;

  @override
  List<KalemModel> get kalemList =>
      (_$kalemListComputed ??= Computed<List<KalemModel>>(() => super.kalemList,
              name: '_BaseSiparisKalemlerViewModelBase.kalemList'))
          .value;

  late final _$_BaseSiparisKalemlerViewModelBaseActionController =
      ActionController(
          name: '_BaseSiparisKalemlerViewModelBase', context: context);

  @override
  void removeAtKalemList(int index) {
    final _$actionInfo =
        _$_BaseSiparisKalemlerViewModelBaseActionController.startAction(
            name: '_BaseSiparisKalemlerViewModelBase.removeAtKalemList');
    try {
      return super.removeAtKalemList(index);
    } finally {
      _$_BaseSiparisKalemlerViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
kalemList: ${kalemList}
    ''';
  }
}
