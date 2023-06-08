// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'yaslandirma_raporu_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$YaslandirmaRaporuViewModel on _YaslandirmaRaporuViewModelBase, Store {
  late final _$pdfModelAtom =
      Atom(name: '_YaslandirmaRaporuViewModelBase.pdfModel', context: context);

  @override
  PdfModel get pdfModel {
    _$pdfModelAtom.reportRead();
    return super.pdfModel;
  }

  @override
  set pdfModel(PdfModel value) {
    _$pdfModelAtom.reportWrite(value, super.pdfModel, () {
      super.pdfModel = value;
    });
  }

  late final _$_YaslandirmaRaporuViewModelBaseActionController =
      ActionController(
          name: '_YaslandirmaRaporuViewModelBase', context: context);

  @override
  void changeCariKodu(dynamic value) {
    final _$actionInfo = _$_YaslandirmaRaporuViewModelBaseActionController
        .startAction(name: '_YaslandirmaRaporuViewModelBase.changeCariKodu');
    try {
      return super.changeCariKodu(value);
    } finally {
      _$_YaslandirmaRaporuViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
pdfModel: ${pdfModel}
    ''';
  }
}
