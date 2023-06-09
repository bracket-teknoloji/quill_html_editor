// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'temsilci_profil_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TemsilciProfilViewModel on _TemsilciProfilViewModelBase, Store {
  Computed<double>? _$getTodaySalesComputed;

  @override
  double get getTodaySales =>
      (_$getTodaySalesComputed ??= Computed<double>(() => super.getTodaySales,
              name: '_TemsilciProfilViewModelBase.getTodaySales'))
          .value;
  Computed<double>? _$getBuAyToplamComputed;

  @override
  double get getBuAyToplam =>
      (_$getBuAyToplamComputed ??= Computed<double>(() => super.getBuAyToplam,
              name: '_TemsilciProfilViewModelBase.getBuAyToplam'))
          .value;
  Computed<double>? _$getGecenAyToplamComputed;

  @override
  double get getGecenAyToplam => (_$getGecenAyToplamComputed ??=
          Computed<double>(() => super.getGecenAyToplam,
              name: '_TemsilciProfilViewModelBase.getGecenAyToplam'))
      .value;
  Computed<double>? _$getBuYilToplamComputed;

  @override
  double get getBuYilToplam =>
      (_$getBuYilToplamComputed ??= Computed<double>(() => super.getBuYilToplam,
              name: '_TemsilciProfilViewModelBase.getBuYilToplam'))
          .value;

  late final _$aciklamaAtom =
      Atom(name: '_TemsilciProfilViewModelBase.aciklama', context: context);

  @override
  String? get aciklama {
    _$aciklamaAtom.reportRead();
    return super.aciklama;
  }

  @override
  set aciklama(String? value) {
    _$aciklamaAtom.reportWrite(value, super.aciklama, () {
      super.aciklama = value;
    });
  }

  late final _$donemAtom =
      Atom(name: '_TemsilciProfilViewModelBase.donem', context: context);

  @override
  String? get donem {
    _$donemAtom.reportRead();
    return super.donem;
  }

  @override
  set donem(String? value) {
    _$donemAtom.reportWrite(value, super.donem, () {
      super.donem = value;
    });
  }

  late final _$donemKoduAtom =
      Atom(name: '_TemsilciProfilViewModelBase.donemKodu', context: context);

  @override
  int get donemKodu {
    _$donemKoduAtom.reportRead();
    return super.donemKodu;
  }

  @override
  set donemKodu(int value) {
    _$donemKoduAtom.reportWrite(value, super.donemKodu, () {
      super.donemKodu = value;
    });
  }

  late final _$temsilciProfilListAtom = Atom(
      name: '_TemsilciProfilViewModelBase.temsilciProfilList',
      context: context);

  @override
  ObservableList<TemsilciProfilModel>? get temsilciProfilList {
    _$temsilciProfilListAtom.reportRead();
    return super.temsilciProfilList;
  }

  @override
  set temsilciProfilList(ObservableList<TemsilciProfilModel>? value) {
    _$temsilciProfilListAtom.reportWrite(value, super.temsilciProfilList, () {
      super.temsilciProfilList = value;
    });
  }

  late final _$_TemsilciProfilViewModelBaseActionController =
      ActionController(name: '_TemsilciProfilViewModelBase', context: context);

  @override
  void setDonem(String? value) {
    final _$actionInfo = _$_TemsilciProfilViewModelBaseActionController
        .startAction(name: '_TemsilciProfilViewModelBase.setDonem');
    try {
      return super.setDonem(value);
    } finally {
      _$_TemsilciProfilViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDonemKodu(int value) {
    final _$actionInfo = _$_TemsilciProfilViewModelBaseActionController
        .startAction(name: '_TemsilciProfilViewModelBase.setDonemKodu');
    try {
      return super.setDonemKodu(value);
    } finally {
      _$_TemsilciProfilViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setAciklama(String? value) {
    final _$actionInfo = _$_TemsilciProfilViewModelBaseActionController
        .startAction(name: '_TemsilciProfilViewModelBase.setAciklama');
    try {
      return super.setAciklama(value);
    } finally {
      _$_TemsilciProfilViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTemsilciProfilList(List<TemsilciProfilModel>? value) {
    final _$actionInfo =
        _$_TemsilciProfilViewModelBaseActionController.startAction(
            name: '_TemsilciProfilViewModelBase.setTemsilciProfilList');
    try {
      return super.setTemsilciProfilList(value);
    } finally {
      _$_TemsilciProfilViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
aciklama: ${aciklama},
donem: ${donem},
donemKodu: ${donemKodu},
temsilciProfilList: ${temsilciProfilList},
getTodaySales: ${getTodaySales},
getBuAyToplam: ${getBuAyToplam},
getGecenAyToplam: ${getGecenAyToplam},
getBuYilToplam: ${getBuYilToplam}
    ''';
  }
}
