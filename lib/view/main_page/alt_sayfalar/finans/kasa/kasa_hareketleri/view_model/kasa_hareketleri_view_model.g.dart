// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kasa_hareketleri_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$KasaHareketleriViewModel on _KasaHareketleriViewModelBase, Store {
  Computed<double>? _$bakiyeComputed;

  @override
  double get bakiye => (_$bakiyeComputed ??= Computed<double>(
    () => super.bakiye,
    name: '_KasaHareketleriViewModelBase.bakiye',
  )).value;

  late final _$kasaIslemleriRequestModelAtom = Atom(
    name: '_KasaHareketleriViewModelBase.kasaIslemleriRequestModel',
    context: context,
  );

  @override
  KasaIslemleriRequestModel get kasaIslemleriRequestModel {
    _$kasaIslemleriRequestModelAtom.reportRead();
    return super.kasaIslemleriRequestModel;
  }

  @override
  set kasaIslemleriRequestModel(KasaIslemleriRequestModel value) {
    _$kasaIslemleriRequestModelAtom.reportWrite(
      value,
      super.kasaIslemleriRequestModel,
      () {
        super.kasaIslemleriRequestModel = value;
      },
    );
  }

  late final _$paramDataAtom = Atom(
    name: '_KasaHareketleriViewModelBase.paramData',
    context: context,
  );

  @override
  ObservableMap<String, dynamic>? get paramData {
    _$paramDataAtom.reportRead();
    return super.paramData;
  }

  @override
  set paramData(ObservableMap<String, dynamic>? value) {
    _$paramDataAtom.reportWrite(value, super.paramData, () {
      super.paramData = value;
    });
  }

  late final _$isScrollDownAtom = Atom(
    name: '_KasaHareketleriViewModelBase.isScrollDown',
    context: context,
  );

  @override
  bool get isScrollDown {
    _$isScrollDownAtom.reportRead();
    return super.isScrollDown;
  }

  @override
  set isScrollDown(bool value) {
    _$isScrollDownAtom.reportWrite(value, super.isScrollDown, () {
      super.isScrollDown = value;
    });
  }

  late final _$observableListAtom = Atom(
    name: '_KasaHareketleriViewModelBase.observableList',
    context: context,
  );

  @override
  ObservableList<KasaIslemleriModel>? get observableList {
    _$observableListAtom.reportRead();
    return super.observableList;
  }

  @override
  set observableList(ObservableList<KasaIslemleriModel>? value) {
    _$observableListAtom.reportWrite(value, super.observableList, () {
      super.observableList = value;
    });
  }

  late final _$dovizAdiAtom = Atom(
    name: '_KasaHareketleriViewModelBase.dovizAdi',
    context: context,
  );

  @override
  String? get dovizAdi {
    _$dovizAdiAtom.reportRead();
    return super.dovizAdi;
  }

  @override
  set dovizAdi(String? value) {
    _$dovizAdiAtom.reportWrite(value, super.dovizAdi, () {
      super.dovizAdi = value;
    });
  }

  late final _$resetListAsyncAction = AsyncAction(
    '_KasaHareketleriViewModelBase.resetList',
    context: context,
  );

  @override
  Future<void> resetList() {
    return _$resetListAsyncAction.run(() => super.resetList());
  }

  late final _$changeScrollStatusAsyncAction = AsyncAction(
    '_KasaHareketleriViewModelBase.changeScrollStatus',
    context: context,
  );

  @override
  Future<void> changeScrollStatus(ScrollPosition position) {
    return _$changeScrollStatusAsyncAction.run(
      () => super.changeScrollStatus(position),
    );
  }

  late final _$deleteDataAsyncAction = AsyncAction(
    '_KasaHareketleriViewModelBase.deleteData',
    context: context,
  );

  @override
  Future<GenericResponseModel<KasaIslemleriModel>> deleteData(int? inckeyNo) {
    return _$deleteDataAsyncAction.run(() => super.deleteData(inckeyNo));
  }

  late final _$getDataAsyncAction = AsyncAction(
    '_KasaHareketleriViewModelBase.getData',
    context: context,
  );

  @override
  Future<void> getData() {
    return _$getDataAsyncAction.run(() => super.getData());
  }

  late final _$_KasaHareketleriViewModelBaseActionController = ActionController(
    name: '_KasaHareketleriViewModelBase',
    context: context,
  );

  @override
  void setDovizAdi(String? value) {
    final _$actionInfo = _$_KasaHareketleriViewModelBaseActionController.startAction(
      name: '_KasaHareketleriViewModelBase.setDovizAdi',
    );
    try {
      return super.setDovizAdi(value);
    } finally {
      _$_KasaHareketleriViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIsScrollDown(bool value) {
    final _$actionInfo = _$_KasaHareketleriViewModelBaseActionController.startAction(
      name: '_KasaHareketleriViewModelBase.setIsScrollDown',
    );
    try {
      return super.setIsScrollDown(value);
    } finally {
      _$_KasaHareketleriViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void incrementSayfa() {
    final _$actionInfo = _$_KasaHareketleriViewModelBaseActionController.startAction(
      name: '_KasaHareketleriViewModelBase.incrementSayfa',
    );
    try {
      return super.incrementSayfa();
    } finally {
      _$_KasaHareketleriViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setKasaKodu(String? value) {
    final _$actionInfo = _$_KasaHareketleriViewModelBaseActionController.startAction(
      name: '_KasaHareketleriViewModelBase.setKasaKodu',
    );
    try {
      return super.setKasaKodu(value);
    } finally {
      _$_KasaHareketleriViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setObservableList(List<KasaIslemleriModel>? value) {
    final _$actionInfo = _$_KasaHareketleriViewModelBaseActionController.startAction(
      name: '_KasaHareketleriViewModelBase.setObservableList',
    );
    try {
      return super.setObservableList(value);
    } finally {
      _$_KasaHareketleriViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addObservableList(List<KasaIslemleriModel>? list) {
    final _$actionInfo = _$_KasaHareketleriViewModelBaseActionController.startAction(
      name: '_KasaHareketleriViewModelBase.addObservableList',
    );
    try {
      return super.addObservableList(list);
    } finally {
      _$_KasaHareketleriViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
kasaIslemleriRequestModel: ${kasaIslemleriRequestModel},
paramData: ${paramData},
isScrollDown: ${isScrollDown},
observableList: ${observableList},
dovizAdi: ${dovizAdi},
bakiye: ${bakiye}
    ''';
  }
}
