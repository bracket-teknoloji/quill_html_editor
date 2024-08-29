// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hizli_tahsilat_kayitlari_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HizliTahsilatKayitlariViewModel
    on _HizliTahsilatKayitlariViewModelBase, Store {
  late final _$observableListAtom = Atom(
      name: '_HizliTahsilatKayitlariViewModelBase.observableList',
      context: context);

  @override
  ObservableList<BankaHareketleriModel>? get observableList {
    _$observableListAtom.reportRead();
    return super.observableList;
  }

  @override
  set observableList(ObservableList<BankaHareketleriModel>? value) {
    _$observableListAtom.reportWrite(value, super.observableList, () {
      super.observableList = value;
    });
  }

  late final _$_HizliTahsilatKayitlariViewModelBaseActionController =
      ActionController(
          name: '_HizliTahsilatKayitlariViewModelBase', context: context);

  @override
  void setObservableList(List<BankaHareketleriModel>? list) {
    final _$actionInfo =
        _$_HizliTahsilatKayitlariViewModelBaseActionController.startAction(
            name: '_HizliTahsilatKayitlariViewModelBase.setObservableList');
    try {
      return super.setObservableList(list);
    } finally {
      _$_HizliTahsilatKayitlariViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
observableList: ${observableList}
    ''';
  }
}
