// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payker_tahsilat_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PaykerTahsilatViewModel on _PaykerTahsilatViewModelBase, Store {
  late final _$isScrollDownAtom = Atom(
    name: '_PaykerTahsilatViewModelBase.isScrollDown',
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

  late final _$showBackViewAtom = Atom(
    name: '_PaykerTahsilatViewModelBase.showBackView',
    context: context,
  );

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

  late final _$isExpandedAtom = Atom(
    name: '_PaykerTahsilatViewModelBase.isExpanded',
    context: context,
  );

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

  late final _$paymentModelAtom = Atom(
    name: '_PaykerTahsilatViewModelBase.paymentModel',
    context: context,
  );

  @override
  PaymentModel get paymentModel {
    _$paymentModelAtom.reportRead();
    return super.paymentModel;
  }

  @override
  set paymentModel(PaymentModel value) {
    _$paymentModelAtom.reportWrite(value, super.paymentModel, () {
      super.paymentModel = value;
    });
  }

  late final _$paymentResponseModelAtom = Atom(
    name: '_PaykerTahsilatViewModelBase.paymentResponseModel',
    context: context,
  );

  @override
  PaymentResponseModel? get paymentResponseModel {
    _$paymentResponseModelAtom.reportRead();
    return super.paymentResponseModel;
  }

  @override
  set paymentResponseModel(PaymentResponseModel? value) {
    _$paymentResponseModelAtom.reportWrite(
      value,
      super.paymentResponseModel,
      () {
        super.paymentResponseModel = value;
      },
    );
  }

  late final _$taksitResponseModelAtom = Atom(
    name: '_PaykerTahsilatViewModelBase.taksitResponseModel',
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

  late final _$isInstallmentLoadingAtom = Atom(
    name: '_PaykerTahsilatViewModelBase.isInstallmentLoading',
    context: context,
  );

  @override
  bool get isInstallmentLoading {
    _$isInstallmentLoadingAtom.reportRead();
    return super.isInstallmentLoading;
  }

  @override
  set isInstallmentLoading(bool value) {
    _$isInstallmentLoadingAtom.reportWrite(
      value,
      super.isInstallmentLoading,
      () {
        super.isInstallmentLoading = value;
      },
    );
  }

  late final _$getInstallmentsAsyncAction = AsyncAction(
    '_PaykerTahsilatViewModelBase.getInstallments',
    context: context,
  );

  @override
  Future<void> getInstallments() {
    return _$getInstallmentsAsyncAction.run(() => super.getInstallments());
  }

  late final _$createPaymentAsyncAction = AsyncAction(
    '_PaykerTahsilatViewModelBase.createPayment',
    context: context,
  );

  @override
  Future<void> createPayment() {
    return _$createPaymentAsyncAction.run(() => super.createPayment());
  }

  late final _$_PaykerTahsilatViewModelBaseActionController = ActionController(
    name: '_PaykerTahsilatViewModelBase',
    context: context,
  );

  @override
  void setIsInstallmentLoading(bool value) {
    final _$actionInfo = _$_PaykerTahsilatViewModelBaseActionController
        .startAction(
          name: '_PaykerTahsilatViewModelBase.setIsInstallmentLoading',
        );
    try {
      return super.setIsInstallmentLoading(value);
    } finally {
      _$_PaykerTahsilatViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTaksitResponseModel(List<TaksitResponseModel>? value) {
    final _$actionInfo = _$_PaykerTahsilatViewModelBaseActionController
        .startAction(
          name: '_PaykerTahsilatViewModelBase.setTaksitResponseModel',
        );
    try {
      return super.setTaksitResponseModel(value);
    } finally {
      _$_PaykerTahsilatViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

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
  void setAmount(double? value) {
    final _$actionInfo = _$_PaykerTahsilatViewModelBaseActionController
        .startAction(name: '_PaykerTahsilatViewModelBase.setAmount');
    try {
      return super.setAmount(value);
    } finally {
      _$_PaykerTahsilatViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPaymentResponseModel(PaymentResponseModel? value) {
    final _$actionInfo = _$_PaykerTahsilatViewModelBaseActionController
        .startAction(
          name: '_PaykerTahsilatViewModelBase.setPaymentResponseModel',
        );
    try {
      return super.setPaymentResponseModel(value);
    } finally {
      _$_PaykerTahsilatViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setInstallment(int? value) {
    final _$actionInfo = _$_PaykerTahsilatViewModelBaseActionController
        .startAction(name: '_PaykerTahsilatViewModelBase.setInstallment');
    try {
      return super.setInstallment(value);
    } finally {
      _$_PaykerTahsilatViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setBankId(String? value) {
    final _$actionInfo = _$_PaykerTahsilatViewModelBaseActionController
        .startAction(name: '_PaykerTahsilatViewModelBase.setBankId');
    try {
      return super.setBankId(value);
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
showBackView: ${showBackView},
isExpanded: ${isExpanded},
paymentModel: ${paymentModel},
paymentResponseModel: ${paymentResponseModel},
taksitResponseModel: ${taksitResponseModel},
isInstallmentLoading: ${isInstallmentLoading}
    ''';
  }
}
