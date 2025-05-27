// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cari_aktivite_edit_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CariAktiviteEditViewModel on _CariAktiviteEditViewModelBase, Store {
  late final _$baseEditEnumAtom = Atom(
      name: '_CariAktiviteEditViewModelBase.baseEditEnum', context: context);

  @override
  BaseEditEnum? get baseEditEnum {
    _$baseEditEnumAtom.reportRead();
    return super.baseEditEnum;
  }

  @override
  set baseEditEnum(BaseEditEnum? value) {
    _$baseEditEnumAtom.reportWrite(value, super.baseEditEnum, () {
      super.baseEditEnum = value;
    });
  }

  late final _$saveCariAktiviteAsyncAction = AsyncAction(
      '_CariAktiviteEditViewModelBase.saveCariAktivite',
      context: context);

  @override
  Future<GenericResponseModel<CariAktiviteListesiModel>> saveCariAktivite() {
    return _$saveCariAktiviteAsyncAction.run(() => super.saveCariAktivite());
  }

  @override
  String toString() {
    return '''
baseEditEnum: ${baseEditEnum}
    ''';
  }
}
