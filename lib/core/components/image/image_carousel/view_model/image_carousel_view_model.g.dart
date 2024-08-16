// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_carousel_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ImageCarouselViewModel on _ImageCarouselViewModelBase, Store {
  Computed<bool>? _$onlyOneItemComputed;

  @override
  bool get onlyOneItem =>
      (_$onlyOneItemComputed ??= Computed<bool>(() => super.onlyOneItem,
              name: '_ImageCarouselViewModelBase.onlyOneItem'))
          .value;

  late final _$observableListAtom = Atom(
      name: '_ImageCarouselViewModelBase.observableList', context: context);

  @override
  ObservableList<EvraklarModel>? get observableList {
    _$observableListAtom.reportRead();
    return super.observableList;
  }

  @override
  set observableList(ObservableList<EvraklarModel>? value) {
    _$observableListAtom.reportWrite(value, super.observableList, () {
      super.observableList = value;
    });
  }

  late final _$selectedImageAtom =
      Atom(name: '_ImageCarouselViewModelBase.selectedImage', context: context);

  @override
  String? get selectedImage {
    _$selectedImageAtom.reportRead();
    return super.selectedImage;
  }

  @override
  set selectedImage(String? value) {
    _$selectedImageAtom.reportWrite(value, super.selectedImage, () {
      super.selectedImage = value;
    });
  }

  late final _$requestModelAtom =
      Atom(name: '_ImageCarouselViewModelBase.requestModel', context: context);

  @override
  EvraklarRequestModel? get requestModel {
    _$requestModelAtom.reportRead();
    return super.requestModel;
  }

  @override
  set requestModel(EvraklarRequestModel? value) {
    _$requestModelAtom.reportWrite(value, super.requestModel, () {
      super.requestModel = value;
    });
  }

  late final _$_ImageCarouselViewModelBaseActionController =
      ActionController(name: '_ImageCarouselViewModelBase', context: context);

  @override
  void setObservableList(List<EvraklarModel>? list) {
    final _$actionInfo = _$_ImageCarouselViewModelBaseActionController
        .startAction(name: '_ImageCarouselViewModelBase.setObservableList');
    try {
      return super.setObservableList(list);
    } finally {
      _$_ImageCarouselViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSelectedImage(String? image) {
    final _$actionInfo = _$_ImageCarouselViewModelBaseActionController
        .startAction(name: '_ImageCarouselViewModelBase.setSelectedImage');
    try {
      return super.setSelectedImage(image);
    } finally {
      _$_ImageCarouselViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
observableList: ${observableList},
selectedImage: ${selectedImage},
requestModel: ${requestModel},
onlyOneItem: ${onlyOneItem}
    ''';
  }
}
