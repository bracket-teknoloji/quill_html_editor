// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payker_link_edit_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PaykerLinkEditViewModel on _PaykerLinkEditViewModelBase, Store {
  late final _$paykerLinkEditModelAtom = Atom(
    name: '_PaykerLinkEditViewModelBase.paykerLinkEditModel',
    context: context,
  );

  @override
  PaykerLinkEditModel get paykerLinkEditModel {
    _$paykerLinkEditModelAtom.reportRead();
    return super.paykerLinkEditModel;
  }

  @override
  set paykerLinkEditModel(PaykerLinkEditModel value) {
    _$paykerLinkEditModelAtom.reportWrite(value, super.paykerLinkEditModel, () {
      super.paykerLinkEditModel = value;
    });
  }

  late final _$taksitResponseModelAtom = Atom(
    name: '_PaykerLinkEditViewModelBase.taksitResponseModel',
    context: context,
  );

  @override
  ObservableList<TaksitResponseModel>? get taksitResponseModel {
    _$taksitResponseModelAtom.reportRead();
    return super.taksitResponseModel;
  }

  @override
  set taksitResponseModel(ObservableList<TaksitResponseModel>? value) {
    _$taksitResponseModelAtom.reportWrite(value, super.taksitResponseModel, () {
      super.taksitResponseModel = value;
    });
  }

  late final _$selectedTaksitlerAtom = Atom(
    name: '_PaykerLinkEditViewModelBase.selectedTaksitler',
    context: context,
  );

  @override
  ObservableList<Taksitler> get selectedTaksitler {
    _$selectedTaksitlerAtom.reportRead();
    return super.selectedTaksitler;
  }

  @override
  set selectedTaksitler(ObservableList<Taksitler> value) {
    _$selectedTaksitlerAtom.reportWrite(value, super.selectedTaksitler, () {
      super.selectedTaksitler = value;
    });
  }

  late final _$getInstallmentsAsyncAction = AsyncAction(
    '_PaykerLinkEditViewModelBase.getInstallments',
    context: context,
  );

  @override
  Future<void> getInstallments() {
    return _$getInstallmentsAsyncAction.run(() => super.getInstallments());
  }

  late final _$saveLinkAsyncAction = AsyncAction(
    '_PaykerLinkEditViewModelBase.saveLink',
    context: context,
  );

  @override
  Future<bool> saveLink() {
    return _$saveLinkAsyncAction.run(() => super.saveLink());
  }

  late final _$updateLinkAsyncAction = AsyncAction(
    '_PaykerLinkEditViewModelBase.updateLink',
    context: context,
  );

  @override
  Future<bool> updateLink() {
    return _$updateLinkAsyncAction.run(() => super.updateLink());
  }

  late final _$_PaykerLinkEditViewModelBaseActionController = ActionController(
    name: '_PaykerLinkEditViewModelBase',
    context: context,
  );

  @override
  void setSelectedTaksitler(Taksitler taksit, bool isSelected) {
    final _$actionInfo = _$_PaykerLinkEditViewModelBaseActionController.startAction(
      name: '_PaykerLinkEditViewModelBase.setSelectedTaksitler',
    );
    try {
      return super.setSelectedTaksitler(taksit, isSelected);
    } finally {
      _$_PaykerLinkEditViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTaksitler(List<TaksitResponseModel>? taksitler) {
    final _$actionInfo = _$_PaykerLinkEditViewModelBaseActionController.startAction(
      name: '_PaykerLinkEditViewModelBase.setTaksitler',
    );
    try {
      return super.setTaksitler(taksitler);
    } finally {
      _$_PaykerLinkEditViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setBayi(PaykerFirmaModel model) {
    final _$actionInfo = _$_PaykerLinkEditViewModelBaseActionController.startAction(
      name: '_PaykerLinkEditViewModelBase.setBayi',
    );
    try {
      return super.setBayi(model);
    } finally {
      _$_PaykerLinkEditViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTutar(double? tutar) {
    final _$actionInfo = _$_PaykerLinkEditViewModelBaseActionController.startAction(
      name: '_PaykerLinkEditViewModelBase.setTutar',
    );
    try {
      return super.setTutar(tutar);
    } finally {
      _$_PaykerLinkEditViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEmail(String? email) {
    final _$actionInfo = _$_PaykerLinkEditViewModelBaseActionController.startAction(
      name: '_PaykerLinkEditViewModelBase.setEmail',
    );
    try {
      return super.setEmail(email);
    } finally {
      _$_PaykerLinkEditViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setUnvan(String? unvan) {
    final _$actionInfo = _$_PaykerLinkEditViewModelBaseActionController.startAction(
      name: '_PaykerLinkEditViewModelBase.setUnvan',
    );
    try {
      return super.setUnvan(unvan);
    } finally {
      _$_PaykerLinkEditViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setBitTar(DateTime? bitTar) {
    final _$actionInfo = _$_PaykerLinkEditViewModelBaseActionController.startAction(
      name: '_PaykerLinkEditViewModelBase.setBitTar',
    );
    try {
      return super.setBitTar(bitTar);
    } finally {
      _$_PaykerLinkEditViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setModel(PaykerLinkEditModel model) {
    final _$actionInfo = _$_PaykerLinkEditViewModelBaseActionController.startAction(
      name: '_PaykerLinkEditViewModelBase.setModel',
    );
    try {
      return super.setModel(model);
    } finally {
      _$_PaykerLinkEditViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setKullanimSayisi(int? kullanimSayisi) {
    final _$actionInfo = _$_PaykerLinkEditViewModelBaseActionController.startAction(
      name: '_PaykerLinkEditViewModelBase.setKullanimSayisi',
    );
    try {
      return super.setKullanimSayisi(kullanimSayisi);
    } finally {
      _$_PaykerLinkEditViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
paykerLinkEditModel: ${paykerLinkEditModel},
taksitResponseModel: ${taksitResponseModel},
selectedTaksitler: ${selectedTaksitler}
    ''';
  }
}
