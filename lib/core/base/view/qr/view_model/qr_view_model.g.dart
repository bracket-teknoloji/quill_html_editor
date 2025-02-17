// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'qr_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$QRViewModel on _QRViewModelBase, Store {
  Computed<bool>? _$isValueEmptyComputed;

  @override
  bool get isValueEmpty =>
      (_$isValueEmptyComputed ??= Computed<bool>(() => super.isValueEmpty, name: '_QRViewModelBase.isValueEmpty'))
          .value;

  late final _$isFlashOpenAtom = Atom(name: '_QRViewModelBase.isFlashOpen', context: context);

  @override
  bool get isFlashOpen {
    _$isFlashOpenAtom.reportRead();
    return super.isFlashOpen;
  }

  @override
  set isFlashOpen(bool value) {
    _$isFlashOpenAtom.reportWrite(value, super.isFlashOpen, () {
      super.isFlashOpen = value;
    });
  }

  late final _$isCameraReverseAtom = Atom(name: '_QRViewModelBase.isCameraReverse', context: context);

  @override
  bool get isCameraReverse {
    _$isCameraReverseAtom.reportRead();
    return super.isCameraReverse;
  }

  @override
  set isCameraReverse(bool value) {
    _$isCameraReverseAtom.reportWrite(value, super.isCameraReverse, () {
      super.isCameraReverse = value;
    });
  }

  late final _$valueAtom = Atom(name: '_QRViewModelBase.value', context: context);

  @override
  String? get value {
    _$valueAtom.reportRead();
    return super.value;
  }

  @override
  set value(String? value) {
    _$valueAtom.reportWrite(value, super.value, () {
      super.value = value;
    });
  }

  late final _$_QRViewModelBaseActionController = ActionController(name: '_QRViewModelBase', context: context);

  @override
  void setValue(String? result) {
    final _$actionInfo = _$_QRViewModelBaseActionController.startAction(name: '_QRViewModelBase.setValue');
    try {
      return super.setValue(result);
    } finally {
      _$_QRViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeFlash() {
    final _$actionInfo = _$_QRViewModelBaseActionController.startAction(name: '_QRViewModelBase.changeFlash');
    try {
      return super.changeFlash();
    } finally {
      _$_QRViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeCameraReverse() {
    final _$actionInfo = _$_QRViewModelBaseActionController.startAction(name: '_QRViewModelBase.changeCameraReverse');
    try {
      return super.changeCameraReverse();
    } finally {
      _$_QRViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isFlashOpen: ${isFlashOpen},
isCameraReverse: ${isCameraReverse},
value: ${value},
isValueEmpty: ${isValueEmpty}
    ''';
  }
}
