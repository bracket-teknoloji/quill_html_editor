// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paket_icerigi_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PaketIcerigiViewModel on _PaketIcerigiViewModelBase, Store {
  Computed<double>? _$toplamPaketMiktariComputed;

  @override
  double get toplamPaketMiktari => (_$toplamPaketMiktariComputed ??=
          Computed<double>(() => super.toplamPaketMiktari,
              name: '_PaketIcerigiViewModelBase.toplamPaketMiktari'))
      .value;

  late final _$paketIcerigiListesiAtom = Atom(
      name: '_PaketIcerigiViewModelBase.paketIcerigiListesi', context: context);

  @override
  ObservableList<PaketIcerigiModel>? get paketIcerigiListesi {
    _$paketIcerigiListesiAtom.reportRead();
    return super.paketIcerigiListesi;
  }

  @override
  set paketIcerigiListesi(ObservableList<PaketIcerigiModel>? value) {
    _$paketIcerigiListesiAtom.reportWrite(value, super.paketIcerigiListesi, () {
      super.paketIcerigiListesi = value;
    });
  }

  late final _$requestModelAtom =
      Atom(name: '_PaketIcerigiViewModelBase.requestModel', context: context);

  @override
  PaketlemeListesiRequestModel get requestModel {
    _$requestModelAtom.reportRead();
    return super.requestModel;
  }

  @override
  set requestModel(PaketlemeListesiRequestModel value) {
    _$requestModelAtom.reportWrite(value, super.requestModel, () {
      super.requestModel = value;
    });
  }

  late final _$getDataAsyncAction =
      AsyncAction('_PaketIcerigiViewModelBase.getData', context: context);

  @override
  Future<void> getData() {
    return _$getDataAsyncAction.run(() => super.getData());
  }

  late final _$deleteItemAsyncAction =
      AsyncAction('_PaketIcerigiViewModelBase.deleteItem', context: context);

  @override
  Future<GenericResponseModel<NetworkManagerMixin>> deleteItem(
      {int? id, int? paketID}) {
    return _$deleteItemAsyncAction
        .run(() => super.deleteItem(id: id, paketID: paketID));
  }

  late final _$_PaketIcerigiViewModelBaseActionController =
      ActionController(name: '_PaketIcerigiViewModelBase', context: context);

  @override
  void setPaketID(int id) {
    final _$actionInfo = _$_PaketIcerigiViewModelBaseActionController
        .startAction(name: '_PaketIcerigiViewModelBase.setPaketID');
    try {
      return super.setPaketID(id);
    } finally {
      _$_PaketIcerigiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPaketIcerigiListesi(List<PaketIcerigiModel>? list) {
    final _$actionInfo = _$_PaketIcerigiViewModelBaseActionController
        .startAction(name: '_PaketIcerigiViewModelBase.setPaketIcerigiListesi');
    try {
      return super.setPaketIcerigiListesi(list);
    } finally {
      _$_PaketIcerigiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
paketIcerigiListesi: ${paketIcerigiListesi},
requestModel: ${requestModel},
toplamPaketMiktari: ${toplamPaketMiktari}
    ''';
  }
}
