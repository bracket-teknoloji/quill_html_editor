// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kullanici_haritasi_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$KullaniciHaritasiViewModel on _KullaniciHaritasiViewModelBase, Store {
  late final _$kullaniciHaritasiListAtom = Atom(
    name: '_KullaniciHaritasiViewModelBase.kullaniciHaritasiList',
    context: context,
  );

  @override
  ObservableList<KullaniciHaritasiModel>? get kullaniciHaritasiList {
    _$kullaniciHaritasiListAtom.reportRead();
    return super.kullaniciHaritasiList;
  }

  @override
  set kullaniciHaritasiList(ObservableList<KullaniciHaritasiModel>? value) {
    _$kullaniciHaritasiListAtom.reportWrite(
      value,
      super.kullaniciHaritasiList,
      () {
        super.kullaniciHaritasiList = value;
      },
    );
  }

  late final _$markerSetAtom = Atom(
    name: '_KullaniciHaritasiViewModelBase.markerSet',
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

  late final _$getDataAsyncAction = AsyncAction(
    '_KullaniciHaritasiViewModelBase.getData',
    context: context,
  );

  @override
  Future<void> getData() {
    return _$getDataAsyncAction.run(() => super.getData());
  }

  late final _$_KullaniciHaritasiViewModelBaseActionController =
      ActionController(
        name: '_KullaniciHaritasiViewModelBase',
        context: context,
      );

  @override
  void addMarker(Marker marker) {
    final _$actionInfo = _$_KullaniciHaritasiViewModelBaseActionController
        .startAction(name: '_KullaniciHaritasiViewModelBase.addMarker');
    try {
      return super.addMarker(marker);
    } finally {
      _$_KullaniciHaritasiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setKullaniciHaritasiList(List<KullaniciHaritasiModel> value) {
    final _$actionInfo = _$_KullaniciHaritasiViewModelBaseActionController
        .startAction(
          name: '_KullaniciHaritasiViewModelBase.setKullaniciHaritasiList',
        );
    try {
      return super.setKullaniciHaritasiList(value);
    } finally {
      _$_KullaniciHaritasiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
kullaniciHaritasiList: ${kullaniciHaritasiList},
markerSet: ${markerSet}
    ''';
  }
}
