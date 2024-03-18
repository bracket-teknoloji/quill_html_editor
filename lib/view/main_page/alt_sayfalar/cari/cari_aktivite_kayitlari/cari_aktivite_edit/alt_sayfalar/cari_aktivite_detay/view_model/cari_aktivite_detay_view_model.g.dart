// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cari_aktivite_detay_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CariAktiviteDetayViewModel on _CariAktiviteDetayViewModelBase, Store {
  late final _$aktiviteListAtom = Atom(
      name: '_CariAktiviteDetayViewModelBase.aktiviteList', context: context);

  @override
  ObservableList<CariAktiviteListesiModel> get aktiviteList {
    _$aktiviteListAtom.reportRead();
    return super.aktiviteList;
  }

  @override
  set aktiviteList(ObservableList<CariAktiviteListesiModel> value) {
    _$aktiviteListAtom.reportWrite(value, super.aktiviteList, () {
      super.aktiviteList = value;
    });
  }

  @override
  String toString() {
    return '''
aktiviteList: ${aktiviteList}
    ''';
  }
}
