// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hucre_takibi_stoklar_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HucreTakibiStoklarViewModel on _HucreTakibiStoklarViewModelBase, Store {
  late final _$hucreTakibiStoklarListesiAtom = Atom(
    name: '_HucreTakibiStoklarViewModelBase.hucreTakibiStoklarListesi',
    context: context,
  );

  @override
  ObservableList<HucreTakibiStoklarModel>? get hucreTakibiStoklarListesi {
    _$hucreTakibiStoklarListesiAtom.reportRead();
    return super.hucreTakibiStoklarListesi;
  }

  @override
  set hucreTakibiStoklarListesi(
    ObservableList<HucreTakibiStoklarModel>? value,
  ) {
    _$hucreTakibiStoklarListesiAtom.reportWrite(
      value,
      super.hucreTakibiStoklarListesi,
      () {
        super.hucreTakibiStoklarListesi = value;
      },
    );
  }

  late final _$requestModelAtom = Atom(
    name: '_HucreTakibiStoklarViewModelBase.requestModel',
    context: context,
  );

  @override
  HucreTakibiStoklarRequestModel get requestModel {
    _$requestModelAtom.reportRead();
    return super.requestModel;
  }

  @override
  set requestModel(HucreTakibiStoklarRequestModel value) {
    _$requestModelAtom.reportWrite(value, super.requestModel, () {
      super.requestModel = value;
    });
  }

  late final _$getDataAsyncAction = AsyncAction(
    '_HucreTakibiStoklarViewModelBase.getData',
    context: context,
  );

  @override
  Future<void> getData() {
    return _$getDataAsyncAction.run(() => super.getData());
  }

  late final _$_HucreTakibiStoklarViewModelBaseActionController =
      ActionController(
        name: '_HucreTakibiStoklarViewModelBase',
        context: context,
      );

  @override
  void setHucreTakibiStoklarListesi(List<HucreTakibiStoklarModel>? list) {
    final _$actionInfo = _$_HucreTakibiStoklarViewModelBaseActionController
        .startAction(
          name: '_HucreTakibiStoklarViewModelBase.setHucreTakibiStoklarListesi',
        );
    try {
      return super.setHucreTakibiStoklarListesi(list);
    } finally {
      _$_HucreTakibiStoklarViewModelBaseActionController.endAction(
        _$actionInfo,
      );
    }
  }

  @override
  String toString() {
    return '''
hucreTakibiStoklarListesi: ${hucreTakibiStoklarListesi},
requestModel: ${requestModel}
    ''';
  }
}
