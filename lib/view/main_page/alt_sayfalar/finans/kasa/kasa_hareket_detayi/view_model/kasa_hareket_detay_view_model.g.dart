// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kasa_hareket_detay_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$KasaHareketDetayViewModel on _KasaHareketDetayViewModelBase, Store {
  late final _$messageAtom = Atom(
    name: '_KasaHareketDetayViewModelBase.message',
    context: context,
  );

  @override
  String? get message {
    _$messageAtom.reportRead();
    return super.message;
  }

  @override
  set message(String? value) {
    _$messageAtom.reportWrite(value, super.message, () {
      super.message = value;
    });
  }

  late final _$kasaIslemleriRequestModelAtom = Atom(
    name: '_KasaHareketDetayViewModelBase.kasaIslemleriRequestModel',
    context: context,
  );

  @override
  KasaIslemleriRequestModel get kasaIslemleriRequestModel {
    _$kasaIslemleriRequestModelAtom.reportRead();
    return super.kasaIslemleriRequestModel;
  }

  bool _kasaIslemleriRequestModelIsInitialized = false;

  @override
  set kasaIslemleriRequestModel(KasaIslemleriRequestModel value) {
    _$kasaIslemleriRequestModelAtom.reportWrite(
      value,
      _kasaIslemleriRequestModelIsInitialized
          ? super.kasaIslemleriRequestModel
          : null,
      () {
        super.kasaIslemleriRequestModel = value;
        _kasaIslemleriRequestModelIsInitialized = true;
      },
    );
  }

  late final _$kasaIslemleriModelAtom = Atom(
    name: '_KasaHareketDetayViewModelBase.kasaIslemleriModel',
    context: context,
  );

  @override
  KasaIslemleriModel? get kasaIslemleriModel {
    _$kasaIslemleriModelAtom.reportRead();
    return super.kasaIslemleriModel;
  }

  @override
  set kasaIslemleriModel(KasaIslemleriModel? value) {
    _$kasaIslemleriModelAtom.reportWrite(value, super.kasaIslemleriModel, () {
      super.kasaIslemleriModel = value;
    });
  }

  late final _$getDataAsyncAction = AsyncAction(
    '_KasaHareketDetayViewModelBase.getData',
    context: context,
  );

  @override
  Future<void> getData() {
    return _$getDataAsyncAction.run(() => super.getData());
  }

  late final _$_KasaHareketDetayViewModelBaseActionController =
      ActionController(
        name: '_KasaHareketDetayViewModelBase',
        context: context,
      );

  @override
  void setKasaIslemleriModel(KasaIslemleriModel? value) {
    final _$actionInfo = _$_KasaHareketDetayViewModelBaseActionController
        .startAction(
          name: '_KasaHareketDetayViewModelBase.setKasaIslemleriModel',
        );
    try {
      return super.setKasaIslemleriModel(value);
    } finally {
      _$_KasaHareketDetayViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
message: ${message},
kasaIslemleriRequestModel: ${kasaIslemleriRequestModel},
kasaIslemleriModel: ${kasaIslemleriModel}
    ''';
  }
}
