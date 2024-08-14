// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_picker_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ImagePickerViewModel on _ImagePickerViewModelBase, Store {
  late final _$requestModelAtom =
      Atom(name: '_ImagePickerViewModelBase.requestModel', context: context);

  @override
  EvrakEditModel? get requestModel {
    _$requestModelAtom.reportRead();
    return super.requestModel;
  }

  @override
  set requestModel(EvrakEditModel? value) {
    _$requestModelAtom.reportWrite(value, super.requestModel, () {
      super.requestModel = value;
    });
  }

  late final _$isProcessingAtom =
      Atom(name: '_ImagePickerViewModelBase.isProcessing', context: context);

  @override
  bool get isProcessing {
    _$isProcessingAtom.reportRead();
    return super.isProcessing;
  }

  @override
  set isProcessing(bool value) {
    _$isProcessingAtom.reportWrite(value, super.isProcessing, () {
      super.isProcessing = value;
    });
  }

  late final _$imageAtom =
      Atom(name: '_ImagePickerViewModelBase.image', context: context);

  @override
  Uint8List? get image {
    _$imageAtom.reportRead();
    return super.image;
  }

  @override
  set image(Uint8List? value) {
    _$imageAtom.reportWrite(value, super.image, () {
      super.image = value;
    });
  }

  late final _$uploadEvrakAsyncAction =
      AsyncAction('_ImagePickerViewModelBase.uploadEvrak', context: context);

  @override
  Future<GenericResponseModel<EvraklarRequestModel>> uploadEvrak() {
    return _$uploadEvrakAsyncAction.run(() => super.uploadEvrak());
  }

  late final _$_ImagePickerViewModelBaseActionController =
      ActionController(name: '_ImagePickerViewModelBase', context: context);

  @override
  void setRequestModel(EvraklarRequestModel? model) {
    final _$actionInfo = _$_ImagePickerViewModelBaseActionController
        .startAction(name: '_ImagePickerViewModelBase.setRequestModel');
    try {
      return super.setRequestModel(model);
    } finally {
      _$_ImagePickerViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setImage(Uint8List? value) {
    final _$actionInfo = _$_ImagePickerViewModelBaseActionController
        .startAction(name: '_ImagePickerViewModelBase.setImage');
    try {
      return super.setImage(value);
    } finally {
      _$_ImagePickerViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIsProcessing(bool value) {
    final _$actionInfo = _$_ImagePickerViewModelBaseActionController
        .startAction(name: '_ImagePickerViewModelBase.setIsProcessing');
    try {
      return super.setIsProcessing(value);
    } finally {
      _$_ImagePickerViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setByteData(String? value) {
    final _$actionInfo = _$_ImagePickerViewModelBaseActionController
        .startAction(name: '_ImagePickerViewModelBase.setByteData');
    try {
      return super.setByteData(value);
    } finally {
      _$_ImagePickerViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setBoyutByte(int? value) {
    final _$actionInfo = _$_ImagePickerViewModelBaseActionController
        .startAction(name: '_ImagePickerViewModelBase.setBoyutByte');
    try {
      return super.setBoyutByte(value);
    } finally {
      _$_ImagePickerViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setAciklama(String? value) {
    final _$actionInfo = _$_ImagePickerViewModelBaseActionController
        .startAction(name: '_ImagePickerViewModelBase.setAciklama');
    try {
      return super.setAciklama(value);
    } finally {
      _$_ImagePickerViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
requestModel: ${requestModel},
isProcessing: ${isProcessing},
image: ${image}
    ''';
  }
}
