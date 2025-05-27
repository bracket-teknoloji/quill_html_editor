// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payker_tahsilat_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PaykerTahsilatViewModel on _PaykerTahsilatViewModelBase, Store {
  late final _$isScrollDownAtom =
      Atom(name: '_PaykerTahsilatViewModelBase.isScrollDown', context: context);

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

  late final _$cardNumberAtom =
      Atom(name: '_PaykerTahsilatViewModelBase.cardNumber', context: context);

  @override
  String get cardNumber {
    _$cardNumberAtom.reportRead();
    return super.cardNumber;
  }

  @override
  set cardNumber(String value) {
    _$cardNumberAtom.reportWrite(value, super.cardNumber, () {
      super.cardNumber = value;
    });
  }

  late final _$expiryDateAtom =
      Atom(name: '_PaykerTahsilatViewModelBase.expiryDate', context: context);

  @override
  String get expiryDate {
    _$expiryDateAtom.reportRead();
    return super.expiryDate;
  }

  @override
  set expiryDate(String value) {
    _$expiryDateAtom.reportWrite(value, super.expiryDate, () {
      super.expiryDate = value;
    });
  }

  late final _$cardHolderNameAtom = Atom(
      name: '_PaykerTahsilatViewModelBase.cardHolderName', context: context);

  @override
  String get cardHolderName {
    _$cardHolderNameAtom.reportRead();
    return super.cardHolderName;
  }

  @override
  set cardHolderName(String value) {
    _$cardHolderNameAtom.reportWrite(value, super.cardHolderName, () {
      super.cardHolderName = value;
    });
  }

  late final _$cvvCodeAtom =
      Atom(name: '_PaykerTahsilatViewModelBase.cvvCode', context: context);

  @override
  String get cvvCode {
    _$cvvCodeAtom.reportRead();
    return super.cvvCode;
  }

  @override
  set cvvCode(String value) {
    _$cvvCodeAtom.reportWrite(value, super.cvvCode, () {
      super.cvvCode = value;
    });
  }

  late final _$showBackViewAtom =
      Atom(name: '_PaykerTahsilatViewModelBase.showBackView', context: context);

  @override
  bool get showBackView {
    _$showBackViewAtom.reportRead();
    return super.showBackView;
  }

  @override
  set showBackView(bool value) {
    _$showBackViewAtom.reportWrite(value, super.showBackView, () {
      super.showBackView = value;
    });
  }

  late final _$isExpandedAtom =
      Atom(name: '_PaykerTahsilatViewModelBase.isExpanded', context: context);

  @override
  bool get isExpanded {
    _$isExpandedAtom.reportRead();
    return super.isExpanded;
  }

  @override
  set isExpanded(bool value) {
    _$isExpandedAtom.reportWrite(value, super.isExpanded, () {
      super.isExpanded = value;
    });
  }

  late final _$_PaykerTahsilatViewModelBaseActionController =
      ActionController(name: '_PaykerTahsilatViewModelBase', context: context);

  @override
  void setScrollDown(bool value) {
    final _$actionInfo = _$_PaykerTahsilatViewModelBaseActionController
        .startAction(name: '_PaykerTahsilatViewModelBase.setScrollDown');
    try {
      return super.setScrollDown(value);
    } finally {
      _$_PaykerTahsilatViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCardNumber(String value) {
    final _$actionInfo = _$_PaykerTahsilatViewModelBaseActionController
        .startAction(name: '_PaykerTahsilatViewModelBase.setCardNumber');
    try {
      return super.setCardNumber(value);
    } finally {
      _$_PaykerTahsilatViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setExpiryDate(String value) {
    final _$actionInfo = _$_PaykerTahsilatViewModelBaseActionController
        .startAction(name: '_PaykerTahsilatViewModelBase.setExpiryDate');
    try {
      return super.setExpiryDate(value);
    } finally {
      _$_PaykerTahsilatViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCardHolderName(String value) {
    final _$actionInfo = _$_PaykerTahsilatViewModelBaseActionController
        .startAction(name: '_PaykerTahsilatViewModelBase.setCardHolderName');
    try {
      return super.setCardHolderName(value);
    } finally {
      _$_PaykerTahsilatViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCvvCode(String value) {
    final _$actionInfo = _$_PaykerTahsilatViewModelBaseActionController
        .startAction(name: '_PaykerTahsilatViewModelBase.setCvvCode');
    try {
      return super.setCvvCode(value);
    } finally {
      _$_PaykerTahsilatViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setShowBackView(bool value) {
    final _$actionInfo = _$_PaykerTahsilatViewModelBaseActionController
        .startAction(name: '_PaykerTahsilatViewModelBase.setShowBackView');
    try {
      return super.setShowBackView(value);
    } finally {
      _$_PaykerTahsilatViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIsExtended(bool value) {
    final _$actionInfo = _$_PaykerTahsilatViewModelBaseActionController
        .startAction(name: '_PaykerTahsilatViewModelBase.setIsExtended');
    try {
      return super.setIsExtended(value);
    } finally {
      _$_PaykerTahsilatViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isScrollDown: ${isScrollDown},
cardNumber: ${cardNumber},
expiryDate: ${expiryDate},
cardHolderName: ${cardHolderName},
cvvCode: ${cvvCode},
showBackView: ${showBackView},
isExpanded: ${isExpanded}
    ''';
  }
}
