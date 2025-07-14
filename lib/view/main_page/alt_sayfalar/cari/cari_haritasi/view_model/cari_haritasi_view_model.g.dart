// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cari_haritasi_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CariHaritasiViewModel on _CariHaritasiViewModelBase, Store {
  late final _$cariListAtom = Atom(
    name: '_CariHaritasiViewModelBase.cariList',
    context: context,
  );

  @override
  ObservableList<CariListesiModel>? get cariList {
    _$cariListAtom.reportRead();
    return super.cariList;
  }

  @override
  set cariList(ObservableList<CariListesiModel>? value) {
    _$cariListAtom.reportWrite(value, super.cariList, () {
      super.cariList = value;
    });
  }

  late final _$isLocationEnabledAtom = Atom(
    name: '_CariHaritasiViewModelBase.isLocationEnabled',
    context: context,
  );

  @override
  bool get isLocationEnabled {
    _$isLocationEnabledAtom.reportRead();
    return super.isLocationEnabled;
  }

  @override
  set isLocationEnabled(bool value) {
    _$isLocationEnabledAtom.reportWrite(value, super.isLocationEnabled, () {
      super.isLocationEnabled = value;
    });
  }

  late final _$currentPositionAtom = Atom(
    name: '_CariHaritasiViewModelBase.currentPosition',
    context: context,
  );

  @override
  LatLng? get currentPosition {
    _$currentPositionAtom.reportRead();
    return super.currentPosition;
  }

  @override
  set currentPosition(LatLng? value) {
    _$currentPositionAtom.reportWrite(value, super.currentPosition, () {
      super.currentPosition = value;
    });
  }

  late final _$markerIconAtom = Atom(
    name: '_CariHaritasiViewModelBase.markerIcon',
    context: context,
  );

  @override
  BitmapDescriptor get markerIcon {
    _$markerIconAtom.reportRead();
    return super.markerIcon;
  }

  @override
  set markerIcon(BitmapDescriptor value) {
    _$markerIconAtom.reportWrite(value, super.markerIcon, () {
      super.markerIcon = value;
    });
  }

  late final _$markerSetAtom = Atom(
    name: '_CariHaritasiViewModelBase.markerSet',
    context: context,
  );

  @override
  ObservableSet<Marker> get markerSet {
    _$markerSetAtom.reportRead();
    return super.markerSet;
  }

  @override
  set markerSet(ObservableSet<Marker> value) {
    _$markerSetAtom.reportWrite(value, super.markerSet, () {
      super.markerSet = value;
    });
  }

  late final _$requestModelAtom = Atom(
    name: '_CariHaritasiViewModelBase.requestModel',
    context: context,
  );

  @override
  CariListesiRequestModel get requestModel {
    _$requestModelAtom.reportRead();
    return super.requestModel;
  }

  @override
  set requestModel(CariListesiRequestModel value) {
    _$requestModelAtom.reportWrite(value, super.requestModel, () {
      super.requestModel = value;
    });
  }

  late final _$getDataAsyncAction = AsyncAction(
    '_CariHaritasiViewModelBase.getData',
    context: context,
  );

  @override
  Future<void> getData() {
    return _$getDataAsyncAction.run(() => super.getData());
  }

  late final _$_CariHaritasiViewModelBaseActionController = ActionController(
    name: '_CariHaritasiViewModelBase',
    context: context,
  );

  @override
  void setIsLocationEnabled(bool? value) {
    final _$actionInfo = _$_CariHaritasiViewModelBaseActionController.startAction(
      name: '_CariHaritasiViewModelBase.setIsLocationEnabled',
    );
    try {
      return super.setIsLocationEnabled(value);
    } finally {
      _$_CariHaritasiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCurrentPosition(LatLng? position) {
    final _$actionInfo = _$_CariHaritasiViewModelBaseActionController.startAction(
      name: '_CariHaritasiViewModelBase.setCurrentPosition',
    );
    try {
      return super.setCurrentPosition(position);
    } finally {
      _$_CariHaritasiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addMarker(Marker marker) {
    final _$actionInfo = _$_CariHaritasiViewModelBaseActionController.startAction(
      name: '_CariHaritasiViewModelBase.addMarker',
    );
    try {
      return super.addMarker(marker);
    } finally {
      _$_CariHaritasiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCariList(List<CariListesiModel>? list) {
    final _$actionInfo = _$_CariHaritasiViewModelBaseActionController.startAction(
      name: '_CariHaritasiViewModelBase.setCariList',
    );
    try {
      return super.setCariList(list);
    } finally {
      _$_CariHaritasiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
cariList: ${cariList},
isLocationEnabled: ${isLocationEnabled},
currentPosition: ${currentPosition},
markerIcon: ${markerIcon},
markerSet: ${markerSet},
requestModel: ${requestModel}
    ''';
  }
}
